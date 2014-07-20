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
			m(i,j) = std::atof(field.c_str());
		}
	}

	// DEBUG
	std::cout << "Read costmap:" << std::endl;
	for (int i=0; i<rows; i++) {
		for (int j=0; j<cols; j++) {
			std::cout << m(i,j) << ", ";
		}
		std::cout << std::endl;
	}
}



