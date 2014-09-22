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

long StuntzHuntz::Explore(state_t *state, std::vector<state_t> *states)
{
	long x = state->loc.x;
	long y = state->loc.y;
	long nc = 0;

	// Calculate step distance based on nearby scores.
	//float step_dist = fmax(fmin(12/im.score(x,y,4), 400), 5);
	//float branch_num = 5*sqrt(step_dist);   // Scale with square root of step_dist. Scaling linearly costs too much time.

	// TODO(yoos): Okay, might want to move step_dist back to decisiontree if this works.
	//while (states->size() == 0) {
	//	nc = 0;
	//	// Generate future states by distance and angle.
	//	std::vector<state_t> probe_states;
	//	for (int i=0; i<branch_num; i++) {
	//		int dx = (step_dist * cos(2*M_PI/branch_num*i));
	//		int dy = (step_dist * sin(2*M_PI/branch_num*i));
	//		if (im.depth(x+dx, y+dy) >= 0) {
	//			nc += AddDecision(&probe_states, x+dx, y+dy, CalcScore(state), state->budget-step_dist);
	//		}
	//	}

	//	// Check if probed state satisfies criteria (TODO: what?)
	//	for (std::vector<state_t>::iterator it=probe_states.begin(); it!=probe_states.end(); it++) {
	//		if (im.score(it->loc.x, it->loc.y, 2) > 2.0) {
	//			states->push_back(*it);
	//		}
	//	}

	//	// Increase step_dist to try and find better pasture.
	//	// TODO(yoos): What if we never do?
	//	step_dist += 5;
	//	branch_num = 5*sqrt(step_dist);
	//	if (step_dist > 500) {
	//		// Can't find good values, so just go somewhere.
	//		step_dist = 20;   // ARBITRARY?
	//		branch_num = 5*sqrt(step_dist);   // Scale with square root of step_dist. Scaling linearly costs too much time.

	//		// Generate future states by distance and angle.
	//		for (int i=0; i<branch_num; i++) {
	//			int dx = (step_dist * cos(2*M_PI/branch_num*i));
	//			int dy = (step_dist * sin(2*M_PI/branch_num*i));
	//			if (im.depth(x+dx, y+dy) >= 0) {
	//				nc += AddDecision(states, x+dx, y+dy, CalcScore(state), state->budget-step_dist);
	//			}
	//		}
	//		break;
	//	}
	//}

	// Generate future states by distance from current location.
	const int radius = 5;
	const float tgt_dist = 5.0;
	for (int i=-radius; i<=radius; i++) {
		for (int j=-radius; j<=radius; j++) {
			float dist = sqrt(pow(i,2)+pow(j,2));
			if (im.depth(x+i, y+j) >= 0 && (fabs(tgt_dist-dist) < 0.5)) {
				//std::cout << x+i << ", " << y+j << "\n";
				nc += AddDecision(states, x+i, y+j, CalcScore(state), state->budget-dist);
			}
		}
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

