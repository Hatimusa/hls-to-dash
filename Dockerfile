FROM python:3.12-slim

# Install FFmpeg and other dependencies
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

WORKDIR /app

# Copy repo
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install flask  # for serving the files

# Expose Railway port
ENV PORT=8080

# Start the CLI + Flask server
CMD ["bash", "-c", "python run_hls_to_dash.py & python serve_public.py"]
