# Use a lighter Python base image
FROM python:3.9-slim

# Set a non-interactive environment variable for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install any system dependencies that you might need (minimal)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook via pip
RUN pip install notebook

# Expose Jupyter Notebook port
EXPOSE 8888

# Set working directory (Binder will mount your repo here)
WORKDIR /home/jovyan

# Copy the repository contents (optional; Binder mounts the repo automatically)
COPY . /home/jovyan

# Start the Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
