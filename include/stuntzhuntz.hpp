#ifndef STUNTZHUNTZ_HPP
#define STUNTZHUNTZ_HPP

#include <costmap.hpp>

#include <stdlib.h>
#include <vector>

struct decision_t {
	std::pair<long, long> loc;
	float depth;
	float score;
};

class StuntzHuntz {
	CostMap *cm;

	static int LawnStart(std::vector<decision_t> decisions);
	static int LawnAcross(std::vector<decision_t> decisions);
	static int LawnUp(std::vector<decision_t> decisions);
	static int LawnDn(std::vector<decision_t> decisions);
	static int LawnEnd(std::vector<decision_t> decisions);

public:
	StuntzHuntz(CostMap *cm);
	int (*update)(std::vector<decision_t> decisions);
};

#endif // STUNTZHUNTZ_HPP

