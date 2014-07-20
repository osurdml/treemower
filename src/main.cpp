#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <fstream>

#include <costmap.hpp>
#include <decisiontree.hpp>

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
	CostMap(&cmfile, 100, 100);
	cmfile.close();

	DecisionTree dt(10);

	printf("Tree score: %ld\n", dt.MowTrees());
	printf("Lawn score: %ld\n", dt.MowLawn());

	return 0;
}

