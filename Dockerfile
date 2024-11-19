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

# Compass needs write access to its resources. If this container is executed as a
# non-root user, this will not be the case. To work around this, we will give all users
# write access to the resources directory.
RUN find /work/.venv/lib/python3.10/site-packages/compass/Resources -type d -exec chmod o+w {} \;

# Make the entrypoint script executable. This container can also be executed as a
# non-root user, so we need to additionally give all users execute permissions.
RUN chmod u+x,o+x entrypoint.sh

# Set the entrypoint to the entrypoint script.
ENTRYPOINT ["./entrypoint.sh"]
