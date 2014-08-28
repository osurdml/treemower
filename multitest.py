#!/usr/bin/env python

from __future__ import print_function
import sys
import os
import multiprocessing

RESULT_FN = sys.argv[1]

# Setup
BUDGET = 4000
DATA_DIR = 'data'
OUTPUT_DIR = 'output'
NUM_PROC = 10

# Stuff to permutate
scoremaps = ['costmap', 'costmap2']
algorithms = ['lm', 'rh']
lookaheads = [2, 3, 4, 5, 6, 7, 8]
rand_fracs = [0.1, 0.2, 0.5, 1.0]

# Generate argument list
p_list = []
order_map = {}
order = 0
for sm in scoremaps:
    for la in lookaheads:
        for f in rand_fracs:
            res = sm + ', ' + str(la) + ', ' + str(BUDGET) + ', ' + str(f)
            for alg in algorithms:
                # Record generated path to output dir.
                alg_fn = OUTPUT_DIR + "/" + sm + "_" + alg + "_" + str(la) + "_" + str(BUDGET) + "_" + str(f) + ".txt";
                alg_args = DATA_DIR + "/" + sm + ".txt " + alg + " " + str(la) + " " + str(BUDGET) + " " + str(f) + " " + alg_fn

                p_list.append([res, alg_args])
                order_map[alg_args] = order

            order += 1

# HACK
score_map = {}

def run(mp_args):
    #score = os.popen("./treemower " + mp_args[1]).read()

    idx = order_map[mp_args[1]]
    score_map[idx] = 

    # Print progress
    print(str(mp_progress.value)+'/'+str(len(p_list))+':', mp_args[0])
    mp_progress.value += 1

    # Add result to table


# Open results file.
res_f = open(RESULT_FN, 'wb')
#p_count = 1
mp_progress = multiprocessing.Value('i', 1)

# Write header
header = "Map, Lookahead, Budget, Random fraction"
for alg in algorithms:
    header += ', ' + alg
print(header, file=res_f)

# Run algorithms
lock = multiprocessing.Lock()
mp = multiprocessing.Pool(NUM_PROC)
mp.map(run, p_list)
mp.close()
mp.join()

# Record results
# TODO(yoos)

# Close results file.
res_f.close()




