FROM node:3.8 AS builder
WORKDIR /app
COPY package.json ./

FROM node:3.8-slim as runtime
WORKDIR /app
COPY --from=builder . .
RUN npm install 
CMD ["node", "index.js"]