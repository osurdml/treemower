#include <stdlib.h>
#include <stdio.h>

#include <decisiontree.hpp>

int main(int argc, char **argv)
{
	printf("Running Treemower.\n");

	DecisionTree dt(4);

	printf("Tree score: %ld\n", dt.MowTrees());
	printf("Lawn score: %ld\n", dt.MowLawn());

	return 0;
}

