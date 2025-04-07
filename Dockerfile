# Use a base image (replace with your preferred language/runtime)
FROM node:latest

# Set working directory in container like `cd`
WORKDIR /app

# start by installing dependencies. As docker concider each command as a layer to be cached
# Copy package files 
# COPY fromHere toCONTAINER(/app)
COPY package*.json ./

# Install dependencies
# the results will be commited to the docker image as a layer
RUN npm install

# Copy source code
# ignores what is in `.dockerigonre` file
# don't worry about recopying `package.json` file either it gets replaced/ignored
COPY . .

# Set environment variable in the container
ENV PORT=8080

# Expose port (adjust as needed)
# makes the container listens to it at runtime
EXPOSE 3000

# Command to run the app
# `RUN` is SHELL form 
# `CMD` is EXEC form: array of strings. unlike a regular command, it doesn't startup a shell session
CMD ["npm", "start"]