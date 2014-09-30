#!/usr/bin/env python

from __future__ import print_function
import sys
import os
import multiprocessing

# Setup
DATA_DIR = 'final/maps'
OUTPUT_DIR = 'final/paths'
NUM_PROC = 10

# Stuff to permutate
scoremaps  = ['500x500_'+str(s)+'_'+str(n) for s in range(5,31,5) for n in range(5,51,5)]
budgets    = [25000]
algorithms = ['lm', 'rh']
lookaheads = [2]
rand_fracs = [0.2, 0.4, 0.6, 0.8, 1.0]
thresholds = [0.0, 0.05, 0.10, 0.15, 0.20, 0.25]

def args2fn(arglist):
    return OUTPUT_DIR + "/" + arglist['sm'] \
             + "_" + arglist['alg'] \
             + "_b" + str(arglist['budget']) \
             + "_la" + str(arglist['la']) \
             + "_rf" + str(arglist['frac']) \
             + "_th" + str(arglist['thres']) + ".path"

def args2cmd(arglist):
    return './treemower ' \
            + DATA_DIR + "/" + arglist['sm'] + ".map" \
            + " " + arglist['alg'] \
            + " " + str(arglist['budget']) \
            + " " + str(arglist['la']) \
            + " " + str(arglist['frac']) \
            + " " + str(arglist['thres']) \
            + " " + args2fn(arglist)

def args2csv(arglist):
    return arglist['sm'] + ', ' \
            + str(arglist['budget']) + ', ' \
            + str(arglist['la']) + ', ' \
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
    for bu in budgets:
        for alg in algorithms:
            for la in lookaheads:
                for f in rand_fracs:
                    for th in thresholds:
                        arglist = {'sm': sm, 'alg': alg, 'budget': bu, 'la': la, 'frac': f, 'thres': th}
                        p_list.append(arglist.copy())

# Run algorithms
mp_lock = multiprocessing.Lock()
mp_progress = multiprocessing.Value('i', 1)
mp = multiprocessing.Pool(NUM_PROC)
mp_results = mp.map(run, p_list)
mp.close()
mp.join()

