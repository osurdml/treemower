#include <decisiontree.hpp>

DecisionTree::DecisionTree(int num_lookahead)
{
	this->num_lookahead = num_lookahead;

	vx_t v_start = boost::add_vertex(g);
	current_vx = v_start;
	outer.push_back(current_vx);
}

void DecisionTree::PruneRecursive(vx_t from_vx)
{
	std::cout << "Pruning vertex " << from_vx << " with " << boost::out_degree(from_vx, g) << " descendants" << std::endl;

	// Recurse on any descendant vertices and edges.
	if (boost::out_degree(from_vx, g) > 0) {
		typedef boost::graph_traits<Graph>::out_edge_iterator edge_iter;
		std::pair<edge_iter, edge_iter> edges = boost::out_edges(from_vx, g);
		std::cout << *edges.first << " " << *edges.second << std::endl;

		// Create removal list. If we iterate over the edge iterator while
		// removing edges, unhappy things happen.
		std::vector<Graph::edge_descriptor> rl;
		for(; edges.first != edges.second; ++edges.first) {
			rl.push_back(*edges.first);
		}

		for (std::vector<Graph::edge_descriptor>::iterator it=rl.begin(); it!=rl.end(); ++it) {
			vx_t target_vx = boost::target(*it, g);

			DecisionTree::PruneRecursive(target_vx);
			if (target_vx != best_ancestor_vx) {
				// Remove target vertex and edge (edge first!)
				std::cout << "Removing " << *it << std::endl;
				boost::remove_edge(*it, g);
				boost::remove_vertex(target_vx, g);
			}
			else {
				std::cout << "Not removing " << *it << std::endl;
			}
		}
	}
}

long DecisionTree::MowTrees(void)
{
	long score = 0;
	int inc = 0;

	// Loop until outer is empty.
	while (inc != 2) {
		inc++;
		std::cout << "Current: " << current_vx << std::endl;
		for (int i=0; i<num_lookahead; i++) {
			long iter_num = outer.size();
			// Iterate over outer vertices.
			for (long j=0; j<iter_num; j++) {
				// Generate branches
				// TODO(yoos): Generate sensible vertices from costmap.
				int num_branches = 4;
				for (int k=0; k<num_branches; k++) {
					vx_t v_next = boost::add_vertex(g);
					boost::add_edge(outer.front(), v_next, g);
					g[v_next].parent = outer.front();
					g[v_next].score = j+k;
					outer.push_back(v_next);
					std::cout << "Created " << v_next << std::endl;
				}

				// Remove parent
				outer.pop_front();
			}
			printf("%lu outer vertices to process after step %d\n", outer.size(), i+1);
		}
		printf("Done looking ahead %d steps.\n", num_lookahead);

		// Find the best end vertex.
		vx_t best_vx = outer.front();
		for (std::list<vx_t>::iterator it=outer.begin(); it!=outer.end(); ++it) {
			if (g[*it].score > g[best_vx].score) {
				best_vx = *it;
			}
		}
		std::cout << "Best score found: " << g[best_vx].score << " at " << best_vx << std::endl;

		// Step into best branch and prune the rest.
		best_ancestor_vx = best_vx;
		for (int i=0; i<num_lookahead-1; i++) {
			best_ancestor_vx = g[best_ancestor_vx].parent;
		}
		std::cout << "Pruning all branches except " << best_ancestor_vx << std::endl;

		DecisionTree::PruneRecursive(current_vx);
		current_vx = best_ancestor_vx;
		outer.clear();
		outer.push_back(current_vx);

		score += g[current_vx].score;
	}

	// Return number of free outer vertices.
	return score;
}

long DecisionTree::MowLawn(void)
{
	long score = 0;

	return score;
}

