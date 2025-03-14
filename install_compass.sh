#!/usr/bin/env bash

# Set up virtual environment.
python3 -m venv .venv
# shellcheck disable=SC1091
source ".venv/bin/activate"

# Install Cplex and its Python API.
CPLEX_INSTALLER="cplex_studio2211.linux_x86_64.bin"
CPLEX_INSTALL_DIR="cplex_studio2211"
CPLEX_INSTALL_PATH=$(realpath "${CPLEX_INSTALL_DIR}")
chmod u+x "${CPLEX_INSTALLER}"
"./${CPLEX_INSTALLER}" -i silent -DINSTALLER_UI=silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${CPLEX_INSTALL_PATH}"
python3 "${CPLEX_INSTALL_PATH}/python/setup.py" install

# Install Compass.
COMPASS_GIT_REPO_URL="https://github.com/voges/Compass.git"
COMPASS_GIT_COMMIT_HASH="4bfecbb968141e089cbf2583a963a7740c7af3b6"
pip3 install "git+${COMPASS_GIT_REPO_URL}@${COMPASS_GIT_COMMIT_HASH}"

# Deactivate the virtual environment.
deactivate
