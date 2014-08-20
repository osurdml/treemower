#include <stuntzhuntz.hpp>

#include <stdio.h>

StuntzHuntz::StuntzHuntz(const char *im_filename, long rows, long cols, int lookahead) :
	DecisionTree(im_filename, rows, cols, lookahead)
{
	srand(0);
}

long StuntzHuntz::AddDecision(std::vector<state_t> *states, long x, long y, float score)
{
	const int CHOICE_PER = 100;   // Probability in percent that a generated decision will be added to future states.

	if ((rand() % 100) < CHOICE_PER) {
		state_t d = {{x, y}, score, 0};
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

	// Examine surrounding eight cells for possible exploration.
	for (int i=-1; i<2; i++) {
		for (int j=-1; j<2; j++) {
			if (im.depth(x+i, y+j) >= 0 && !(i == 0 && j == 0)) {
				//std::cout << x+i << ", " << y+j << "\n";
				if (im.score(x+i, y+j) >= 0.1) {   // TODO(yoos): Arbitrary threshold of 0.1
					nc += AddDecision(states, x+i, y+j, CalcScore(state));
				}
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

