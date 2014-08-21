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
	long Explore(state_t *state, std::vector<state_t> *states);
	vx_t FindBest(vx_t source_vx);

public:
	StuntzHuntz(const char *im_filename, long rows, long cols, long lookahead, float budget);
};

#endif // STUNTZHUNTZ_HPP

