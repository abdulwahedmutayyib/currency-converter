# Base image for building and running the application
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy source code
COPY  index.html /usr/share/nginx/html/

# Expose port (default port used by web applications)
EXPOSE 8000
CMD ["docker run --name mainapp"]
