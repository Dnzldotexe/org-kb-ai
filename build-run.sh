#!/bin/bash

# Build the Docker image
sudo docker build -t my-streamlit-app ./app

# Stop and remove any existing container with the same name
sudo docker stop my-streamlit-container || true
sudo docker rm my-streamlit-container || true

# Run the container
sudo docker run -d -p 8501:8501 --name my-streamlit-container my-streamlit-app
