#include <infomap.hpp>

#include <iostream>
#include <iomanip>

InfoMap::InfoMap(const char *score_fn, const char *depth_fn, const char *temperature_fn, const char *oxygen_fn, long rows, long cols, long num_lookahead)
{
	_size = ImportMatrix(score_fn, &_score, rows, cols, num_lookahead);

	_size = ImportMatrix(depth_fn, &_depth, rows, cols);
	_size = ImportMatrix(temperature_fn, &_temperature, rows, cols);
	_size = ImportMatrix(oxygen_fn, &_oxygen, rows, cols);
}

std::pair<long, long> InfoMap::size(void) const
{
	return _size;
}

float InfoMap::score(long x, long y) const
{
	return MatrixGet(&_score, x, y);
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
	for (int i=0; i<size().first; i++) {
		std::cout << "\n  ";
		for (int j=0; j<size().second; j++) {
			std::cout << std::setw(8) << depth(i, j) << " ";
		}
	}
	std::cout << "\n";
}
