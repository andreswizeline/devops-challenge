# api/Dockerfile
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN npm install -g pnpm

RUN npm install nodemon --save-dev
RUN npm install ts-node
RUN npm install express
RUN npm install body-parser
RUN npm install morgan
RUN npm install @types/express
RUN npm install @types/morgan


# Copy pnpm workspace files and install dependencies
COPY pnpm-workspace.yaml ./
COPY pnpm-lock.yaml ./
COPY packages/api/package.json packages/api/
#COPY packages/api/tsconfig.json packages/api
COPY package.json ./
COPY tsconfig.base.json /usr/tsconfig.base.json
RUN pnpm add packages/database

# Remove node_modules and package-lock.json if they exist
#RUN rm -rf node_modules packages/admin/node_modules package-lock.json packages/admin/package-lock.json

RUN pnpm install

# Copy api source code
COPY packages/api ./

# Expose port
EXPOSE 5000

# Run the application
CMD ["pnpm", "start"]