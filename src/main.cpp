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
	const char *cmfilename = argv[1];
	std::ifstream cmfile(cmfilename);
	if (!cmfile)
	{
		std::cerr << "Failed to open file " << cmfilename << std::endl;
		return 1;
	}
	CostMap cm(&cmfile, 100, 100);
	cmfile.close();

	StuntzHuntz sh(&cm);
	DecisionTree lawn_dt(10, &sh);
	// TODO: tree_dt

	printf("Lawn score: %ld\n", lawn_dt.Mow());

	return 0;
}

