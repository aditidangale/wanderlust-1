FROM node:18-bookworm-slim

RUN set -eux; \
    apt-get update; \
    apt-get -y dist-upgrade; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
