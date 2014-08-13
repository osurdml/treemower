#include <stuntzhuntz.hpp>

#include <stdio.h>

StuntzHuntz::StuntzHuntz(void)
{
}

void StuntzHuntz::AddDecision(std::vector<state_t> *states, long x, long y, float score)
{
	state_t d = {{x, y}, score, 0};
	states->push_back(d);
}

float StuntzHuntz::Lawn(state_t state, CostMap *cm, std::vector<state_t> *states)
{
	long x = state.loc.x;
	long y = state.loc.y;

	// Calculate score at current location
	float score = 0.0;

	if (cm->getScore(x,y+1) > 0) {
		// Up
		//std::cout << "Up\n";
		AddDecision(states, x, y+1, 0);
	}
	else if (cm->getScore(x,y-1) > 0) {
		// Down
		//std::cout << "Down\n";
		AddDecision(states, x, y-1, 0);
	}
	else if (cm->getScore(x+1,y) > 0) {
		// Across
		//std::cout << "Across\n";
		AddDecision(states, x+1, y, 0);
	}
	else {
		// End
		//std::cout << "End\n";
	}

	cm->setScore(x, y, score);

	// Debug
	//cm->PrintDebug();

	return score;   // TODO(yoos): Return number of generated next states.
}

float StuntzHuntz::ExpandingHorizon(state_t state, CostMap *cm, std::vector<state_t> *states)
{
	long x = state.loc.x;
	long y = state.loc.y;

	float score = 0.0;
		
}

