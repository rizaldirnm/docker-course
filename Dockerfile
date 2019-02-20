#BUILD PHASE
FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json ./
RUN npm install
COPY ./ ./

RUN npm run build
#WILL BE '/app/build' <=== app stuff

#RUN PHASE
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
