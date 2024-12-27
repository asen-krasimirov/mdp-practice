# Use a minimal base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the source directory contents into the container at /app
COPY ./src /app

# Create a virtual environment and activate it
RUN python -m venv venv

# Install any needed packages specified in requirements.txt using the virtual environment's pip
RUN ./venv/bin/pip install --no-cache-dir -r /app/requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application using the virtual environment's python
CMD ["./venv/bin/python", "/app/app.py"]
