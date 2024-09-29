#!/usr/bin/env bash

# Make Python virtual environment and activate it
python3 -m venv .venv
# shellcheck disable=SC1091
source .venv/bin/activate

# Install required packages
python3 -m pip install gdown # Required to download Cplex installer
python3 -m pip install numpy # Required by Compass

# Download the Cplex installer `cplex_studio2211.linux_x86_64.bin`
# gdown 1RxuYxj4r42x8egAoRcjmjhj7HzDkuSrl

# Install Cplex
chmod u+x cplex_studio2211.linux_x86_64.bin
chmod u+x install_cplex.expect
./install_cplex.expect

# Install Cplex Python API
python3 /opt/ibm/ILOG/CPLEX_Studio2211/python/setup.py install

# Install Compass
python3 -m pip install git+https://github.com/yoseflab/Compass.git@7664cb08466510889f9aafb3271140918ac2bf7e
