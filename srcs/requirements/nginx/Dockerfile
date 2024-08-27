FROM alpine:3.20
RUN apk update && \
    apk upgrade && \
    apk add --no-cache nginx
#COPY ./index.html /usr/share/nginx/html/index.html
COPY ./default.conf /etc/nginx/http.d/default.conf
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
