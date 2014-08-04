#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>
#include <decisiontree.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>


class StuntzHuntz : protected FrontierGenerator {
	void AddDecision(std::vector<decision_t> decisions, long x, long y, float score);

	int _LawnStart (decision_t state, std::vector<decision_t> decisions);
	int _LawnAcross(decision_t state, std::vector<decision_t> decisions);
	int _LawnUp    (decision_t state, std::vector<decision_t> decisions);
	int _LawnDown  (decision_t state, std::vector<decision_t> decisions);
	int _LawnEnd   (decision_t state, std::vector<decision_t> decisions);

public:
	StuntzHuntz(CostMap *cm);
};

#endif // STUNTZHUNTZ_HPP

