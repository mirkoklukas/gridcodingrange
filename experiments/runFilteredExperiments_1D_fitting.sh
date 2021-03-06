#!/bin/bash

set -e -x

cd "$(dirname "$0")"
pwd

DATA_DIR=data/1D_fitting/$(python -c "import time; import uuid; print('{}-{}'.format(time.strftime('%Y%m%d-%H%M%S'), uuid.uuid1()))")
mkdir -p ./$DATA_DIR

python -u generate_bases.py $DATA_DIR --phaseResolution 0.2 --m 1 2 3 4 5 6 7 8 --k 1 --filtered --numTrials 100
python -u measure_unique_sidelength.py $DATA_DIR
