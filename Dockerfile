# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies: Python3, pip, and git (if needed)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
 && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook via pip
RUN pip3 install notebook

# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

# Set the working directory (Binder will mount your repo here)
WORKDIR /home/jovyan

# Copy repository contents (optional – Binder automatically mounts your repo)
COPY . /home/jovyan

# Command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
