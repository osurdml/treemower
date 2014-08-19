#ifndef DECISIONTREE_HPP
#define DECISIONTREE_HPP

#include <infomap.hpp>

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
	float score;   // Cumulative score up to current state.
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

	/**
	 * @brief Recursive depth-first lookahead.
	 *
	 * @param source_vx Source vertex from which we begin the search.
	 * @param depth Remaining recursion depth.
	 *
	 * @return Number of descendants under the source vertex.
	 */
	long LookAhead(vx_t source_vx, long depth);

	/**
	 * @brief Recursively prune all branches excluding best ancestor node of best branch.
	 *
	 * @param source_vx Source vertex from which we begin the search.
	 * @param exclude_vx Vertex to exclude. Descendants of this vertex will still be pruned.
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
	InfoMap im;

	/**
	 * @brief Directed graph of possible navigation plans.
	 *
	 * Each edge represents an action, and each vertex represents (via the
	 * sequence of edges up to that vertex) a navigation plan composed of state
	 * transitions.
	 */
	Graph dTree;

	/**
	 * @brief "Explore" out from the location given by the current state.
	 *
	 * Generate new possible states to which we could transition. Each
	 * generated state should include an updated cost, i.e., the current score
	 * combined with a gain or loss in utility provided by that future
	 * generated state.
	 *
	 * @param state Current state. TODO(yoos): Decide if this should be mutable.
	 * @param states Vector that should be populated with possible future states.
	 *
	 * @return Number of possible future states.
	 */
	virtual long Explore(state_t *state, std::vector<state_t> *states) = 0;

	/**
	 * @brief Find the best vertex among immediate descendants of a given vertex.
	 *
	 * @param source_vx Source vertex.
	 *
	 * @return Best vertex. What is "best" is discretionary.
	 */
	virtual vx_t FindBest(vx_t source_vx) = 0;

public:
	/**
	 * @brief Constructor.
	 *
	 * @param num_lookahead Number of steps to look ahead before deciding on best branch.
	 * @param fg Instance of a FrontierGenerator whose update function we will call.
	 */
	DecisionTree(const char *im_filename, long im_rows, long im_cols, long num_lookahead);

	/**
	 * @brief Runs treemower.
	 *
	 * Make num_lookahead mock decisions ahead of our current state, keeping
	 * track of the total score in a state associated with each vertex. We then
	 * choose the best, discard all other branches, and take one step towards
	 * the best target.
	 *
	 * Hopefully we'll be able to find a point of diminishing returns with some
	 * num_lookahead value.
	 *
	 * @return The score
	 */
	float Mow(void);
};

#endif // DECISIONTREE_HPP

