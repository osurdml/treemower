#!/usr/bin/env python

from __future__ import print_function
import sys
import os
import multiprocessing

RESULT_FN = sys.argv[1]

# Setup
DATA_DIR = 'data'
OUTPUT_DIR = 'output'
NUM_PROC = 10

# Stuff to permutate
budgets    = [1000, 2000, 3000, 4000, 5000]
scoremaps  = ['500x500_test'] #'costmap2']
algorithms = ['lm', 'rh']
lookaheads = [2, 3, 4, 5]
rand_fracs = [1.00]#[0.25, 0.50, 0.75, 1.00]

def args2fn(arglist):
    return OUTPUT_DIR + "/" + arglist['sm'] + "_" \
            + arglist['alg'] + "_" \
            + str(arglist['la']) + "_" \
            + str(arglist['budget']) + "_" \
            + str(arglist['frac']) + ".txt"

def args2cmd(arglist):
    return './treemower ' \
            + DATA_DIR + "/" + arglist['sm'] + ".map " \
            + arglist['alg'] + " " \
            + str(arglist['la']) + " " \
            + str(arglist['budget']) + " " \
            + str(arglist['frac']) + " " \
            + args2fn(arglist)

def args2csv(arglist):
    return arglist['sm'] + ', ' \
            + str(arglist['la']) + ', ' \
            + str(arglist['budget']) + ', ' \
            + str(arglist['frac'])

def run(mp_args):
    cmd = args2cmd(mp_args)
    score = os.popen(cmd).read()

    # Print progress
    with mp_lock:
        print(str(mp_progress.value)+'/'+str(len(p_list))+':', cmd)
        mp_progress.value += 1

    return score


# Permute arguments
p_list = []
for sm in scoremaps:
    for la in lookaheads:
	for bu in budgets:
            for f in rand_fracs:
                arglist = {'sm': sm, 'la': la, 'budget': bu, 'frac': 1.00}
                for alg in algorithms:
                    arglist['alg'] = alg
                    p_list.append(arglist.copy())

# Open results file.
res_f = open(RESULT_FN, 'wb')

# Write header
header = "Map, Lookahead, Budget, Random fraction"
for alg in algorithms:
    header += ', ' + alg
print(header, file=res_f)

# Run algorithms
mp_lock = multiprocessing.Lock()
mp_progress = multiprocessing.Value('i', 1)
mp = multiprocessing.Pool(NUM_PROC)
mp_results = mp.map(run, p_list)
mp.close()
mp.join()

# Write results
res_idx = 0
for sm in scoremaps:
    for la in lookaheads:
	for bu in budgets:
            for f in rand_fracs:
                arglist = {'sm': sm, 'la': la, 'budget': bu, 'frac': 1.00}
                res_f.write(args2csv(arglist))
                for alg in algorithms:
                    res_f.write(', '+mp_results[res_idx])
                    res_idx += 1
                res_f.write('\n')

# Close results file.
res_f.close()

