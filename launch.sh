#!/bin/bash

echo "Fetching notebooks from" $GIT_REPO

git clone $GIT_REPO /home/notebooks
cp jupyter_notebook_config.py openebs_utils.py /home/notebooks/

echo "Running Notebook"
/opt/conda/bin/jupyter notebook --ip='*' --notebook-dir=/home --port=8888 --no-browser
