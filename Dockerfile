FROM node:16-alpine AS development

COPY ./package.json /tmp
COPY package-lock.json /tmp

RUN cd /tmp && npm install

WORKDIR /app

RUN cp -R /tmp/node_modules .

ENV NODE_ENV=production

COPY . .

RUN npm run build

FROM nginx:1.23.1-alpine AS production

COPY ./nginx.conf /etc/nginx/templates/default.conf.template
COPY --from=development /app/build /usr/share/nginx/html