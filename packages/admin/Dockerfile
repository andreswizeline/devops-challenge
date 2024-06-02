# admin/Dockerfile
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN npm install -g pnpm
RUN npm install @rollup/rollup-linux-arm64-gnu
RUN npm install vite
RUN npm install @vitejs/plugin-react
RUN npm install react-dom
RUN npm install react
RUN npm install @mui/material
RUN npm install @emotion/styled
RUN npm i --save-dev @types/morgan


# Copy pnpm workspace files and install dependencies
COPY pnpm-workspace.yaml ./
COPY pnpm-lock.yaml ./
COPY packages/admin/package.json packages/admin
COPY packages/admin/tsconfig.json packages/admin
COPY packages/admin/vite.config.ts packages/admin
COPY package.json ./

# Remove node_modules and package-lock.json if they exist
#RUN rm -rf node_modules packages/admin/node_modules package-lock.json packages/admin/package-lock.json

RUN pnpm install

# Copy admin source code
COPY packages/admin ./

# Expose port
EXPOSE 3000

# Run the application
CMD ["pnpm", "start"]