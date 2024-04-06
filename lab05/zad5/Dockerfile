FROM ubuntu:latest AS build
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
WORKDIR /app
COPY ./app /app
RUN npm install
CMD ["npm", "start"]


FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]