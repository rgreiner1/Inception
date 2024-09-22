FROM alpine:3.20
RUN apk update && \
    apk upgrade && \
    apk add --no-cache nginx
#COPY ./index.html /usr/share/nginx/html/index.html
COPY ./default.conf /etc/nginx/http.d/default.conf
EXPOSE 443
RUN mkdir -p /etc/nginx/ssl
RUN apk add openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
ENTRYPOINT ["nginx", "-g", "daemon off;"]
