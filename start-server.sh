#!/bin/sh

echo "Starting server..."

# Add debugging information
set -x

# Start the Django server or whatever command you need
python /app/manage.py runserver 0.0.0.0:7188

# Check if the server started successfully
if [ $? -ne 0 ]; then
    echo "Failed to start server"
    exit 1
fi

echo "Server started successfully"
