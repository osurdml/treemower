#include <basemap.hpp>

#include <iostream>
#include <fstream>

BaseMap::BaseMap(void)
{}

std::pair<long, long> BaseMap::ImportMatrix(const char *mat_fn, MatrixXf *m, long rows, long cols)
{
	(*m).resize(rows, cols);

	// Open input file
	std::ifstream mat_fs(mat_fn);
	if (!mat_fs)
	{
		std::cerr << "Failed to open file " << mat_fn << std::endl;
	}

	// Read file
	std::string line;
	std::string field;
	for (int i=0; i<rows; i++) {
		std::getline(mat_fs, line);
		std::istringstream s(line);
		for (int j=0; j<cols; j++) {
			std::getline(s, field,',');
			(*m)(i, j) = std::atof(field.c_str());
		}
	}
	mat_fs.close();

	return std::pair<long, long>(rows, cols);
}

float BaseMap::MatrixGet(const MatrixXf *m, long x, long y) const
{
	if (x < 0 || y < 0 || x > m->rows()-1 || y > m->cols()-1) {
		return -1;
	}
	return (*m)(x, y);
}

int BaseMap::MatrixSet(MatrixXf *m, long x, long y, float val)
{
	if (x < 0 || y < 0 || x > m->rows()-1 || y > m->cols()-1) {
		return -1;
	}
	(*m)(x, y) = val;
	return 0;
}

