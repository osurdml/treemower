#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>
#include <boost/bind.hpp>

/**
 * @brief State information.
 */
struct state_t {
	location_t loc;
	float score;
	float depth;
};

typedef boost::function<int (state_t state, std::vector<state_t> *states)> action_t;

class StuntzHuntz {
	CostMap *cm;
	CostMap _cm_la;
	CostMap _cm_tmp;

	void AddDecision(std::vector<state_t> *states, long x, long y, float score);


	void cm_print_debug(void);

public:
	StuntzHuntz(CostMap *cm_p);

	/**
	 * @brief Get possible actions.
	 *
	 * @param state Current state.
	 *
	 * @return states Possible next states.
	 */
	int getActions(state_t state, std::vector<state_t> *states);
	int setAction(state_t state);

	/**
	 * @brief Reset algorithm, for use after lookahead.
	 */
	void resetTmp(void);
	void resetLA(void);
};

#endif // STUNTZHUNTZ_HPP

