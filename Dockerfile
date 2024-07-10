# Use Python 3.6.5 as a parent image
FROM python:3.6.5-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app/
COPY . /app/

# Expose port 8000 for the Django app
EXPOSE 7188

# Run the application
#CMD ["python", "manage.py", "runserver",'0.0.0.0:7188']
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:7188", "mscteachers.wsgi:application"]