# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Install Python, pip, and other dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv build-essential libssl-dev libffi-dev python3-dev

# Copy the source directory contents into the container at /app
COPY ./src /app

# Create a virtual environment and activate it
RUN python3 -m venv venv

# Install any needed packages specified in requirements.txt using the virtual environment's pip
RUN ./venv/bin/pip install --no-cache-dir -r /app/requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application using the virtual environment's python
CMD ["./venv/bin/python", "/app/app.py"]
