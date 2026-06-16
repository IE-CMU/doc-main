FROM node:20-alpine AS builder

WORKDIR /app

# Copy dependency manifests first for better layer caching.
COPY package.json package-lock.json ./

# Use npm ci for reproducible builds based on package-lock.json.
RUN npm ci --no-audit --no-fund

COPY . .

RUN npm run build

FROM nginx:1.27-alpine AS production

COPY nginx.conf /etc/nginx/templates/default.conf.template
COPY --from=builder /app/build /usr/share/nginx/html
