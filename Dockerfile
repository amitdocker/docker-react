FROM node:alpine as builder
WORKDIR /var/reactapp
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
FROM nginx
COPY --from=builder /var/reactapp/build /usr/share/nginx/html