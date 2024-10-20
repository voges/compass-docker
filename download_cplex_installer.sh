#!/usr/bin/env bash

# Set up virtual environment.
VENV_NAME=".venv_download_cplex_installer"
python3 -m venv "${VENV_NAME}"
# shellcheck disable=SC1091
source "${VENV_NAME}/bin/activate"
pip3 install gdown

# Download the Cplex installer 'cplex_studio2211.linux_x86_64.bin'.
# You are legally required to obtain your own copy of the Cplex Installer from IBM!
gdown 1RxuYxj4r42x8egAoRcjmjhj7HzDkuSrl

# Deactivate and remove the virtual environment.
deactivate
rm -rf "${VENV_NAME}"
