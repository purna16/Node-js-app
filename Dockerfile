# Pull specific LTS version of Node.js
FROM node:16.18.1-alpine

# Print node and npm versions
RUN node -v
RUN npm -v

# Set ulimit for open files to avoid limit issues
#RUN ulimit -n 65536 

# Create app directory
WORKDIR /app

# Copy package.json first for caching
COPY package.json package-lock.json ./

# Install dependencies 
RUN npm install

# Copy rest of app source 
COPY . .

# Run as root user to avoid permission issues 
USER root

# Expose port
EXPOSE 8080

# Start app
CMD ["node", "server.js"]
