#ifndef BASEMAP_HPP
#define BASEMAP_HPP

#include <Eigen/Dense>

using namespace Eigen;

struct location_t {
	long x;
	long y;
};

class BaseMap {

protected:
	// TODO(yoos): Data file should have associated metadata so we can get rid of row/col count arguments.
	std::pair<long, long> ImportMatrix(const char *mat_fn, MatrixXf *m, long rows, long cols);

	float MatrixGet(const MatrixXf *m, long x, long y) const;
	int MatrixSet(MatrixXf *m, long x, long y, float val);

public:
	BaseMap(void);
};

#endif // BASEMAP_HPP

