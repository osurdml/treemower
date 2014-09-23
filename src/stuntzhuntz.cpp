#include <stuntzhuntz.hpp>

#include <iostream>

StuntzHuntz::StuntzHuntz(const char *im_filename, long rows, long cols, long lookahead, float budget, float rand_frac) :
	DecisionTree(im_filename, rows, cols, lookahead, budget, rand_frac)
{
}

long StuntzHuntz::AddDecision(std::vector<state_t> *states, long x, long y, float score, float budget)
{
	const int CHOICE_PER = 100;   // Probability in percent that a generated decision will be added to future states.

	if ((rand() % 100) < CHOICE_PER) {
		state_t d = {{x, y}, score, budget};
		states->push_back(d);
		return 1;
	}

	return 0;
}

long StuntzHuntz::AddDecisions(state_t *state, float step_dist, float branch_num, std::vector<state_t> *states)
{
	static long x, y, dx, dy, nc;
	x = state->loc.x;
	y = state->loc.y;
	nc = 0;

	for (int i=0; i<branch_num; i++) {
		dx = (step_dist * cos(2*M_PI/branch_num*i));
		dy = (step_dist * sin(2*M_PI/branch_num*i));
		if (im.depth(x+dx, y+dy) >= 0) {
			nc += AddDecision(states, x+dx, y+dy, CalcScore(state), state->budget-step_dist);
		}
	}

	return nc;
}


long StuntzHuntz::Explore(state_t *state, std::vector<state_t> *states)
{
	static long x, y, nc;
	static float step_dist, branch_num;
	x = state->loc.x;
	y = state->loc.y;
	nc = 0;
	step_dist = SAMPLE_INTERVAL;
	branch_num = BRANCH_FACTOR*sqrt(step_dist);

	if (true) {
		// Calculate step distance based on nearby scores.
		step_dist = fmax(fmin(5/im.score(x,y,SAMPLE_RADIUS), 400), SAMPLE_INTERVAL);
		branch_num = BRANCH_FACTOR * sqrt(step_dist);   // Scale with square root of step_dist. Scaling linearly costs too much time.

		// TODO(yoos): Okay, might want to move step_dist back to decisiontree if this works.
		while (states->size() == 0) {
			nc = 0;
			// Generate future states by distance and angle.
			std::vector<state_t> probe_states;
			nc += AddDecisions(state, step_dist, branch_num, &probe_states);

			// Check if probed state satisfies criteria (TODO: what?)
			for (std::vector<state_t>::iterator it=probe_states.begin(); it!=probe_states.end(); it++) {
				if (im.score(it->loc.x, it->loc.y, SAMPLE_RADIUS) > UNCERTAINTY_THRESHOLD) {
					states->push_back(*it);
				}
			}

			// Increase step_dist to try and find better pasture.
			step_dist += SAMPLE_INTERVAL;
			branch_num = BRANCH_FACTOR*sqrt(step_dist);

			// If we can't find anything, just go somewhere.
			if (step_dist > 500) {
				step_dist = 20;   // Arbitrary. I'm really hoping this never happens.
				branch_num = BRANCH_FACTOR * sqrt(step_dist);   // Scale with square root of step_dist. Scaling linearly costs too much time.

				// Generate future states by distance and angle.
				nc += AddDecisions(state, step_dist, branch_num, states);
				break;
			}
		}
	}
	else {
		// Generate future states by distance from current location.
		nc += AddDecisions(state, step_dist, branch_num, states);
	}

	// Depreciate cost in and around visited location.
	DepreciateScore(state);

	return nc;
}

vx_t StuntzHuntz::FindBest(vx_t source_vx)
{
	vx_t best_vx = source_vx;
	float best_score = dTree[source_vx].state.score;

	if (boost::out_degree(source_vx, dTree) > 0) {
		std::pair<edge_iter, edge_iter> edges = boost::out_edges(source_vx, dTree);
		for(; edges.first != edges.second; edges.first++) {
			vx_t child_vx = boost::target(*edges.first, dTree);
			float child_score = dTree[FindBest(child_vx)].state.score;

			if (child_score >= best_score) {
				best_vx = child_vx;
				best_score = child_score;
			}
		}
	}

	return best_vx;
}

