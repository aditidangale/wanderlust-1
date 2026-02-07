# ---------- BUILD STAGE ----------
FROM node:18-bookworm-slim AS builder

RUN set -eux; \
    apt-get update; \
    apt-get -y dist-upgrade; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG VITE_API_PATH
ENV VITE_API_PATH=$VITE_API_PATH

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


# ---------- RUNTIME STAGE ----------
FROM nginx:1.26-bookworm

RUN set -eux; \
    apt-get update; \
    apt-get -y dist-upgrade; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
