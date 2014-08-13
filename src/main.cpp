#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>

#include <costmap.hpp>
#include <decisiontree.hpp>
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
	long rows = 6;
	long cols = 4;
	int lookahead = 4;
	StuntzHuntz sh;

	DecisionTree lawn_dt(cm_filename, rows, cols, &sh.Lawn, lookahead);
	// TODO: tree_dt

	printf("Lawn score: %ld\n", lawn_dt.Mow());

	return 0;
}

