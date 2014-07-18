#ifndef DECISIONTREE_HPP
#define DECISIONTREE_HPP

#include <stdio.h>

#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/directed_graph.hpp>

struct vx_property {
	boost::adjacency_list<>::vertex_descriptor parent;
	long score;
};

struct edge_property {
};

typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, vx_property, edge_property> Graph;

typedef Graph::vertex_descriptor vx_t;

class DecisionTree {
	int num_lookahead;
	// TODO: costmap

	// Directed graph of possible navigation plans. Each edge represents
	// a decision, and each vertex represents (via the sequence of edges up to
	// that vertex) a navigation plan.
	//
	// Obviously, this will grow exponentially. So we only make num_lookahead
	// decisions ahead of our current state, recording the cost to each vertex.
	// We then choose the best, take one step towards the best-cost target, and
	// discard all other branches.
	//
	// Hopefully we'll be able to find a point of diminishing returns with some
	// num_lookahead value.
	Graph g;

	vx_t current_vx;   // Current vertex.
	vx_t best_ancestor_vx;   // For processing.

	// Outer vertices. TODO(yoos): list probably isn't the best type to use here.
	std::list<vx_t> outer;

	void PruneRecursive(vx_t v);
	// vx_t BreakTie(vector<vx_t> v);

public:
	DecisionTree(int num_lookahead);

	// Mow the trees. Return the score.
	long MowTrees(void);

	// Mow the lawn. Return the score.
	long MowLawn(void);
};

#endif // DECISIONTREE_HPP

