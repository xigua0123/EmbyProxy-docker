FROM alpine:latest
WORKDIR /app

ARG TARGETARCH
COPY emby-relay-${TARGETARCH} /app/emby-relay
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh
VOLUME ["/etc/emby-relay"]
EXPOSE 2087
ENTRYPOINT ["/docker-entrypoint.sh"]
