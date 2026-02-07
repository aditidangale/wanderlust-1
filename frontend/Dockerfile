# ---------- BUILD STAGE ----------
FROM node:18-alpine3.21 AS builder
RUN apk update && apk upgrade --no-cache

WORKDIR /app

ARG VITE_API_PATH
ENV VITE_API_PATH=$VITE_API_PATH

COPY package*.json ./
RUN npm ci

COPY . .

# Build frontend
RUN npm run build


# ---------- RUNTIME STAGE ----------
FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built files
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

