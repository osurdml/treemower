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

//void StuntzHuntz::cm_print_debug(void)
//{
//	std::cout << "_cm_tmp:\n";
//	for (int i=0; i<_cm_tmp.getSize().first; i++) {
//		std::cout << "\n  ";
//		for (int j=0; j<_cm_tmp.getSize().second; j++) {
//			std::cout << _cm_tmp.getScore(i, j) << " ";
//		}
//	}
//	std::cout << "\n\n";
//	std::cout << "_cm_la:\n";
//	for (int i=0; i<_cm_la.getSize().first; i++) {
//		std::cout << "\n  ";
//		for (int j=0; j<_cm_la.getSize().second; j++) {
//			std::cout << _cm_la.getScore(i, j) << " ";
//		}
//	}
//	std::cout << "\n\n";
//	std::cout << "cm:\n";
//	for (int i=0; i<cm->getSize().first; i++) {
//		std::cout << "\n  ";
//		for (int j=0; j<cm->getSize().second; j++) {
//			std::cout << cm->getScore(i, j) << " ";
//		}
//	}
//	std::cout << "\n\n";
//}

float StuntzHuntz::Lawn(state_t state, CostMap *cm, std::vector<state_t> *states)
{
	long x = state.loc.x;
	long y = state.loc.y;

	std::cout << x << ", " << y << ", " << cm->getScore(x,y) << "  ";

	// Calculate score at current location
	float score = 1.0;

	if (cm->getScore(x,y+1) > 0) {
		// Up
		std::cout << "Up\n";
		AddDecision(states, x, y+1, 0);
	}
	else if (cm->getScore(x,y-1) > 0) {
		// Down
		std::cout << "Down\n";
		AddDecision(states, x, y-1, 0);
	}
	else if (cm->getScore(x+1,y) > 0) {
		// Across
		std::cout << "Across\n";
		AddDecision(states, x+1, y, 0);
	}
	else {
		// End
		std::cout << "End\n";
	}

	cm->setScore(x, y, score);
	//cm_print_debug();

	return score;   // TODO(yoos): Return number of generated next states.
}

//int StuntzHuntz::setAction(state_t state, CostMap *cm)
//{
//	// Update real costmap.
//	cm->setScore(state.loc.x, state.loc.y, 0);
//
//	// Reset lookahead costmap.
//	resetLA();
//	resetTmp();
//
//	return 0;
//}

