# Use an official Node runtime as the parent image
FROM node:18

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install any needed packages
RUN npm install

# Copy the current directory contents into the container
COPY . .

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variables
ENV NODE_ENV production
ENV PORT 3000

# Run the app when the container launches
CMD ["node", "server.js"]

# docker run -p 3000:3000 --env-file .env -d ai-ringtone-generator