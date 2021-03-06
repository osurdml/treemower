#include <infomap.hpp>

#include <iostream>
#include <iomanip>

InfoMap::InfoMap(const char *score_fn, const char *depth_fn, const char *temperature_fn, const char *oxygen_fn, long num_lookahead)
{
	_size = ImportMatrix(score_fn, &_score, num_lookahead);
	_size = ImportMatrix(0, &_visited, num_lookahead, _size.first, _size.second);

	_size = ImportMatrix(depth_fn, &_depth);
	_size = ImportMatrix(temperature_fn, &_temperature);
	_size = ImportMatrix(oxygen_fn, &_oxygen);
}

std::pair<long, long> InfoMap::size(void) const
{
	return _size;
}

std::pair<float, float> InfoMap::origin(void) const
{
	return _origin;
}

float InfoMap::visited(long x, long y) const
{
	return MatrixGet(&_visited, x, y);
}

int InfoMap::visit(long x, long y)
{
	return MatrixSet(&_visited, x, y, MatrixGet(&_visited,x,y)+1);
}

float InfoMap::score(long x, long y) const
{
	return MatrixGet(&_score, x, y);
}

float InfoMap::score(long x, long y, float radius) const
{
	float sum = 0.0;
	long count = 0;
	long _radius = radius;   // TODO(syoo): round up?

	float dist;
	for (long dx=-_radius; dx<=_radius; dx++) {
		for (long dy=-_radius; dy<=_radius; dy++) {
			dist = sqrt(pow(dx,2)+pow(dy,2));
			if (dist <= radius) {
				count++;
				sum += std::max(0.0f, MatrixGet(&_score, x+dx, y+dy));
			}
		}
	}
	sum /= count;

	return sum;
}

float InfoMap::depth(long x, long y) const
{
	return MatrixGet(&_depth, x, y);
}

float InfoMap::temperature(long x, long y) const
{
	return MatrixGet(&_temperature, x, y);
}

float InfoMap::oxygen(long x, long y) const
{
	return MatrixGet(&_oxygen, x, y);
}

int InfoMap::set_score(long x, long y, float val)
{
	return MatrixSet(&_score, x, y, val);
}

int InfoMap::set_depth(long x, long y, float val)
{
	return MatrixSet(&_depth, x, y, val);
}

int InfoMap::set_temperature(long x, long y, float val)
{
	return MatrixSet(&_temperature, x, y, val);
}

int InfoMap::set_oxygen(long x, long y, float val)
{
	return MatrixSet(&_oxygen, x, y, val);
}

void InfoMap::PrintDebug(void)
{
	for (int i=-1; i<size().first+1; i++) {
		std::cout << "\n  ";
		for (int j=-1; j<size().second+1; j++) {
			std::cout << std::setw(8) << score(i, j) << " ";
		}
	}
	std::cout << "\n";
}

