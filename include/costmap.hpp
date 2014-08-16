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

	/**
	 * @brief Get map size.
	 *
	 * @return Number of rows and columns.
	 */
	std::pair<long, long> getSize(void);

	/**
	 * @brief Copy all data from another CostMap.
	 *
	 * @param cm Pointer to another CostMap from which to copy data.
	 */
	void copyFrom(CostMap *cm);

	/**
	 * @brief Get score at given coordinates.
	 *
	 * @param x X coordinate.
	 * @param y Y coordinate.
	 *
	 * @return The score if coordinates are in bounds, -1 otherwise.
	 */
	float getScore(long x, long y);

	/**
	 * @brief Set score at given coordinates.
	 *
	 * @param x X coordinate.
	 * @param y Y coordinate.
	 * @param score Score to set.
	 *
	 * @return 0 on success, -1 otherwise.
	 */
	int setScore(long x, long y, float score);

	/**
	 * @brief Step active map forward or backward in history.
	 *
	 * Will unconditionally step forward. If requested number of steps backward
	 * exceeds the number of remaining undos, no steps will be taken at all.
	 *
	 * @param num_steps Number of steps to take. Positive or negative for forward or backward, respectively.
	 *
	 * @return Number of steps actually taken.
	 */
	int Step(int num_steps);

	/**
	 * @brief Print debug information.
	 */
	void PrintDebug(void);
};

#endif // COSTMAP_HPP

