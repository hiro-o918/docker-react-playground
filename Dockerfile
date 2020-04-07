FROM node:12.16.1-alpine as builder

WORKDIR '/app'

COPY package.json yarn.lock ./
RUN yarn install

COPY . . 
RUN yarn build

FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html
