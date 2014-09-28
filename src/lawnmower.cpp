#include <lawnmower.hpp>

#include <stdio.h>
#include <iostream>

Lawnmower::Lawnmower(const char *im_filename, long lookahead, float budget, float rand_frac) :
	DecisionTree(im_filename, lookahead, budget, rand_frac)
{
}

long Lawnmower::AddDecision(std::vector<state_t> *states, long x, long y, float score, float budget)
{
	state_t d = {{x, y}, score, budget};
	states->push_back(d);

	return 1;
}

long Lawnmower::Explore(state_t *state, std::vector<state_t> *states)
{
	long x = state->loc.x;
	long y = state->loc.y;

	if (im.visited(x,y+SAMPLE_INTERVAL) == 0) {
		// Up
		//std::cout << "Up\n";
		y += SAMPLE_INTERVAL;
	}
	else if (im.visited(x,y-SAMPLE_INTERVAL) == 0) {
		// Down
		//std::cout << "Down\n";
		y -= SAMPLE_INTERVAL;
	}
	else if (im.visited(x+SAMPLE_INTERVAL,y) == 0) {
		// Across
		//std::cout << "Across\n";
		x += SAMPLE_INTERVAL;
	}
	else {
		// End
		//std::cout << "End\n";
	}

	AddDecision(states, x, y, CalcScore(state), state->budget-SAMPLE_INTERVAL);
	im.visit(x,y);
	DepreciateScore(state);

	// Debug
	//im.PrintDebug();

	return 1;
}

vx_t Lawnmower::FindBest(vx_t source_vx)
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

