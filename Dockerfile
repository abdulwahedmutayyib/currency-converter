# Base image for building and running the application
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Install dependencies (if applicable)
# RUN npm install

# Build the application (adjust if you have a build process)
RUN npm run index # Replace with your build command if needed

# Base image for serving the application
FROM nginx:alpine

# Copy static files
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port (default port used by web applications)
EXPOSE 8000
