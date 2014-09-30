#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>

#include <lawnmower.hpp>
#include <stuntzhuntz.hpp>

int main(int argc, char **argv)
{
	if (argc < 8) {
		std::cout << "Usage: " << argv[0] << " <CSV costmap> <rh | lm> <budget> <lookahead> <random choice fraction> <uncertainty threshold> <output filename>" << std::endl;

		return 1;
	}

	//std::cout << "Running Treemower." << std::endl;

	// Get costmap file.
	START_X = 0;
	START_Y = 0;
	const char *cm_filename = argv[1];
	std::string alg = argv[2];
	BUDGET = atol(argv[3]);
	LOOKAHEAD = atol(argv[4]);
	RAND_FRAC = atof(argv[5]);
	UNCERTAINTY_THRESHOLD = atof(argv[6]);
	std::string out_fn = argv[7];

	DecisionTree *dt;
	if (alg == "rh") {
		dt = new StuntzHuntz(cm_filename, LOOKAHEAD, BUDGET, RAND_FRAC);
	}
	else {
		dt = new Lawnmower(cm_filename, LOOKAHEAD, BUDGET, RAND_FRAC);
	}

	std::cout << dt->Mow();
	dt->Export(out_fn.c_str());

	return 0;
}

