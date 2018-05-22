#!/bin/bash

echo "Fetching notebooks from" $GIT_REPO

git clone $GIT_REPO /home/notebooks
cp jupyter_notebook_config.py /home/notebooks/
cp openebs_utils.py /home/notebooks/

echo "Running Notebook"
$(command -v jupyter) notebook --ip='*' --notebook-dir=/home --port=8888 --no-browser
