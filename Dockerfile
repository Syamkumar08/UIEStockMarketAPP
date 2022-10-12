#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/e-stock-market-app /usr/share/nginx/html



#FROM node:10.16.3-alpine as node

#WORKDIR /opt/
#COPY package.json .
#RUN npm install
#COPY . .
#RUN ./node_modules/@angular/cli/bin/ng build --prod

#FROM nginx
#RUN rm /usr/share/nginx/html/*
#COPY --from=node /opt/dist/angular-container/. /usr/share/nginx/html/