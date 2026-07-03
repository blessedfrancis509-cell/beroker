FROM node:20-alpine
WORKDIR /app
COPY apexnetwork-main/package*.json ./
RUN npm ci
COPY apexnetwork-main/ .
RUN npm run build
ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000
CMD ["node", "--loader", "tsx/esm", "server.ts"]