#include <stdlib.h>
#include <stdio.h>

#include <decisiontree.hpp>

int main(int argc, char **argv)
{
	std::cout << "Running Treemower." << std::endl;

	DecisionTree dt(10);

	printf("Tree score: %ld\n", dt.MowTrees());
	printf("Lawn score: %ld\n", dt.MowLawn());

	return 0;
}

