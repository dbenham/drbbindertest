FROM jupyter/base-notebook

# Set a non-interactive environment variable for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Copy repository contents (if needed, optional) and set ownership to jovyan
COPY --chown=jovyan:jovyan . /home/jovyan
COPY --chown=jovyan:jovyan . /srv/repo

# Switch to non-root user
USER jovyan

# Start the Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
