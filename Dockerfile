FROM ubuntu
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

RUN useradd -r -s /bin/false test-user
RUN apt-get update && \
    apt-get install -y nginx && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

COPY fix-mounted /etc/fix-attrs.d/01-fix-mounted

ENTRYPOINT ["/init"]
CMD ["nginx"]
