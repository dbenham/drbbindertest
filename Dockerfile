FROM jupyter/base-notebook

# Switch to non-root user
USER jovyan

# Copy repository contents
COPY . /srv/repo
COPY . /home/jovyan

ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
