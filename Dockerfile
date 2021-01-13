# multi step docker file
#first container
FROM node:alpine as builder
#ROM node:alpine
WORKDIR '/app'
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
 
# second container
FROM nginx
# anything in this folder automatically gets started /usr/share/nginx/html
# this is for the developers to know what port is getting exposed on the elastic beanstalk
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#nginx starts up automatically
#COPY --from=0 /app/build /usr/share/nginx/html