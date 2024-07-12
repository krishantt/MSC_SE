# # Use Python 3.6.5 as a parent image
# FROM python:3.6.5-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# # Set the working directory in the container
# WORKDIR /app

# # Install dependencies
# COPY requirements.txt /app/
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the current directory contents into the container at /app/
# COPY . /app/

# # Copy the start-server script into the container
# COPY start-server.sh /app/

# # Make the start-server script executable
# RUN chmod +x /app/start-server.sh

# # Expose port 8000 for the Django app
# EXPOSE 7188

# # Run the application
# # CMD ["python", "/app/manage.py", "runserver",'0.0.0.0:7188']
# CMD ["sh", "/app/start-server.sh"]

# Use a more recent Python 3.6 as a parent image
FROM python:3.6.15-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and setuptools
RUN pip install --upgrade pip setuptools

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app/
COPY . /app/

# Copy the start-server script into the container
COPY start-server.sh /app/

# Make the start-server script executable
RUN chmod +x /app/start-server.sh

# Expose port 7188 for the Django app
EXPOSE 7188

# Run the application
CMD ["sh", "/app/start-server.sh"]

