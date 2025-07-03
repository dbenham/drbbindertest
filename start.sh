#!/bin/bash
# Copy contents every time the container starts
cp -r /srv/repo/* /home/jovyan/

# Start the actual notebook server
exec "$@"
