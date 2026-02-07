# ---------- BUILD STAGE ----------
FROM node:18-bookworm-slim AS builder

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG VITE_API_PATH
ENV VITE_API_PATH=$VITE_API_PATH

COPY package*.json ./
RUN npm ci

COPY . .

# Build frontend
RUN npm run build


# ---------- RUNTIME STAGE ----------
FROM nginx:1.26-bookworm

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built files
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

