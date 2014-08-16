#ifndef INFOMAP_HPP
#define INFOMAP_HPP

#include <basemap.hpp>

#include <stdlib.h>

class InfoMap : public BaseMap {
	std::pair<long, long> _size;
	MatrixXf _depth;
	MatrixXf _temperature;
	MatrixXf _oxygen;

public:
	InfoMap(const char *depth_fn, const char *temperature_fn, const char *oxygen_fn, long rows, long cols);

	// Info getters
	std::pair<long, long> size(void) const;
	float depth(long x, long y) const;
	float temperature(long x, long y) const;
	float oxygen(long x, long y) const;

	// Info setters
	int set_depth(long x, long y, float val);
	int set_temperature(long x, long y, float val);
	int set_oxygen(long x, long y, float val);

	void PrintDebug(void);
};

#endif // INFOMAP_HPP

