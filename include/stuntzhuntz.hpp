#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>

#include <stdlib.h>
#include <vector>
#include <boost/function.hpp>

struct decision_t {
	location_t loc;
	float score;
	float depth;
};

class StuntzHuntz {
	CostMap *cm;

	void AddDecision(std::vector<decision_t> decisions, long x, long y, float score);

	int _LawnStart (decision_t state, std::vector<decision_t> decisions);
	int _LawnAcross(decision_t state, std::vector<decision_t> decisions);
	int _LawnUp    (decision_t state, std::vector<decision_t> decisions);
	int _LawnDown  (decision_t state, std::vector<decision_t> decisions);
	int _LawnEnd   (decision_t state, std::vector<decision_t> decisions);

public:
	StuntzHuntz(CostMap *cm);
	//int (*update)(std::vector<decision_t> decision);
	boost::function<int (decision_t state, std::vector<decision_t> decisions)> update;
};

#endif // STUNTZHUNTZ_HPP

