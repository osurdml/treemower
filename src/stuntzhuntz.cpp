#include <stuntzhuntz.hpp>

#include <stdio.h>

StuntzHuntz::StuntzHuntz(const char *cm_filename, long rows, long cols, int lookahead) :
	DecisionTree(cm_filename, rows, cols, lookahead)
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

	state->score += 1;   // TODO(yoos): Increase or decrease score based on what we measure.

	for (int i=-1; i<2; i++) {
		for (int j=-1; j<2; j++) {
			if (cm.GetCost(x+i, y+j) >= 0 && !(i == 0 && j == 0)) {
				//std::cout << x+i << ", " << y+j << "\n";
				nc += AddDecision(states,x+i,y+j,3);
			}
		}
	}

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


