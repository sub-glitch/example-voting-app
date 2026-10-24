FROM node:20.18.0-slim
ENV NODE_ENV=production PORT=8080
WORKDIR /usr/local/app
COPY package*.json ./
RUN npm install --omit=dev --no-audit --no-fund && npm cache clean --force
COPY --chown=10001:10001 . .
USER 10001
EXPOSE 8080
CMD ["node", "server.js"]
