#!/usr/bin/env bash

# Set the virtual environment name.
VENV_NAME=".venv_compass"

# Set the Cplex installer name and the install path for Cplex.
CPLEX_INSTALLER="cplex_studio2211.linux_x86_64.bin"
CPLEX_INSTALL_DIR="cplex_studio2211"
CPLEX_INSTALL_PATH=$(realpath "${CPLEX_INSTALL_DIR}")

# Set the Compass Git repository URL and the commit hash.
COMPASS_GIT_REPO_URL="https://github.com/voges/Compass.git"
COMPASS_GIT_COMMIT_HASH="275adb2d308e77055df4ad6fe6774e62b215c6ee"

# Set up virtual environment.
python3 -m venv "${VENV_NAME}"
# shellcheck disable=SC1091
source "${VENV_NAME}/bin/activate"

# Install Cplex and its Python API.
chmod u+x "${CPLEX_INSTALLER}"
"./${CPLEX_INSTALLER}" -i silent -DINSTALLER_UI=silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${CPLEX_INSTALL_PATH}"
python3 "${CPLEX_INSTALL_PATH}/python/setup.py" install

# Install Compass.
pip3 install "git+${COMPASS_GIT_REPO_URL}@${COMPASS_GIT_COMMIT_HASH}"

# Deactivate the virtual environment.
deactivate
