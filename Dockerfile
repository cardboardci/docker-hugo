FROM alpine:3.8
ARG VERSION=0.53

ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_extended_${VERSION}_Linux-64bit.tar.gz -C /usr/local/bin

RUN apk add --no-cache git=2.18.1-r0 asciidoctor=1.5.7.1-r0 libc6-compat=1.1.19-r10 libstdc++=6.4.0-r9 ca-certificates=20171114-r3