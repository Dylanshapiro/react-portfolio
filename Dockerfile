# multi step docker file
#first container
FROM node:alpine as builder
#ROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
# second container
FROM nginx as production
# anything in this folder automatically gets started /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html
#nginx starts up automatically
#COPY --from=0 /app/build /usr/share/nginx/html