#include <stuntzhuntz.hpp>

#include <stdio.h>

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

	// Generate future states by distance and angle.
	const int radius = 10;
	const int num = 12;
	for (int i=0; i<num; i++) {
		int dx = (radius * cos(2*M_PI/num*i));
		int dy = (radius * sin(2*M_PI/num*i));
		float dist = sqrt(pow(dx,2)+pow(dy,2));
		if (im.depth(x+dx, y+dy) >= 0) {
			nc += AddDecision(states, x+dx, y+dy, CalcScore(state), state->budget-dist);
		}
	}

	// Generate future states by distance from current location.
	//const int radius = 10;
	//const float tgt_dist = 10.0;
	//for (int i=-radius; i<=radius; i++) {
	//	for (int j=-radius; j<=radius; j++) {
	//		float dist = sqrt(pow(i,2)+pow(j,2));
	//		if (im.depth(x+i, y+j) >= 0 && (fabs(tgt_dist-dist) < 0.5)) {
	//			//std::cout << x+i << ", " << y+j << "\n";
	//			nc += AddDecision(states, x+i, y+j, CalcScore(state), state->budget-dist);
	//		}
	//	}
	//}

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

