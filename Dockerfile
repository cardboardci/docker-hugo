FROM alpine:3.8
ARG VERSION=0.53

ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_extended_${VERSION}_Linux-64bit.tar.gz -C /usr/local/bin

RUN apk add --update git asciidoctor libc6-compat libstdc++
RUN apk upgrade
RUN apk add --no-cache ca-certificates