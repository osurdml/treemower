#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>

#include <lawnmower.hpp>
#include <stuntzhuntz.hpp>

int main(int argc, char **argv)
{
	if (argc < 2) {
		std::cout << "Usage: " << argv[0] << " <CSV costmap>" << std::endl;
		return 1;
	}

	std::cout << "Running Treemower." << std::endl;

	// Get costmap file.
	const char *cm_filename = argv[1];
	long rows = 7;
	long cols = 4;
	int lookahead = 4;
	Lawnmower lm(cm_filename, rows, cols, lookahead);
	StuntzHuntz sh(cm_filename, rows, cols, lookahead);

	printf("Lawn score: %f\n", lm.Mow());
	printf("RH score: %f\n", sh.Mow());

	return 0;
}

