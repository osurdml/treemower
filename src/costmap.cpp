#include <costmap.hpp>

#include <iostream>
#include <fstream>
#include <iomanip>

CostMap::CostMap(const char *cm_filename, long rows, long cols, long lookahead)
{
	max_lookahead = lookahead;
	m_orig.resize(rows, cols);

	// Open input file
	std::ifstream cm(cm_filename);
	if (!cm)
	{
		std::cerr << "Failed to open file " << cm_filename << std::endl;
	}

	// Read file
	std::string line;
	std::string field;
	for (int i=0; i<rows; i++) {
		std::getline(cm, line);
		std::istringstream s(line);
		for (int j=0; j<cols; j++) {
			std::getline(s, field,',');
			m_orig(i, j) = std::atof(field.c_str());
		}
	}
	cm.close();

	// Set up undo buffer.
	for (int i=0; i<lookahead+1; i++) {
		ms.push_back(MatrixXf(m_orig));
	}
	m_current = lookahead;
	remaining_undos = lookahead;
}

CostMap::CostMap(CostMap *cm)
{
	// TODO(yoos): Ugh.
	copyFrom(cm);
}

std::pair<long, long> CostMap::getSize(void)
{
	return std::pair<long, long> (ms[m_current].rows(), ms[m_current].cols());
}

void CostMap::copyFrom(CostMap *cm)
{
	ms[m_current].resize(cm->getSize().first, cm->getSize().second);

	// TODO(yoos): Maybe use block operations with a pointer to the score matrix.
	for (long i=0; i<ms[m_current].rows(); i++) {
		for (long j=0; j<ms[m_current].cols(); j++) {
			setScore(i, j, cm->getScore(i, j));
		}
	}
}

float CostMap::getScore(long x, long y)
{
	if (x < 0 || y < 0 || x > ms[m_current].rows()-1 || y > ms[m_current].cols()-1) {
		return -1;
	}
	return ms[m_current](x, y);
}

int CostMap::setScore(long x, long y, float score)
{
	if (x < 0 || y < 0 || x > ms[m_current].rows()-1 || y > ms[m_current].cols()-1) {
		return -1;
	}

	ms[m_current](x, y) = score;

	return 0;
}

int CostMap::Step(int num_steps)
{
	// TODO(yoos): Use min/max function.
	if (num_steps > 0) {
		// Unconditionally step forward, possibly losing some history.
		long m_prev = m_current;
		m_current = (m_current+num_steps) % (max_lookahead+1);

		// Copy matrix
		ms[m_current] = ms[m_prev];

		remaining_undos += num_steps;
		if (remaining_undos > max_lookahead) {
			remaining_undos = max_lookahead;
		}
	}
	else {
		// Step backward if enough undos are available.
		if (remaining_undos > num_steps) {
			m_current = (m_current+max_lookahead+1+num_steps) % (max_lookahead+1);
			remaining_undos += num_steps;
		}
		else {
			return 0;
		}
	}
	//std::cout << "Step: " << num_steps << "  m_current: " << m_current << "\n";
	return num_steps;
}

void CostMap::PrintDebug(void)
{
	for (int i=0; i<getSize().first; i++) {
		std::cout << "\n  ";
		for (int j=0; j<getSize().second; j++) {
			std::cout << std::setw(8) << getScore(i, j) << " ";
		}
	}
	std::cout << "\n";
}

