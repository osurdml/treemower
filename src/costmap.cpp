#include <costmap.hpp>

#include <iostream>

CostMap::CostMap(std::ifstream *cm, long rows, long cols)
{
	m.resize(rows, cols);

	std::string line;
	std::string field;
	for (int i=0; i<rows; i++) {
		std::getline(*cm, line);
		std::istringstream s(line);
		for (int j=0; j<cols; j++) {
			std::getline(s, field,',');
			setScore(i, j, std::atof(field.c_str()));
		}
	}
}

CostMap::CostMap(CostMap *cm)
{
	// TODO(yoos): Ugh.
	copyFrom(cm);
}

std::pair<long, long> CostMap::getSize(void)
{
	return std::pair<long, long> (m.rows(), m.cols());
}

void CostMap::copyFrom(CostMap *cm)
{
	m.resize(cm->getSize().first, cm->getSize().second);

	// TODO(yoos): Maybe use block operations with a pointer to the score matrix.
	for (long i=0; i<m.rows(); i++) {
		for (long j=0; j<m.cols(); j++) {
			setScore(i, j, cm->getScore(i, j));
		}
	}
}

float CostMap::getScore(long x, long y)
{
	if (x < 0 || y < 0 || x > m.rows()-1 || y > m.cols()-1) {
		return -1;
	}
	return m(x, y);
}

int CostMap::setScore(long x, long y, float score)
{
	if (x < 0 || y < 0 || x > m.rows()-1 || y > m.cols()-1) {
		return -1;
	}

	m(x, y) = score;

	return 0;
}

