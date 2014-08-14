#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>
#include <decisiontree.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>
#include <boost/bind.hpp>

class StuntzHuntz : public DecisionTree {
	static void AddDecision(std::vector<state_t> *states, long x, long y, float score);
	float Explore(state_t state, CostMap *cm, std::vector<state_t> *states);
	vx_t FindBest(vx_t source_vx);

public:
	StuntzHuntz(const char *cm_filename, long rows, long cols, int lookahead);

	// Calculate score based on current state on costmap.
	//
	// state: Current state
	// cm: Pointer to CostMap instance. The costmap will be updated in place.
	//
	// returns: Score at current location
	//static float Lawn(state_t state, CostMap *cm, std::vector<state_t> *states);

	// Yawei's receding horizon explorer.
	static float RecedingHorizon(state_t state, CostMap *cm, std::vector<state_t> *states);
};

#endif // STUNTZHUNTZ_HPP

