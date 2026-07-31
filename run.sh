#!/usr/bin/env bash
# ./run.sh  or  ./run.sh firefox
BROWSER="${1:-chrome}"
robot --variable BROWSER:"$BROWSER" --outputdir results tests/purchase_flow.robot
