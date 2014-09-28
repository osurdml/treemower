#include <decisiontree.hpp>

#include <fstream>
#include <iostream>
#include <iomanip>

#include <boost/bind.hpp>

DecisionTree::DecisionTree(const char *im_filename, long num_lookahead, float budget, float rand_frac) :
	im(im_filename, im_filename, im_filename, im_filename, num_lookahead)   // TODO(yoos): Actually use separate data
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
	float reduce_factor = 1.0;
	float dist;
	for (int dx=-SAMPLE_RADIUS; dx<=SAMPLE_RADIUS; dx++) {
		for (int dy=-SAMPLE_RADIUS; dy<=SAMPLE_RADIUS; dy++) {
			dist = sqrt(pow(dx,2)+pow(dy,2));
			if (dist <= SAMPLE_RADIUS) {
				reduce_factor = 1.0 - UNCERTAINTY_REDUCE_FACTOR * pow(UNCERTAINTY_REDUCE_EXP,(int)dist);
				im.set_score(x+dx,y+dy, reduce_factor * im.score(x+dx,y+dy));
			}
		}
	}
}

vx_t DecisionTree::SampleToTarget(vx_t source_vx, state_t target_state)
{
	static long src_x, src_y, tgt_x, tgt_y, num_steps;
	static float dx, dy, dist;
	src_x = dTree[source_vx].state.loc.x;
	src_y = dTree[source_vx].state.loc.y;
	tgt_x = target_state.loc.x;
	tgt_y = target_state.loc.y;
	dx = tgt_x - src_x;
	dy = tgt_y - src_y;
	dist = sqrt(pow(dx,2)+pow(dy,2));
	num_steps = fmax(1, (dist+0.5)/SAMPLE_INTERVAL);

	vx_t parent_vx;
	vx_t new_vx = source_vx;

	for (long i=0; i<num_steps; i++) {
		// Step forward.
		src_x = dTree[source_vx].state.loc.x + dx*(i+1)/num_steps;
		src_y = dTree[source_vx].state.loc.y + dy*(i+1)/num_steps;
		parent_vx = new_vx;
		new_vx = boost::add_vertex(dTree);

		// Add new stuff to graph.
		boost::add_edge(parent_vx, new_vx, dTree);
		dTree[new_vx].parent = parent_vx;
		dTree[new_vx].state = (state_t) {{src_x,src_y}, CalcScore(&dTree[parent_vx].state), dTree[parent_vx].state.budget-dist/num_steps};

		// The following is to do whatever the explorer normally does to update
		// the state. Of course, it unnecessarily generates new states, so
		// there's room for improvement here.
		std::vector<state_t> fs;
		Explore(&dTree[parent_vx].state, &fs);
	}

	// We shouldn't have floating point errors.
	assert(dTree[new_vx].state.loc.x == target_state.loc.x);
	assert(dTree[new_vx].state.loc.y == target_state.loc.y);

	return new_vx;
}

float DecisionTree::Mow(void)
{
	while (dTree[current_vx].state.budget > SAMPLE_INTERVAL) {
		// DEBUG
		if (PRINT_DEBUG) {
			std::cout << std::setw(8) << dTree[current_vx].state.budget;
			std::cout << "\n";
		}

		LookAhead(current_vx, num_lookahead);
		state_t target_state = dTree[FindBest(current_vx)].state;   // Some location way out there.
		Prune(current_vx, 0);   // Prune all branches

		// Step costmap forward.
		im.Step(1);

		// Sample along path to target.
		current_vx = SampleToTarget(current_vx, target_state);
	}

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
	float score = dTree[root_vx].state.score;
	float budget = dTree[root_vx].state.budget;
	ofs << "X,Y,Budget,Score\n";
	ofs << loc.x << ',' << loc.y << ',' << budget << ',' << score << "\n";

	while (boost::out_degree(print_vx, dTree) != 0) {
		edge_t e = *boost::out_edges(print_vx, dTree).first;
		print_vx = boost::target(e, dTree);
		loc = dTree[print_vx].state.loc;
		score = dTree[print_vx].state.score;
		budget = dTree[print_vx].state.budget;
		ofs << loc.x << ',' << loc.y << ',' << budget << ',' << score << "\n";
	}

	ofs.close();
}

