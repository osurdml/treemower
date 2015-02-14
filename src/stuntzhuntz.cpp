#include <stuntzhuntz.hpp>

#include <iostream>

StuntzHuntz::StuntzHuntz(const char *im_filename, long lookahead, float budget, float rand_frac) :
	DecisionTree(im_filename, lookahead, budget, rand_frac)
{
}

long StuntzHuntz::AddDecision(std::vector<state_t> *states, long x, long y, float score, float budget)
{
	state_t d = {{x, y}, score, budget};
	states->push_back(d);
	return 1;
}

long StuntzHuntz::AddDecisions(state_t *state, float step_dist, float branch_num, std::vector<state_t> *states)
{
	static long x, y, dx, dy;
	long _branch_num = branch_num;
	x = state->loc.x;
	y = state->loc.y;

	for (int i=0; i<_branch_num; i++) {
		dx = step_dist * cos(2*M_PI/_branch_num*i);
		dy = step_dist * sin(2*M_PI/_branch_num*i);
		if (im.depth(x+dx, y+dy) >= 0) {
			AddDecision(states, x+dx, y+dy, CalcScore(state), state->budget-step_dist);
		}
	}

	return states->size();
}

long StuntzHuntz::Explore(state_t *state, std::vector<state_t> *states)
{
	static long x, y;
	static float step_dist, branch_num;
	x = state->loc.x;
	y = state->loc.y;
	step_dist = SAMPLE_INTERVAL;
	branch_num = BRANCH_FACTOR*sqrt(step_dist);

	//step_dist = fmax(fmin(5/im.score(x,y,SAMPLE_RADIUS), 400), SAMPLE_INTERVAL);
	//branch_num = BRANCH_FACTOR * sqrt(step_dist);   // Scale with square root of step_dist. Scaling linearly costs too much time.

	while (true) {
		// Generate future states by distance and angle.
		std::vector<state_t> maybe_states;   // Temporary states to examine
		AddDecisions(state, step_dist, branch_num, &maybe_states);

		// Keep states that exceed a threshold.
		for (std::vector<state_t>::iterator it=maybe_states.begin(); it!=maybe_states.end(); it++) {
			if (im.score(it->loc.x, it->loc.y, SAMPLE_RADIUS) >= UNCERTAINTY_THRESHOLD) {
				states->push_back(*it);
			}
		}

		// Increase step_dist to try and find better pasture.
		step_dist += SAMPLE_INTERVAL;

		// Scale branch number with square root of step_dist. Scaling linearly
		// costs too much time.
		branch_num = BRANCH_FACTOR*sqrt(step_dist);

		// Loop as long as we:
		//   1. Are still generating possible states
		//   2. But can't find any final states
		//   3. And have fuel left
		if (!(states->size() == 0 && maybe_states.size() != 0 && step_dist <= state->budget)) {
			break;
		}
	}

	// Wander if we can't find qualifying states. I.e., work with what we've got.
	if (states->size() == 0) {
		step_dist = fmin(rand() % 500, state->budget);   // Flail around to some random distance.
		branch_num = BRANCH_FACTOR*sqrt(step_dist);
		AddDecisions(state, step_dist, branch_num, states);
	}

	// Depreciate cost in and around visited location.
	DepreciateScore(state);

	return states->size();
}

vx_t StuntzHuntz::FindBest(vx_t source_vx)
{
	// Base case: no children, return self.
	vx_t best_vx = source_vx;
	float best_score = dTree[source_vx].state.score;

	// If children: find best (immediate) child
	if (boost::out_degree(source_vx, dTree) > 0) {
		std::pair<edge_iter, edge_iter> edges = boost::out_edges(source_vx, dTree);
		for(; edges.first != edges.second; edges.first++) {
			vx_t child_vx = boost::target(*edges.first, dTree);   // Score of child with best child score (not necessarily its own score)
			float child_score = dTree[FindBest(child_vx)].state.score;   // Score of child with best score
			dTree[child_vx].state.score = child_score;   // Propagate best score back up towards parent node. This is a hack, but it's okay because we regenerate this particular child when we make this move for real.

			if (child_score > best_score) {
				best_vx = child_vx;
				best_score = child_score;
			}
		}
	}

	//std::cout << dTree[source_vx].state.loc.x << "," << dTree[source_vx].state.loc.y << "  " << best_score << std::endl;

	return best_vx;
}

