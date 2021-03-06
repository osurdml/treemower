#ifndef INFOMAP_HPP
#define INFOMAP_HPP

#include <basemap.hpp>

#include <stdlib.h>
#include <vector>

class InfoMap : public BaseMap {
	std::vector<MatrixXf> _visited;

	std::vector<MatrixXf> _score;
	MatrixXf _depth;
	MatrixXf _temperature;
	MatrixXf _oxygen;

public:
	InfoMap(const char *score_fn, const char *depth_fn, const char *temperature_fn, const char *oxygen_fn, long num_lookahead);

	std::pair<long, long> size(void) const;
	std::pair<float, float> origin(void) const;
	float visited(long x, long y) const;
	int visit(long x, long y);

	// Info getters
	float score(long x, long y) const;
	float score(long x, long y, float radius) const;
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

