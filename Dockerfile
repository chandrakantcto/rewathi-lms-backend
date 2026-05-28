FROM node:20-alpine

WORKDIR /app

# Redis install kar rahe hain
RUN apk add --no-cache redis

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

ENV NODE_ENV=production
ENV PORT=5000

EXPOSE 5000

# Redis + Node dono start
CMD redis-server --daemonize yes && npm start