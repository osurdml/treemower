#ifndef COSTMAP_HPP
#define COSTMAP_HPP

#include <stdlib.h>
#include <stdio.h>
#include <fstream>

#include <Eigen/Dense>

using namespace Eigen;

class CostMap {
	// TODO(yoos): Make dynamic? Multi-layer?
	MatrixXf m;

public:
	CostMap(std::ifstream *cm, long rows, long cols);
};

#endif // COSTMAP_HPP

