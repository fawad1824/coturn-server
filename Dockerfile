# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install Coturn and necessary dependencies
RUN apt-get update && apt-get install -y \
    coturn \
    && rm -rf /var/lib/apt/lists/*

# Expose necessary ports
EXPOSE 3478 3478/udp
EXPOSE 5349 5349/udp

# Copy the Coturn configuration file (if you have a custom one)
# COPY turnserver.conf /etc/turnserver.conf

# Run the TURN server with the specified options
CMD ["turnserver", "-c", "/etc/turnserver.conf", "-v"]
