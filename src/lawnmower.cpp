#include <lawnmower.hpp>

#include <stdio.h>

Lawnmower::Lawnmower(const char *im_filename, long rows, long cols, int lookahead) :
	DecisionTree(im_filename, rows, cols, lookahead)
{
}

long Lawnmower::AddDecision(std::vector<state_t> *states, long x, long y, float score)
{
	state_t d = {{x, y}, score, 0};
	states->push_back(d);

	return 1;
}

long Lawnmower::Explore(state_t *state, std::vector<state_t> *states)
{
	long x = state->loc.x;
	long y = state->loc.y;
	long nc = 0;

	if (im.score(x,y+1) > 0) {
		// Up
		//std::cout << "Up\n";
		nc += AddDecision(states, x, y+1, state->score+im.score(x,y+1));
	}
	else if (im.score(x,y-1) > 0) {
		// Down
		//std::cout << "Down\n";
		nc += AddDecision(states, x, y-1, state->score+im.score(x,y-1));
	}
	else if (im.score(x+1,y) > 0) {
		// Across
		//std::cout << "Across\n";
		nc += AddDecision(states, x+1, y, state->score+im.score(x+1,y));
	}
	else {
		// End
		//std::cout << "End\n";
	}

	im.set_score(x, y, 0);   // Don't return here.

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

