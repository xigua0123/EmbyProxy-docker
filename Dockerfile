FROM alpine:latest
WORKDIR /app
COPY emby-relay /app/emby-relay
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /app/emby-relay /docker-entrypoint.sh \
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
VOLUME ["/etc/emby-relay"]
EXPOSE 2087
ENTRYPOINT ["/docker-entrypoint.sh"]
