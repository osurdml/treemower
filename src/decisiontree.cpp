#include <decisiontree.hpp>

#include <boost/bind.hpp>

DecisionTree::DecisionTree(int num_lookahead, StuntzHuntz *sh_p)
{
	this->num_lookahead = num_lookahead;
	//dt_update = update_p;

	//getActions = &sh->getActions;
	sh = sh_p;

	vx_t v_start = boost::add_vertex(g);
	current_vx = v_start;
	frontier.push_back(current_vx);
}

void DecisionTree::PruneRecursive(vx_t source_vx, int rec_depth)
{
	char indent[rec_depth*2];
	for (int i=0; i<rec_depth*2; i++) sprintf(indent+i, " ");

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

			DecisionTree::PruneRecursive(target_vx, rec_depth+1);
			if (target_vx != best_ancestor_vx) {
				// Remove target vertex and edge (edge first!)
				//std::cout << indent << "Removing " << *it << std::endl;
				boost::remove_edge(*it, g);
				boost::remove_vertex(target_vx, g);
			}
			//else {
			//	std::cout << indent << "Not removing " << *it << std::endl;
			//}
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
	// Reset
	long score = 0;

	// Loop until frontier is empty.
	//while (frontier.size() > 0) {
	int arst;
	for (arst=0; arst<5; arst++) {
		std::cout << "\n\nLOOP\n\n";
		for (int i=0; i<num_lookahead; i++) {
			std::cout << "Lookahead " << i << ", ";

			// Iterate over frontier vertices.
			long frontier_size = frontier.size();
			for (long j=0; j<frontier_size; j++) {
				std::cout << "frontier " << j << "  :  ";
				// Get decisions from algorithm.
				std::vector<state_t> states;
				sh->getActions(g[frontier.front()].state, &states);

				// Add all possible states.
				for (std::vector<state_t>::iterator it=states.begin(); it!=states.end(); it++) {
					vx_t v_new = boost::add_vertex(g);
					edge_t e_new = boost::add_edge(frontier.front(), v_new, g).first;
					g[v_new].parent = frontier.front();
					g[v_new].state = *it;
					g[e_new].action = 0;   // TODO(yoos)
					frontier.push_back(v_new);
				}

				// Remove parent from frontier list.
				frontier.pop_front();

				// Reset alg.
				sh->resetTmp();
			}

			sh->resetLA();
			//printf("%lu frontier vertices to process after step %d\n", frontier.size(), i+1);
		}
		//printf("Done looking ahead %d steps.\n", num_lookahead);

		// Find the best end vertex.
		vx_t best_vx = frontier.front();
		//std::cout << "Frontier size: " << frontier.size() << std::endl;
		for (std::list<vx_t>::iterator it=frontier.begin(); it!=frontier.end(); it++) {
			if (g[*it].state.score > g[best_vx].state.score) {
				best_vx = *it;
			}
		}
		//std::cout << "Best score found: " << g[best_vx].state.score << " at " << best_vx << std::endl;

		// Step into best branch and prune the rest.
		best_ancestor_vx = best_vx;
		for (int i=0; i<num_lookahead-1; i++) {
			best_ancestor_vx = g[best_ancestor_vx].parent;
		}
		//std::cout << "Pruning all branches except " << best_ancestor_vx << std::endl;

		DecisionTree::PruneRecursive(current_vx, 0);
		current_vx = best_ancestor_vx;
		frontier.clear();
		frontier.push_back(current_vx);

		sh->setAction(g[current_vx].state);
		score += g[current_vx].state.score;
	};

	std::cout << std::endl;
	print_debug();

	// Return number of free frontier vertices.
	return score;
}

