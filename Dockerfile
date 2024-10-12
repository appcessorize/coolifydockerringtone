# Use a smaller base image
FROM node:18-slim

# Install ffmpeg and other necessary tools
RUN apt-get update && \
    apt-get install -y ffmpeg python3 make g++ --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Create necessary directories
RUN mkdir -p temp_outputs uploads

# Expose port 3000
EXPOSE 3000

# Set environment variable
ENV NODE_ENV=production

# Run the application
CMD ["node", "server.js"]