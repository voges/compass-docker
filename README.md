# Docker Setup for Compass

This is a Docker setup that provides [Compass](https://github.com/YosefLab/Compass).

## Prerequisites

- Docker installed on your system. You can download and install Docker from [here](https://docs.docker.com/get-docker/).
- The Cplex installer `cplex_studio2211.linux_x86_64.bin`, placed in this directory. You are legally required to obtain your own copy of the Cplex Installer from IBM. Detailed instructions for downloading the Cplex installer from IBM are provided below.

## Install Compass

Build the Docker image using the provided [`Dockerfile`](Dockerfile):

```sh
docker build --tag compass .
```

## Run Compass

Run the Docker container to verify the installation:

```sh
docker run --rm compass --help
```

By default, Docker containers do not have access to files from your host system.
You need to mount a directory from your host into the container with the `-v|--volume` option to interact with files from your host system.
Also, to able to access any files created within the container, the container must be executed with your local user and group IDs.

For example, the following command runs Compass with the input file [`expression.tsv`](expression.tsv) from the [`data`](data/) directory:

```sh
docker run --rm \
    --user "$(id --user "${USER}")":"$(id --group "${USER}")" \
    --volume "$(pwd)/data":/data compass \
    --data /data/expression.tsv \
    --species homo_sapiens \
    --output-dir /data
```

## Instructions for Downloading the Cplex Installer from IBM SkillsBuild

IBM provides free access to [IBM ILOG CPLEX Optimization Studio](https://www.ibm.com/products/ilog-cplex-optimization-studio) and other resources to students, teachers and researchers.
The version provided is fully functional, with no limitations on model size or search tree depth.
Read more in [this blog post](https://community.ibm.com/community/user/ai-datascience/blogs/xavier-nodet1/2020/07/09/cplex-free-for-students).

Follow the steps below to download the software:

1. Sign up or log in to the [IBM SkillsBuild](https://skillsbuild.org) platform (requires an academic institution issued email). You should be forwarded to the [IBMS SkillsBuild Software Downloads](https://academic.ibm.com/a2mt/downloads#/) page.
3. In the left-hand navigation pane, select the "Data Science" category.
4. Unter the "Software" section in the central pane, find and click on "ILOG CPLEX Optimization Studio", then click on "Download". You should be presented in a pop-up window with the download options for the most recent version. We use V22.1.1 (part number G0798ML).
5. We recommend to choose "HTTP" as download method.
6. Download the appropriate variant for your operating system. Our Docker setup requires `cplex_studio2211.linux_x86_64.bin`.
