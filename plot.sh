#!/bin/bash

matlab -nosplash -nodesktop -nojvm -r "addpath('vis'); animplot('data/costmap2.txt', 'output/sh.out')"

