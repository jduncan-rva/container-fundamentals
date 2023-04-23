FROM ubuntu:22.04
LABEL org.opencontainers.image.authors="jamieduncan@google.com"
LABEL org.opencontainers.image.source=https://github.com/octocat/my-repo
LABEL org.opencontainers.image.description="Containter Fundamentals - Static Website Image"
LABEL org.opencontainers.image.licenses=MIT
RUN apt update
RUN apt install nginx -y
COPY config/nginx.conf /etc/nginx/
COPY web_content/ /var/www
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
