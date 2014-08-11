#ifndef COSTMAP_HPP
#define COSTMAP_HPP

#include <stdlib.h>
#include <stdio.h>
#include <fstream>

#include <Eigen/Dense>

using namespace Eigen;

struct location_t {
	long x;
	long y;
};

class CostMap {
	// TODO(yoos): Make dynamic? Multi-layer?
	MatrixXf m;

public:
	CostMap(std::ifstream *cm, long rows, long cols);
	CostMap(CostMap *cm);
	std::pair<long, long> getSize(void);
	void copyFrom(CostMap *cm);
	float getScore(long x, long y);
	int setScore(long x, long y, float score);
};

#endif // COSTMAP_HPP

