FROM jupyter/base-notebook

# Switch to non-root user
USER jovyan

# Copy repository contents
COPY --chown jovyan . /srv/repo

ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWORD=""
