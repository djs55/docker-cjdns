FROM alpine:3.2
MAINTAINER David Scott <dave@recoil.org>

RUN apk add --update nodejs bash python git build-base linux-headers git

RUN git clone https://github.com/cjdelisle/cjdns.git /src

RUN adduser -D -h /etc/cjdns -u 1000 cjdns \
    && rm -rf /src/build_* && /src/do \
    && cp /src/cjdroute /usr/bin \
    && cp -r /src/tools/* /usr/bin \
    && cp /src/makekeys \
          /src/privatetopublic \
          /src/makekeys \
          /src/randombytes \
          /src/sybilsim /usr/bin \
    && cp /src/contrib/docker/entrypoint.sh / \
    && rm -rf /src /var/cache/apk/* \
    && apk del --purge python build-base linux-headers

VOLUME [ "/etc/cjdns" ]

