#include <stuntzhuntz.hpp>

#include <stdio.h>

StuntzHuntz::StuntzHuntz(CostMap *cm_p)
{
	cm = cm_p;
	update = boost::bind(&StuntzHuntz::_LawnStart, this, _1, _2);
}

void StuntzHuntz::AddDecision(std::vector<decision_t> decisions, long x, long y, float score)
{
	decision_t d = {{x, y}, score, 0};
	decisions.push_back(d);
}


/**
 * Lawnmower code
 *
 * Convoluted, yes. This is just so I can mess around with Boost a bit.
 */

int StuntzHuntz::_LawnStart(decision_t state, std::vector<decision_t> decisions)
{
	AddDecision(decisions, 0, 0, cm->getScore(0, 0));

	// Up
	update = boost::bind(&StuntzHuntz::_LawnUp, this, _1, _2);
	// update = &StuntzHuntz::_LawnUp;

	return 0;
}

int StuntzHuntz::_LawnAcross(decision_t state, std::vector<decision_t> decisions)
{
	AddDecision(decisions, state.loc.x+1, state.loc.y, 0);

	// Up or down
	if (state.loc.y == 0) {
		// update = &StuntzHuntz::_LawnUp;
		update = boost::bind(&StuntzHuntz::_LawnUp, this, _1, _2);
	}
	else {
		// update = &StuntzHuntz::_LawnDown;
		update = boost::bind(&StuntzHuntz::_LawnDown, this, _1, _2);
	}

	return 0;
}

int StuntzHuntz::_LawnUp(decision_t state, std::vector<decision_t> decisions)
{
	AddDecision(decisions, state.loc.x, state.loc.y+1, 0);

	// End if max X, else across if max Y.
	if (state.loc.x == cm->getSize().first) {
		update = boost::bind(&StuntzHuntz::_LawnUp, this, _1, _2);
	}
	else if (state.loc.y == cm->getSize().second) {
		update = boost::bind(&StuntzHuntz::_LawnDown, this, _1, _2);
	}

	return 0;
}

int StuntzHuntz::_LawnDown(decision_t state, std::vector<decision_t> decisions)
{
	AddDecision(decisions, state.loc.x, state.loc.y-1, 0);

	// End if max X, else across if min Y.
	if (state.loc.x == cm->getSize().first) {
		update = boost::bind(&StuntzHuntz::_LawnUp, this, _1, _2);
	}
	else if (state.loc.y == 0) {
		update = boost::bind(&StuntzHuntz::_LawnDown, this, _1, _2);
	}

	return 0;
}

int StuntzHuntz::_LawnEnd(decision_t state, std::vector<decision_t> decisions)
{
	return 0;
}


