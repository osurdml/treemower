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

std::pair<long, long> BaseMap::ImportMatrix(const char *mat_fn, std::vector<MatrixXf> *ms, long rows, long cols, long max_undo)
{
	this->max_undo = max_undo;   // TODO(yoos): This might have to go in the constructor.
	undo_matrices.push_back(ms);   // Keep track so we can update in Step().
	std::pair<long, long> ret_size;

	// Import into temporary matrix.
	MatrixXf m;
	ret_size = ImportMatrix(mat_fn, &m, rows, cols);

	// Set up undo buffer.
	for (int i=0; i<max_undo; i++) {
		ms->push_back(MatrixXf(m));
	}
	idx_undo = max_undo;
	num_remaining_undos = max_undo;

	return ret_size;
}

float BaseMap::MatrixGet(const MatrixXf *m, long x, long y) const
{
	if (x < 0 || y < 0 || x > m->rows()-1 || y > m->cols()-1) {
		return -1;
	}
	return (*m)(x, y);
}

float BaseMap::MatrixGet(const std::vector<MatrixXf> *m, long x, long y) const
{
	if (x < 0 || y < 0 || x > (*m)[idx_undo].rows()-1 || y > (*m)[idx_undo].cols()-1) {
		return -1;
	}
	return (*m)[idx_undo](x, y);
}

int BaseMap::MatrixSet(MatrixXf *m, long x, long y, float val)
{
	if (x < 0 || y < 0 || x > m->rows()-1 || y > m->cols()-1) {
		return -1;
	}
	(*m)(x, y) = val;
	return 0;
}

int BaseMap::MatrixSet(std::vector<MatrixXf> *m, long x, long y, float val)
{
	if (x < 0 || y < 0 || x > (*m)[idx_undo].rows()-1 || y > (*m)[idx_undo].cols()-1) {
		return -1;
	}
	(*m)[idx_undo](x, y) = val;
	return 0;
}

int BaseMap::Step(int num_steps)
{
	// TODO(yoos): Use min/max function.
	for (std::vector<std::vector<MatrixXf>*>::iterator it=undo_matrices.begin(); it!=undo_matrices.end(); it++) {
		if (num_steps > 0) {
			// Unconditionally step forward, possibly losing some history.
			long idx_prev = idx_undo;
			idx_undo = (idx_undo+num_steps) % (max_undo+1);

			// Copy matrix
			(*it)[idx_undo] = (*it)[idx_prev];

			num_remaining_undos += num_steps;
			if (num_remaining_undos > max_undo) {
				num_remaining_undos = max_undo;
			}
		}
		else {
			// Step backward if enough undos are available.
			if (num_remaining_undos > num_steps) {
				idx_undo = (idx_undo+max_undo+1+num_steps) % (max_undo+1);
				num_remaining_undos += num_steps;
			}
			else {
				return 0;
			}
		}
	}
	//std::cout << "Step: " << num_steps << "  m_current: " << m_current << "\n";
	return num_steps;
}


