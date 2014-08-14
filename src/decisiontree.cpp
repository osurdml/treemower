#include <decisiontree.hpp>

#include <boost/bind.hpp>

DecisionTree::DecisionTree(const char *cm_filename, long cm_rows, long cm_cols, long num_lookahead) :
	cm(cm_filename, cm_rows, cm_cols, num_lookahead)
{
	this->num_lookahead = num_lookahead;

	total_score = 0.0;

	// Add base vertex.
	vx_t start_vx = boost::add_vertex(dTree);
	dTree[start_vx].parent = 0;
	dTree[start_vx].state.loc.x = 0;
	dTree[start_vx].state.loc.y = 0;
	current_vx = start_vx;
	//frontier.push_back(current_vx);
}

long DecisionTree::LookAhead(vx_t source_vx, long depth)
{
	// DEBUG
	//long x = dTree[source_vx].state.loc.x;
	//long y = dTree[source_vx].state.loc.y;
	//std::cout << "LookAhead() depth: " << depth << "  (" << x << ", " << y << ")  score: " << cm.getScore(x,y) << "  ";

	// Run algorithm. This will generate child vertices and update the costmap.
	std::vector<state_t> future_states;
	dTree[source_vx].state.score = Explore(dTree[source_vx].state, &future_states);
	total_score += dTree[source_vx].state.score;   // TODO(yoos): What is this score?

	long num_children = 0;

	if (depth < num_lookahead) {
		// Add all future states to graph.
		for (std::vector<state_t>::iterator it=future_states.begin(); it!=future_states.end(); it++) {
			vx_t new_vx = boost::add_vertex(dTree);
			edge_t new_edge = boost::add_edge(source_vx, new_vx, dTree).first;
			dTree[new_vx].parent = source_vx;
			dTree[new_vx].state = *it;
			dTree[new_edge].action = 0;   // TODO(yoos)

			// Recurse on child.
			cm.Step(1);
			num_children += LookAhead(new_vx, depth+1) + 1;   // This child plus its children
			cm.Step(-1);
		}
	}

	return num_children;
}

void DecisionTree::Prune(vx_t source_vx, vx_t exclude_vx)
{
	// Recurse on any descendant vertices and edges.
	if (boost::out_degree(source_vx, dTree) > 0) {
		//std::cout << indent << "Pruning vertex " << source_vx << " with " << boost::out_degree(source_vx, dTree) << " descendants" << std::endl;
		std::pair<edge_iter, edge_iter> edges = boost::out_edges(source_vx, dTree);

		// Create removal list. If we iterate over the edge iterator while
		// removing edges, unhappy things happen.
		std::list<Graph::edge_descriptor> rl;
		for(; edges.first != edges.second; ++edges.first) {
			rl.push_back(*edges.first);
		}

		for (std::list<Graph::edge_descriptor>::iterator it=rl.begin(); it!=rl.end(); ++it) {
			vx_t target_vx = boost::target(*it, dTree);

			DecisionTree::Prune(target_vx, exclude_vx);
			if (target_vx != exclude_vx) {
				// Remove target vertex and edge (edge first!)
				boost::remove_edge(*it, dTree);
				boost::remove_vertex(target_vx, dTree);
			}
		}
	}
}

void DecisionTree::PrintDebug(void)
{
	// General info
	std::cout << "Graph contains " << boost::num_edges(dTree) << " edges, " << boost::num_vertices(dTree) << " vertices." << std::endl;

	// Print path
	std::cout << "Path so far:\n";
	vx_t print_vx = current_vx;
	location_t loc = dTree[current_vx].state.loc;
	while (dTree[print_vx].parent != 0) {
		std::cout << print_vx << " (" << loc.x << ", " << loc.y << ")\n";
		print_vx = dTree[print_vx].parent;
		loc = dTree[print_vx].state.loc;
	}
	std::cout << print_vx << " (" << loc.x << ", " << loc.y << ")\n";   // TODO(yoos): Remove redundancy.
	std::cout << std::endl;
}

float DecisionTree::Mow(void)
{
	while (LookAhead(current_vx, 0) > 0) {
		vx_t best_vx = FindBest(current_vx);
		Prune(current_vx, best_vx);   // Prune all nodes excluding best_vx
		current_vx = best_vx;

		// Step costmap forward.
		cm.Step(1);
		// TODO(yoos): Clean this up.
		std::vector<state_t> future_states;
		dTree[current_vx].state.score = Explore(dTree[current_vx].state, &future_states);

		// DEBUG
		//cm.PrintDebug();
	}

	std::cout << std::endl;
	PrintDebug();

	return total_score;
}

