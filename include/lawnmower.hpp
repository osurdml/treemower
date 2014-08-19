#ifndef LAWNMOWER_HPP
#define LAWNMOWER_HPP

#include <costmap.hpp>
#include <decisiontree.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>
#include <boost/bind.hpp>

class Lawnmower : public DecisionTree {
	static long AddDecision(std::vector<state_t> *states, long x, long y, float score);
	long Explore(state_t *state, std::vector<state_t> *states);
	vx_t FindBest(vx_t source_vx);

public:
	Lawnmower(const char *im_filename, long rows, long cols, int lookahead);
};

#endif // LAWNMOWER_HPP
