#include <stuntzhuntz.hpp>

#include <stdio.h>

StuntzHuntz::StuntzHuntz(CostMap *cm_p) :
	_cm_la(cm_p),
	_cm_tmp(cm_p)
	//getActions(boost::bind(&StuntzHuntz::_LawnStart, this, _1, _2))
{
	cm = cm_p;
}

void StuntzHuntz::AddDecision(std::vector<state_t> *states, long x, long y, float score)
{
	state_t d = {{x, y}, score, 0};
	states->push_back(d);
}

void StuntzHuntz::cm_print_debug(void)
{
	std::cout << "_cm_tmp:\n";
	for (int i=0; i<_cm_tmp.getSize().first; i++) {
		std::cout << "\n  ";
		for (int j=0; j<_cm_tmp.getSize().second; j++) {
			std::cout << _cm_tmp.getScore(i, j) << ", ";
		}
	}
	std::cout << "\n\n";
	std::cout << "_cm_la:\n";
	for (int i=0; i<_cm_la.getSize().first; i++) {
		std::cout << "\n  ";
		for (int j=0; j<_cm_la.getSize().second; j++) {
			std::cout << _cm_la.getScore(i, j) << ", ";
		}
	}
	std::cout << "\n\n";
	std::cout << "cm:\n";
	for (int i=0; i<cm->getSize().first; i++) {
		std::cout << "\n  ";
		for (int j=0; j<cm->getSize().second; j++) {
			std::cout << cm->getScore(i, j) << ", ";
		}
	}
	std::cout << "\n\n";
}

int StuntzHuntz::getActions(state_t state, std::vector<state_t> *states)
{
	long x = state.loc.x;
	long y = state.loc.y;

	std::cout << x << ", " << y << ", " << _cm_tmp.getScore(x,y) << "  ";

	if (_cm_tmp.getScore(x,y+1) > 0) {
		// Up
		std::cout << "Up\n";
		AddDecision(states, x, y+1, 0);
	}
	else if (_cm_tmp.getScore(x,y-1) > 0) {
		// Down
		std::cout << "Down\n";
		AddDecision(states, x, y-1, 0);
	}
	else if (_cm_tmp.getScore(x+1,y) > 0) {
		// Across
		std::cout << "Across\n";
		AddDecision(states, x+1, y, 0);
	}
	else {
		// End
		std::cout << "End\n";
	}

	_cm_tmp.setScore(x, y, 0);
	cm_print_debug();

	return 0;   // TODO(yoos): Return number of generated next states.
}

int StuntzHuntz::setAction(state_t state)
{
	// Update real costmap.
	cm->setScore(state.loc.x, state.loc.y, 0);

	// Reset lookahead costmap.
	resetLA();
	resetTmp();

	return 0;
}

void StuntzHuntz::resetTmp(void)
{
	_cm_tmp.copyFrom(&_cm_la);
}

void StuntzHuntz::resetLA(void)
{
	_cm_la.copyFrom(cm);
}

