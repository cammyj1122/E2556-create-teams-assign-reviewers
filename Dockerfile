# Use a lightweight Node.js base image
FROM node:alpine

# Create a working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if present) to leverage Docker's build cache
COPY package.json ./
COPY package-lock.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your application listens on (e.g., 3000 for many web apps)
EXPOSE 3000

# Define the command to run your application
CMD ["npm", "start"]

# Debug line
#CMD ["tail", "-f", "/dev/null"]