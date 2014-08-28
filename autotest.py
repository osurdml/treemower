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
lookaheads = [2, 3, 4]
rand_fracs = [1.0, 0.5, 0.2]

p_num = len(scoremaps) * len(algorithms) * len(lookaheads) * len(rand_fracs)


res_f = open(RESULT_FN, 'wb')
count = 1

for sm in scoremaps:
    for la in lookaheads:
        for f in rand_fracs:
            res = sm + ',' + str(la) + ',' + str(BUDGET) + ',' + str(f)
            for alg in algorithms:
                # Record generated path to output dir.
                rh_fn = OUTPUT_DIR + "/" + sm + "_" + alg + "_" + str(la) + "_" + str(BUDGET) + "_" + str(f) + ".txt";
                rh_args = DATA_DIR + "/" + sm + ".txt " + alg + " " + str(la) + " " + str(BUDGET) + " " + str(f) + " " + rh_fn
                score = os.popen("./treemower " + rh_args).read()

                # Print progress
                print(str(count)+'/'+str(p_num)+':', alg, "score:", score)
                count += 1
                res += ',' + score

            print(res, file=res_f)

res_f.close()




