#!/usr/bin/env python

from __future__ import print_function
import sys
import os

RESULT_FN = sys.argv[1]

# Setup
BUDGET = 4000
DATA_DIR = 'data'
OUTPUT_DIR = 'output'

# Stuff to permutate
scoremaps = ['costmap', 'costmap2']
algorithms = ['lm', 'rh']
lookaheads = [2, 3, 4, 5]
rand_fracs = [0.1, 0.2, 0.5, 1.0]

# Open results file.
res_f = open(RESULT_FN, 'wb')
p_num = len(scoremaps) * len(lookaheads) * len(rand_fracs)
p_count = 1

# Write header
header = "Map, Lookahead, Budget, Random fraction"
for alg in algorithms:
    header += ', ' + alg
print(header, file=res_f)

# Run algorithms and record.
for sm in scoremaps:
    for la in lookaheads:
        for f in rand_fracs:
            res = sm + ', ' + str(la) + ', ' + str(BUDGET) + ', ' + str(f)
            for alg in algorithms:
                # Record generated path to output dir.
                rh_fn = OUTPUT_DIR + "/" + sm + "_" + alg + "_" + str(la) + "_" + str(BUDGET) + "_" + str(f) + ".txt";
                rh_args = DATA_DIR + "/" + sm + ".txt " + alg + " " + str(la) + " " + str(BUDGET) + " " + str(f) + " " + rh_fn
                score = os.popen("./treemower " + rh_args).read()

                # Add score to results line
                res += ', ' + score

            # Print progress
            print(str(p_count)+'/'+str(p_num)+':', res)
            p_count += 1

            # Write to file.
            print(res, file=res_f)

# Close results file.
res_f.close()




