FROM jupyter/base-notebook

# Switch to non-root user
USER jovyan

# Set a non-interactive environment variable for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Copy repository contents
COPY . /srv/repo

ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
