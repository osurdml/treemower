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
	long rows = 100;
	long cols = 100;
	int lookahead = 2;
	Lawnmower lm(cm_filename, rows, cols, lookahead, 4000);
	StuntzHuntz sh(cm_filename, rows, cols, lookahead, 4000);

	printf("Lawn score: %f\n", lm.Mow());
	printf("RH score: %f\n", sh.Mow());

	lm.Export("output/lm.out");
	sh.Export("output/sh.out");

	return 0;
}

