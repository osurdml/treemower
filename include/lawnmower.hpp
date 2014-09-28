#ifndef LAWNMOWER_HPP
#define LAWNMOWER_HPP

#include <decisiontree.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>
#include <boost/bind.hpp>

class Lawnmower : public DecisionTree {
	static long AddDecision(std::vector<state_t> *states, long x, long y, float score, float budget);
	long Explore(state_t *state, std::vector<state_t> *states);
	vx_t FindBest(vx_t source_vx);

public:
	Lawnmower(const char *im_filename, long lookahead, float budget, float rand_frac);
};

#endif // LAWNMOWER_HPP

