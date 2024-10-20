# Use the official Ubuntu 22.04 image as the base image.
FROM ubuntu:22.04

# Set the working directory.
WORKDIR /work

# Copy the current directory contents into the container working directory.
COPY . .

# Set DEBIAN_FRONTEND to noninteractive to avoid dialog prompts.
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies.
RUN apt-get update && \
    apt-get install --yes \
        default-jre \
        git \
        python3 \
        python3-pip \
        python3-venv

# Install Compass.
RUN chmod u+x install_compass.sh && ./install_compass.sh

# Make the entrypoint script executable.
RUN chmod u+x entrypoint.sh

# Set the entrypoint to the entrypoint script.
ENTRYPOINT ["./entrypoint.sh"]
