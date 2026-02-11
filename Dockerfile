# base defines a base stage that uses the official python runtime base image
FROM python:3.11-slim AS base

# Set the application directory
WORKDIR /app

# Install our requirements.txt
COPY requirements.txt .

# Install dependencies without storing the cache to keep the image lean
RUN pip install --no-cache-dir -r requirements.txt

# Copy our code from the current folder to the working directory inside the container
COPY . .

# Exposes the application port (port 5000)
EXPOSE 5000

# Define the command to run when launching the application
# Using host 0.0.0.0 is required to allow external access to the container
CMD ["python", "app.py"]