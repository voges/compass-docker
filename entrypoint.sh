#!/usr/bin/env bash

VENV_NAME=".venv_compass"
# shellcheck disable=SC1091
source "${VENV_NAME}/bin/activate"
compass "$@"
deactivate
