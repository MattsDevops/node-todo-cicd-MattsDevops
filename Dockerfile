# Base image with Node js
FROM alpine:3.18
ENV NODE_VERSION 20.12.0

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
