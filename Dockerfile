# This is a Dockerfile for running Home Assistant on a Raspberry Pi 4
FROM homeassistant/home-assistant:stable

# Expose the required ports
EXPOSE 8123

# Define the volume for configuration data
VOLUME /config

