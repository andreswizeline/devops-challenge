# api/Dockerfile
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN npm install -g pnpm

#RUN npm install nodemon --save-dev
#RUN npm install @rollup/rollup-linux-arm64-gnu
RUN npm install ts-node
RUN npm install postgres
RUN npm install drizzle-orm


# Copy pnpm workspace files and install dependencies
COPY pnpm-workspace.yaml ./
COPY pnpm-lock.yaml ./
COPY packages/database/package.json packages/database/
COPY package.json ./
COPY tsconfig.base.json /usr/tsconfig.base.json

# Remove node_modules and package-lock.json if they exist
#RUN rm -rf node_modules packages/admin/node_modules package-lock.json packages/admin/package-lock.json

RUN pnpm install

# Copy api source code
COPY packages/database ./

# Run the application
CMD ["pnpm", "migrate"]