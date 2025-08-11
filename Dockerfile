FROM jupyter/base-notebook

USER root

# This will run after the repo is copied to /srv/repo
# Copy the repo to jovyan's home directory
RUN mkdir -p /home/jovyan && \
    cp -r /srv/repo /home/jovyan/src-repo && \
    chown -R jovyan:users /home/jovyan/src-repo

USER jovyan
WORKDIR /home/jovyan
