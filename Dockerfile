FROM jupyter/base-notebook

# Switch to non-root user
USER jovyan

# Set a non-interactive environment variable for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Copy repository contents (if needed, optional) and set ownership to jovyan
COPY . /srv/repo

# Start the Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
