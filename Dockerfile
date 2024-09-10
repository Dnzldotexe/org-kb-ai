# Use a lightweight Python image as the base
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy everything from the "app" folder on your host into the "/app" directory in the container
COPY ./app /app

# Install the necessary Python packages listed in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port 8501 (the default port for Streamlit apps)
EXPOSE 8501

# Healthcheck to make sure the app is running properly
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health || exit 1

# Command to run the Streamlit app, allowing external access (on 0.0.0.0) and running on port 8501
ENTRYPOINT ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
