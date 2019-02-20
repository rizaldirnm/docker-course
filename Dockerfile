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
COPY --from=builder /app/build /usr/share/nginx/html
