#include <decisiontree.hpp>

#include <fstream>
#include <iostream>
#include <iomanip>

#include <boost/bind.hpp>

DecisionTree::DecisionTree(const char *im_filename, long im_rows, long im_cols, long num_lookahead, float budget, float rand_frac) :
	im(im_filename, im_filename, im_filename, im_filename, im_rows, im_cols, num_lookahead)   // TODO(yoos): Actually use separate data
{
	srand(3);

	this->num_lookahead = num_lookahead;
	this->random_choice_frac = rand_frac;

	// Add base vertex.
	root_vx = boost::add_vertex(dTree);
	dTree[root_vx].parent = 0;
	dTree[root_vx].state.loc.x = START_X;
	dTree[root_vx].state.loc.y = START_Y;
	dTree[root_vx].state.score = 0;
	dTree[root_vx].state.budget = budget;
	current_vx = root_vx;
	//frontier.push_back(current_vx);
}

long DecisionTree::LookAhead(vx_t source_vx, long depth)
{
	// DEBUG
	//long x = dTree[source_vx].state.loc.x;
	//long y = dTree[source_vx].state.loc.y;
	//std::cout << "LookAhead() depth: " << depth << "  (" << x << ", " << y << ")  score: " << im.score(x,y) << "  \n";

	// Use new map.
	im.Step(1);

	// Run algorithm. This will generate child vertices and update the costmap.
	std::vector<state_t> future_states;
	Explore(&dTree[source_vx].state, &future_states);

	// Randomly remove some, but not all, future states.
	long num_remove = std::min((long) future_states.size()-1, (long) ((1-random_choice_frac)*future_states.size()));
	for (int i=0; i<num_remove; i++) {
		future_states.erase(future_states.begin() + (rand() % future_states.size()));
	}

	long num_children = 0;
	// Add all future states to graph.
	for (std::vector<state_t>::iterator it=future_states.begin(); it!=future_states.end(); it++) {
		vx_t new_vx = boost::add_vertex(dTree);
		boost::add_edge(source_vx, new_vx, dTree);
		dTree[new_vx].parent = source_vx;
		dTree[new_vx].state = *it;
		//edge_t new_edge = boost::add_edge(source_vx, new_vx, dTree).first;
		//dTree[new_edge].action = 0;   // TODO(yoos)

		// Recurse on child.
		if (depth > 1) {
			num_children += LookAhead(new_vx, depth-1) + 1;   // This child plus its children
		}
	}

	// Revert to old map.
	im.Step(-1);

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
		for (; edges.first != edges.second; ++edges.first) {
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

	vx_t print_vx = root_vx;
	location_t loc = dTree[root_vx].state.loc;
	std::cout << print_vx << " (" << loc.x << ", " << loc.y << ")\n";

	while (boost::out_degree(print_vx, dTree) != 0) {
		edge_t e = *boost::out_edges(print_vx, dTree).first;
		print_vx = boost::target(e, dTree);
		loc = dTree[print_vx].state.loc;
		std::cout << print_vx << " (" << loc.x << ", " << loc.y << ")\n";
	}

	std::cout << std::endl;
}

float DecisionTree::CalcScore(const state_t *state)
{
	long x = state->loc.x;
	long y = state->loc.y;

	return state->score + im.score(x, y, SAMPLE_RADIUS);
}

void DecisionTree::DepreciateScore(const state_t *state)
{
	long x = state->loc.x;
	long y = state->loc.y;

	// Depreciate score per distance from current location.
	float reduce_factor = 0.0;
	float dist;
	for (int i=-SAMPLE_RADIUS; i<=SAMPLE_RADIUS; i++) {
		for (int j=-SAMPLE_RADIUS; j<=SAMPLE_RADIUS; j++) {
			dist = sqrt(pow(i,2)+pow(j,2));
			if (dist <= SAMPLE_RADIUS) {
				reduce_factor = UNCERTAINTY_REDUCE_FACTOR;
			}
			reduce_factor *= pow(UNCERTAINTY_REDUCE_EXP,(int)dist);
			im.set_score(x+i,y+j, reduce_factor * im.score(x+i,y+j));
		}
	}
}

float DecisionTree::Mow(void)
{
	while (dTree[current_vx].state.budget > 0) {
		// DEBUG
		std::cout << std::setw(8) << dTree[current_vx].state.budget;
		std::cout << "\n";

		LookAhead(current_vx, num_lookahead);
		vx_t best_vx = FindBest(current_vx);
		Prune(current_vx, best_vx);   // Prune all nodes excluding best_vx
		current_vx = best_vx;

		// Step costmap forward.
		im.Step(1);
		// TODO(yoos): Clean this up. This runs whatever the user wants to
		// change about our current state and obviously disregards the
		// generated future states.
		std::vector<state_t> future_states;
		Explore(&dTree[current_vx].state, &future_states);

		// DEBUG
		//state_t *s = &dTree[current_vx].state;
		//std::cout << "(" << s->loc.x << ", " << s->loc.y << "): " << s->score << "\n";
		//im.PrintDebug();

		//usleep(100000);
		//std::cout << ".";
	}

	//PrintDebug();

	return dTree[current_vx].state.score;
}

void DecisionTree::Export(const char *out_filename)
{
	// Open output file
	std::ofstream ofs(out_filename);
	if (!ofs)
	{
		std::cerr << "Failed to open file " << out_filename << std::endl;
	}

	//std::cout << "Exporting " << boost::num_edges(dTree) << " edges, " << boost::num_vertices(dTree) << " vertices." << std::endl;

	// Write to file.
	vx_t print_vx = root_vx;
	location_t loc = dTree[root_vx].state.loc;
	ofs << loc.x << "," << loc.y << "\n";

	while (boost::out_degree(print_vx, dTree) != 0) {
		edge_t e = *boost::out_edges(print_vx, dTree).first;
		print_vx = boost::target(e, dTree);
		loc = dTree[print_vx].state.loc;
		ofs << loc.x << "," << loc.y << "\n";
	}

	ofs.close();
}

