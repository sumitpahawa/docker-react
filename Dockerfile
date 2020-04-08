FROM node:alpine as builder

WORKDIR /app/share

COPY package.json .
RUN npm install 
COPY . .
RUN npm run build 


FROM nginx
COPY --from=builder  /app/share/build  /usr/share/nginx/html