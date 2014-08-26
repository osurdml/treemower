#include <lawnmower.hpp>

#include <stdio.h>

Lawnmower::Lawnmower(const char *im_filename, long rows, long cols, long lookahead, float budget, float rand_frac) :
	DecisionTree(im_filename, rows, cols, lookahead, budget, rand_frac)
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
	long nc = 0;

	if (im.visited(x,y+1) == 0) {
		// Up
		//std::cout << "Up\n";
		nc += AddDecision(states, x, y+1, CalcScore(state), state->budget-1);
	}
	else if (im.visited(x,y-1) == 0) {
		// Down
		//std::cout << "Down\n";
		nc += AddDecision(states, x, y-1, CalcScore(state), state->budget-1);
	}
	else if (im.visited(x+1,y) == 0) {
		// Across
		//std::cout << "Across\n";
		nc += AddDecision(states, x+1, y, CalcScore(state), state->budget-1);
	}
	else {
		// End
		//std::cout << "End\n";
	}

	im.visit(x,y);
	DepreciateScore(state);

	// Debug
	//im.PrintDebug();

	return nc;
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

