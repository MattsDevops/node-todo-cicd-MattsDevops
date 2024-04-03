# Base image with Node js
FROM node:12.2.0-alpine

# Working directory with all the code files
WORKDIR /app

# Copy code from source to destination 
COPY . .

# Install the packages
RUN npm install
RUN npm run test

# Application is ready

# Run the cotainer with arguments
CMD ["node","app.js"]
