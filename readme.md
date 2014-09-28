Treemower
=========
_Decision-tree based navigation library_

For now, this is meant to help compare a decision-tree navigation algorithm
with a simple lawnmower-style policy for a robotic kayak.

Generate maps
-------------
Maps can come from either hardware tests or from a our simulator.

If you have a Matlab file with data from the boat with Latitude and Longitude
fields, generate the map using data2map.m. Invocation in Matlab is as follows:

```
data2map(<PATH TO DATA FILE>, 'data/out.map')

```

If you wish to generate a simulated map, fiddle with the settings in
`createmap.m` or mass-produce some maps with `multicreatemap.m`. I'll probably
combine these later.

Generate paths
--------------
Once you have a map, run treemower as follows to generate a path:

```
./treemower <CSV costmap> <rh | lm> <lookahead> <budget> <random choice
fraction> <output filename>

```

For example, to use the receding horizon path planner on `data/lake.map` with
3-step lookahead and 5000 units (explained below) of travel budget, your
command might look something like this:

```
./treemower data/lake.map rh 3 5000 1.0 output/lake.path

```

1 unit of the travel budget corresponds to 1 tick or cell in the map that is
used by the path planner. The real-world value of this unit depends on what was
specified as the `UNIT_LENGTH` in `data2map.m`.

CAUTION
-------
For there to be a meaningful comparison between the hardware map and the
generated paths, the value of `SAMPLE_RADIUS` in `data2map.m` and
`include/config.hpp` must be the same.

