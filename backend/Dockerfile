FROM node:18-alpine

WORKDIR /app

# Install minimal required packages (if needed)
RUN apk update && apk upgrade

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
