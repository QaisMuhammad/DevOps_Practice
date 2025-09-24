# 1. Base Image: Start from an official Node.js image
FROM node:18-alpine

# 2. Working Directory: Set the "current" folder inside the container
WORKDIR /app

# 3. Copy Dependencies: Copy package.json to the container
COPY package.json .

# 4. Install Dependencies: Run the npm install command inside the container
RUN npm install

# 5. Copy Source Code: Copy the rest of your app's code
COPY . .

# 6. Expose Port: Inform Docker that the app uses port 3000
EXPOSE 3000

# 7. Run Command: Specify the command to run when the container starts
CMD ["node", "server.js"]