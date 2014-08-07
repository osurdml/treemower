#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>
#include <boost/bind.hpp>

struct decision_t {
	location_t loc;
	float score;
	float depth;
};

typedef boost::function<int (decision_t state, std::vector<decision_t> *decisions)> state_t;

class StuntzHuntz {
	CostMap *cm;

	void AddDecision(std::vector<decision_t> *decisions, long x, long y, float score);

	int _LawnStart (decision_t curDec, std::vector<decision_t> *decisions);
	int _LawnAcross(decision_t curDec, std::vector<decision_t> *decisions);
	int _LawnUp    (decision_t curDec, std::vector<decision_t> *decisions);
	int _LawnDown  (decision_t curDec, std::vector<decision_t> *decisions);
	int _LawnEnd   (decision_t curDec, std::vector<decision_t> *decisions);

public:
	StuntzHuntz(CostMap *cm_p);

	/**
	 * @brief State machine function pointer that serves to store the state itself during lookahead.
	 */
	state_t update;
	
	/**
	 * @brief Keep track of our real state.
	 */
	state_t realState;
};

#endif // STUNTZHUNTZ_HPP

