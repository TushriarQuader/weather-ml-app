
# Use Python 3.11 as the base image for the Flask application.
FROM python:3.11-slim

# Set the working directory inside the container.
WORKDIR /app

# Copy the dependency list into the container.
COPY requirements.txt .

# Install the application's Python dependencies and Flask.
RUN pip install --no-cache-dir -r requirements.txt Flask gunicorn

# Copy the application, templates, model and other project files.
COPY . .

# Document the port used by the Flask application.
EXPOSE 5000

# Start the Flask application when the container launches.
CMD ["python3", "app.py"]
