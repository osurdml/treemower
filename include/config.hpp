#ifndef CONFIG_HPP
#define CONFIG_HPP

const bool PRINT_DEBUG = true;

// Start location
extern long START_X;
extern long START_Y;

// Algorithm parameters (these will probably be permutated a lot via an external script
extern long LOOKAHEAD;
extern long BUDGET;
extern float RAND_FRAC;

// THE FOLLOWING SHOULD PROBABLY STAY CONSTANT, AS THEY DEPEND ON BOAT CONFIG

// Sample radius.
const long SAMPLE_RADIUS = 3;

// Number of cells between sample points.
const long SAMPLE_INTERVAL = 5;

// Somewhat of a magic number. The number of branches generated is equal to
// this times the square root of the step distance.
const long BRANCH_FACTOR = 5;

// Uncertainty reduction base factor, i.e., exactly at sample point
const float UNCERTAINTY_REDUCE_FACTOR = 0.5;

// Exponential reduction factor. For a given radius away from the sample point,
// the uncertainty reduction factor above will be multiplied by this factor
// floor(radius) times.
const float UNCERTAINTY_REDUCE_EXP = 1.0;

// Uncertainty below this is "good enough."
const float UNCERTAINTY_THRESHOLD = 0.2;

#endif // CONFIG_HPP

