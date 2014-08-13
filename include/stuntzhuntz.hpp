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
	static void AddDecision(std::vector<state_t> *states, long x, long y, float score);

public:
	StuntzHuntz(void);

	// Calculate score based on current state on costmap.
	//
	// state: Current state
	// cm: Pointer to CostMap instance. The costmap will be updated in place.
	//
	// returns: Score at current location
	static float Lawn(state_t state, CostMap *cm, std::vector<state_t> *states);

	// Yawei's receding horizon explorer.
	static float RecedingHorizon(state_t state, CostMap *cm, std::vector<state_t> *states);
};

#endif // STUNTZHUNTZ_HPP

