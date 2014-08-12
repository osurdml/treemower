#include <decisiontree.hpp>

#include <boost/bind.hpp>

DecisionTree::DecisionTree(const char *cm_filename, long cm_rows, long cm_cols, float (*SomeAlg)(state_t, CostMap*, std::vector<state_t>*), long num_lookahead) :
	cm(cm_filename, cm_rows, cm_cols, num_lookahead)
{
	this->num_lookahead = num_lookahead;
	this->SomeAlg = SomeAlg;

	total_score = 0.0;

	// Add base vertex.
	vx_t start_vx = boost::add_vertex(g);
	g[start_vx].parent = 0;
	g[start_vx].state.loc.x = 0;
	g[start_vx].state.loc.y = 0;
	current_vx = start_vx;
	//frontier.push_back(current_vx);
}

long DecisionTree::LookAhead(vx_t source_vx, long depth)
{
	long x = g[source_vx].state.loc.x;
	long y = g[source_vx].state.loc.y;
	std::cout << "LookAhead() " << x << ", " << y << ", " << cm.getScore(x,y) << "  ";

	// Run algorithm. This will generate child vertices and update the costmap.
	std::vector<state_t> future_states;
	g[source_vx].state.score = (*SomeAlg)(g[source_vx].state, &cm, &future_states);
	total_score += g[source_vx].state.score;   // TODO(yoos): What is this score?

	long num_children = 0;

	if (depth < num_lookahead) {
		// Add all future states to graph.
		for (std::vector<state_t>::iterator it=future_states.begin(); it!=future_states.end(); it++) {
			vx_t new_vx = boost::add_vertex(g);
			edge_t new_edge = boost::add_edge(source_vx, new_vx, g).first;
			g[new_vx].parent = source_vx;
			g[new_vx].state = *it;
			g[new_edge].action = 0;   // TODO(yoos)
		}

		// Recurse on children.
		if (boost::out_degree(source_vx, g) > 0) {
			std::pair<edge_iter, edge_iter> edges = boost::out_edges(source_vx, g);
			for(; edges.first != edges.second; edges.first++) {
				vx_t child_vx = boost::target(*edges.first, g);

				// Add to score, thereby finding the vertex with the highest cumulative potential utility.
				num_children += LookAhead(child_vx, depth+1);
			}
		}
	}

	// Undo one step.
	cm.Undo(1);

	return num_children;
}

vx_t DecisionTree::FindBest(vx_t source_vx)
{
	vx_t best_vx = source_vx;
	float best_score = g[source_vx].state.score;

	if (boost::out_degree(source_vx, g) > 0) {
		std::pair<edge_iter, edge_iter> edges = boost::out_edges(source_vx, g);
		for(; edges.first != edges.second; edges.first++) {
			vx_t child_vx = boost::target(*edges.first, g);
			float child_score = g[FindBest(child_vx)].state.score;
			if (child_score > best_score) {
				best_vx = child_vx;
				best_score = child_score;
			}
		}
	}

	return best_vx;
}

void DecisionTree::Prune(vx_t source_vx, vx_t exclude_vx)
{
	// Recurse on any descendant vertices and edges.
	if (boost::out_degree(source_vx, g) > 0) {
		//std::cout << indent << "Pruning vertex " << source_vx << " with " << boost::out_degree(source_vx, g) << " descendants" << std::endl;
		std::pair<edge_iter, edge_iter> edges = boost::out_edges(source_vx, g);

		// Create removal list. If we iterate over the edge iterator while
		// removing edges, unhappy things happen.
		std::list<Graph::edge_descriptor> rl;
		for(; edges.first != edges.second; ++edges.first) {
			rl.push_back(*edges.first);
		}

		for (std::list<Graph::edge_descriptor>::iterator it=rl.begin(); it!=rl.end(); ++it) {
			vx_t target_vx = boost::target(*it, g);

			DecisionTree::Prune(target_vx, exclude_vx);
			if (target_vx != exclude_vx) {
				// Remove target vertex and edge (edge first!)
				boost::remove_edge(*it, g);
				boost::remove_vertex(target_vx, g);
			}
		}
	}
}

void DecisionTree::print_debug(void)
{
	// General info
	std::cout << "Graph contains " << boost::num_edges(g) << " edges, " << boost::num_vertices(g) << " vertices." << std::endl;

	// Print path
	std::cout << "Path so far:\n";
	vx_t print_vx = current_vx;
	location_t loc = g[current_vx].state.loc;
	while (g[print_vx].parent != 0) {
		std::cout << print_vx << " (" << loc.x << ", " << loc.y << ")\n";
		print_vx = g[print_vx].parent;
		loc = g[print_vx].state.loc;
	}
	std::cout << print_vx << " (" << loc.x << ", " << loc.y << ")\n";   // TODO(yoos): Remove redundancy.
	std::cout << std::endl;
}

long DecisionTree::Mow(void)
{
	for (int i=0; i<4; i++) {
		LookAhead(current_vx, 0);
		vx_t best_vx = FindBest(current_vx);
		Prune(current_vx, best_vx);   // Prune all nodes excluding best_vx
		current_vx = best_vx;
	}

	std::cout << std::endl;
	print_debug();

	return total_score;
}

