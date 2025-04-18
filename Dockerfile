# Use a lighter Python base image
FROM python:3.9-slim

# Set a non-interactive environment variable for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Create a non-root user 'jovyan' with a home directory
RUN useradd -ms /bin/bash jovyan

# Install any system dependencies that you might need (minimal)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook via pip
RUN pip install notebook

# Expose Jupyter Notebook port
EXPOSE 8888

# Create working directory, change ownership to jovyan
RUN mkdir -p /home/jovyan && chown jovyan:jovyan /home/jovyan
WORKDIR /home/jovyan

# Copy repository contents (if needed, optional) and set ownership to jovyan
COPY --chown=jovyan:jovyan . /home/jovyan

# Switch to non-root user
USER jovyan

# Start the Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
