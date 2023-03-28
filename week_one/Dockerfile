FROM ubuntu:22.04
LABEL maintainer="Jamie Duncan <jamieduncan@google.com>"
RUN apt update
RUN apt install nginx -y
COPY config/nginx.conf /etc/nginx/
COPY web_content/ /var/www
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
