
# Base image
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json (if you use npm)
COPY package*.json ./

# Install dependencies
RUN npm install

# Build the application (adjust if you have a build process)
COPY . .
RUN npm run build  # Replace with your build command if needed

# Base image for serving the application
FROM nginx:alpine

# Copy static files
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port (default port used by web applications)
EXPOSE 80

# Default configuration
CMD ["nginx", "-g", "daemon off;"]

