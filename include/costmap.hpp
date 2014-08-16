#ifndef COSTMAP_HPP
#define COSTMAP_HPP

#include <basemap.hpp>

#include <stdlib.h>
#include <vector>

class CostMap : public BaseMap {
	long max_lookahead;
	MatrixXf m_orig;
	std::vector<MatrixXf> ms;   // Working copies of the costmap.
	long m_current;   // Index of current valid costmap
	long remaining_undos;   // Remaining number of undos

public:
	CostMap(const char *cm_filename, long rows, long cols, long lookahead);
	CostMap(CostMap *cm);
	std::pair<long, long> getSize(void);
	void copyFrom(CostMap *cm);
	float getScore(long x, long y);
	int setScore(long x, long y, float score);

	// Backtrack num_steps number of action steps, forwards or backwards.
	int Step(int num_steps);

	void PrintDebug(void);
};

#endif // COSTMAP_HPP

