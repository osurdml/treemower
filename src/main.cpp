#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>

#include <lawnmower.hpp>
#include <stuntzhuntz.hpp>

int main(int argc, char **argv)
{
	if (argc < 7) {
		std::cout << "Usage: " << argv[0] << " <CSV costmap> <rh | lm> <lookahead> <budget> <random choice fraction> <output filename>" << std::endl;

		return 1;
	}

	//std::cout << "Running Treemower." << std::endl;

	// Get costmap file.
	long rows = 100;
	long cols = 100;
	const char *cm_filename = argv[1];

	std::string alg = argv[2];
	long lookahead = atol(argv[3]);
	long budget = atol(argv[4]);
	float rand_frac = atof(argv[5]);
	std::string out_fn = argv[6];

	DecisionTree *dt;
	if (alg == "rh") {
		dt = new StuntzHuntz(cm_filename, rows, cols, lookahead, budget, rand_frac);
	}
	else {
		dt = new Lawnmower(cm_filename, rows, cols, lookahead, budget, rand_frac);
	}

	dt->Export(out_fn.c_str());
	std::cout << dt->Mow();

	return 0;
}

