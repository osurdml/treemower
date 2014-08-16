#ifndef INFOMAP_HPP
#define INFOMAP_HPP

#include <basemap.hpp>

#include <stdlib.h>
#include <vector>

class InfoMap : public BaseMap {
	std::pair<long, long> _size;
	std::vector<MatrixXf> _score;

	MatrixXf _depth;
	MatrixXf _temperature;
	MatrixXf _oxygen;

public:
	InfoMap(const char *score_fn, const char *depth_fn, const char *temperature_fn, const char *oxygen_fn, long rows, long cols, long num_lookahead);

	// Info getters
	std::pair<long, long> size(void) const;
	float score(long x, long y) const;
	float depth(long x, long y) const;
	float temperature(long x, long y) const;
	float oxygen(long x, long y) const;

	// Info setters
	int set_score(long x, long y, float val);
	int set_depth(long x, long y, float val);
	int set_temperature(long x, long y, float val);
	int set_oxygen(long x, long y, float val);

	void PrintDebug(void);
};

#endif // INFOMAP_HPP

