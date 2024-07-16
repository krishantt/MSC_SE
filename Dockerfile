# # Use Python 3.6.5 as a parent image
# FROM python:3.9-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# RUN pip install --no-cache-dir numpy
# RUN pip install --no-cache-dir pandas
# # Set the working directory in the container
# WORKDIR /app

# # Copy the requirements file to the container
# COPY requirements.txt /app/
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the entire current directory to /app/
# COPY . /app/

# COPY start-server.sh /app/

# # Ensure the start-server script is executable
# RUN chmod +x /app/start-server.sh

# # Verify the contents of the /app directory
# RUN ls -l /app/

# # Expose port 7188 for the application
# EXPOSE 7188

# # Run the application
# ENTRYPOINT ["sh", "-c", "ls -l /app && /start-server.sh"]


FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN pip install --no-cache-dir numpy
RUN pip install --no-cache-dir pandas

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire current directory to /app/
COPY . /app/

# Copy start-server.sh and make it executable
COPY start-server.sh /app/
RUN chmod +x /app/start-server.sh

# Expose port 7188 for the application
EXPOSE 7188

# Define the command to run your application
CMD ["sh", "-c", "/app/start-server.sh"]
