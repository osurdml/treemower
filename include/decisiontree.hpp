#ifndef DECISIONTREE_HPP
#define DECISIONTREE_HPP

#include <stuntzhuntz.hpp>

#include <stdio.h>
#include <vector>
#include <list>

#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/directed_graph.hpp>

typedef boost::adjacency_list<boost::setS, boost::setS>::vertex_descriptor vx_t;

struct vx_property {
	vx_t parent;
	decision_t decision;
};

struct edge_property {
};

typedef boost::adjacency_list<boost::setS, boost::setS, boost::directedS, vx_property, edge_property> Graph;
typedef boost::graph_traits<Graph>::out_edge_iterator edge_iter;


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

	// frontier vertices. TODO(yoos): list probably isn't the best type to use here.
	std::list<vx_t> frontier;

	int (*update)(std::vector<decision_t> decisions);
	void PruneRecursive(vx_t v, int);
	void print_debug(void);
	// vx_t BreakTie(vector<vx_t> v);

public:
	DecisionTree(int num_lookahead, int (*update_fp)(std::vector<decision_t>));

	// Mow the trees. Return the score.
	long Mow(void);
};

#endif // DECISIONTREE_HPP

