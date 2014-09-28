#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>
#include <decisiontree.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>
#include <boost/bind.hpp>

class StuntzHuntz : public DecisionTree {
	long AddDecision(std::vector<state_t> *states, long x, long y, float score, float budget);
	long AddDecisions(state_t *state, float step_dist, float branch_num, std::vector<state_t> *states);
	long Explore(state_t *state, std::vector<state_t> *states);
	vx_t FindBest(vx_t source_vx);

public:
	StuntzHuntz(const char *im_filename, long lookahead, float budget, float rand_frac);
};

#endif // STUNTZHUNTZ_HPP

