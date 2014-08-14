#ifndef DECISIONTREE_HPP
#define DECISIONTREE_HPP

#include <costmap.hpp>

#include <stdio.h>
#include <vector>
#include <list>

#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/directed_graph.hpp>
#include <boost/function.hpp>

typedef boost::adjacency_list<boost::setS, boost::setS>::vertex_descriptor vx_t;
typedef boost::adjacency_list<boost::setS, boost::setS>::edge_descriptor edge_t;

/**
 * @brief State information.
 */
struct state_t {
	location_t loc;
	float score;
	float depth;
};

typedef boost::function<int (state_t state, std::vector<state_t> *states)> action_t;

struct vx_property {
	vx_t parent;
	state_t state;
};

struct edge_property {
	action_t action;
};

typedef boost::adjacency_list<boost::setS, boost::setS, boost::directedS, vx_property, edge_property> Graph;
typedef boost::graph_traits<Graph>::out_edge_iterator edge_iter;

class DecisionTree {
	long num_lookahead;
	vx_t current_vx;   // Current vertex.
	float total_score;

	// Recursive depth-first lookahead
	//
	// source_vx: Source vertex from which we begin the search
	// depth: Recursion depth. We should not exceed our maximum lookahead step value.
	//
	// returns: Number of descendant vertices
	long LookAhead(vx_t source_vx, long depth);

	/**
	 * @brief Recursively prune all branches excluding best ancestor node of best branch.
	 */
	void Prune(vx_t source_vx, vx_t exclude_vx);

	/**
	 * @brief Debug
	 */
	void PrintDebug(void);
	// vx_t BreakTie(vector<vx_t> v);

	// frontier vertices. TODO(yoos): list probably isn't the best type to use here.
	//std::list<vx_t> frontier;

protected:
	CostMap cm;

	// TODO: having second thoughts about StuntzHuntz being a modular component
	// of DecisionTree instead of vice versa. Reasoning behind current
	// implementation is that DecisionTree will be a component of
	// a higher-level navigation process, and StuntzHuntz is a decision-making
	// module. The reverse implementation would have StuntzHuntz interface
	// directly with navigation, but this is also bad because..

	// Directed graph of possible navigation plans. Each edge represents
	// an action, and each vertex represents (via the sequence of edges up to
	// that vertex) a navigation plan composed of state transitions.
	//
	// Obviously, this will grow exponentially. So we only make num_lookahead
	// decisions ahead of our current state, recording the cost to each vertex.
	// We then choose the best, take one step towards the best-cost target, and
	// discard all other branches.
	//
	// Hopefully we'll be able to find a point of diminishing returns with some
	// num_lookahead value.
	Graph g;

	/**
	 * @brief State machine update functions.
	 */
	virtual float Explore(state_t, CostMap*, std::vector<state_t>*) = 0;

	/**
	 * @brief Find the best vertex among immediate descendants of a given vertex.
	 *
	 * @param source_vx Source vertex.
	 *
	 * @return Best vertex.
	 */
	virtual vx_t FindBest(vx_t source_vx) = 0;

public:
	/**
	 * @brief Constructor.
	 *
	 * @param num_lookahead Number of steps to look ahead before deciding on best branch.
	 * @param fg Instance of a FrontierGenerator whose update function we will call.
	 */
	DecisionTree(const char *cm_filename, long cm_rows, long cm_cols, long num_lookahead);

	/**
	 * @brief Runs treemower.
	 *
	 * @return The score
	 */
	float Mow(void);
};

#endif // DECISIONTREE_HPP

