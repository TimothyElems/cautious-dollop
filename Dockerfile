# Use the official Debian Bullseye image as the base image
FROM debian:bullseye

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH=/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Create a directory to store your Python projects
WORKDIR /cautious-collop

# Copy the contents of your host directory (including multiple projects) into the container
COPY . /cautious-dollop

# Install project-specific dependencies (you may need to adjust this based on your project structure)
# For example, if each project has a requirements.txt file, you can loop through the subdirectories and install dependencies like this:
WORKDIR /cautious-dollop
RUN find . -type f -name "requirements.txt" -exec pip install -r {} \;

# Expose any necessary ports (replace with the actual port numbers your projects use)
EXPOSE 8000

# Define the command to run when the container starts
CMD ["/usr/bin/python3", "main.py"]

# You can also use ENTRYPOINT to specify the default command for the container
# ENTRYPOINT ["/usr/bin/python3", "your_main_script.py"]

