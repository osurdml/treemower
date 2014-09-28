#ifndef BASEMAP_HPP
#define BASEMAP_HPP

#include <vector>

#include <Eigen/Dense>

using namespace Eigen;

struct location_t {
	long x;
	long y;
};

class BaseMap {
	long max_undo;   // Maximum number of undo steps
	long idx_undo;   // Index of current valid map
	long num_remaining_undos;   // Remaining number of undos
	std::vector<std::vector<MatrixXf>*> undo_matrices;

protected:
	std::pair<long, long> _size;
	std::pair<float, float> _origin;
	std::pair<long, long> ImportMatrix(const char *mat_fn, MatrixXf *m, long xsize = 0, long ysize = 0);
	std::pair<long, long> ImportMatrix(const char *mat_fn, std::vector<MatrixXf> *ms, long max_undo, long xsize = 0, long ysize = 0);

	// Get/set
	float MatrixGet(const MatrixXf *m, long x, long y) const;
	float MatrixGet(const std::vector<MatrixXf> *m, long x, long y) const;
	int MatrixSet(MatrixXf *m, long x, long y, float val);
	int MatrixSet(std::vector<MatrixXf> *m, long x, long y, float val);

public:
	BaseMap(void);

	int Step(int num_steps);
};

#endif // BASEMAP_HPP

