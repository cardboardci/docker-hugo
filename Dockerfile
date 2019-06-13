FROM alpine:3.8
ARG VERSION=0.54.0

ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_extended_${VERSION}_Linux-64bit.tar.gz -C /usr/local/bin

RUN apk add --no-cache git=2.18.1-r0 asciidoctor=1.5.7.1-r0 libc6-compat=1.1.19-r10 libstdc++=6.4.0-r9 ca-certificates=20171114-r3

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI" \
    \
    org.label-schema.schema-version="1.0" \
    \
    org.label-schema.name="hugo" \
    org.label-schema.version="${version}" \
    org.label-schema.build-date="${build_date}" \
    org.label-schema.release=="CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor="cardboardci" \
    org.label-schema.architecture="amd64" \
    \
    org.label-schema.summary="Hugo static site generator" \
    org.label-schema.description=" Hugo is an open-source static site generator" \
    \
    org.label-schema.url="https://gitlab.com/cardboardci/images/hugo" \
    org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/hugo/releases" \
    org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/hugo" \
    org.label-schema.distribution-scope="public" \
    org.label-schema.vcs-type="git" \
    org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/hugo" \
    org.label-schema.vcs-ref="${vcs_ref}" \