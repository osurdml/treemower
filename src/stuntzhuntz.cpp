#include <stuntzhuntz.hpp>

#include <stdio.h>

StuntzHuntz::StuntzHuntz(const char *im_filename, long rows, long cols, int lookahead) :
	DecisionTree(im_filename, rows, cols, lookahead)
{
}

long StuntzHuntz::AddDecision(std::vector<state_t> *states, long x, long y, float score)
{
	state_t d = {{x, y}, score, 0};
	states->push_back(d);

	return 1;
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
					nc += AddDecision(states, x+i, y+j, state->score+im.score(x+i, y+j));
				}
			}
		}
	}

	// Depreciate cost in and around visited location.
	_UpdateCost(x, y);

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

void StuntzHuntz::_UpdateCost(long x, long y)
{
	const float REDUCE_PER = 0.5;

	// Reduce score of this cell and some surrounding cells.
	im.set_score(x,y,   REDUCE_PER * im.score(x,y));
	im.set_score(x,y+1, REDUCE_PER * im.score(x,y+1));
	im.set_score(x,y-1, REDUCE_PER * im.score(x,y-1));
	im.set_score(x+1,y, REDUCE_PER * im.score(x+1,y));
	im.set_score(x-1,y, REDUCE_PER * im.score(x-1,y));
	// TODO(yoos): Yawei should elaborate.
}

