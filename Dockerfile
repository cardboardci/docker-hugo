FROM cardboardci/ci-core:latest
USER root

ARG VERSION=0.59.1

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL \
    "https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz"
    -o /tmp/hugo.tar.gz \
    && tar -xf /tmp/hugo.tar.gz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/*

USER cardboardci
ENTRYPOINT []

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="hugo"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="Hugo static site generator"
LABEL org.label-schema.description=" Hugo is an open-source static site generator"
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/hugo"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/hugo/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/hugo"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/hugo"
LABEL org.label-schema.vcs-ref="${vcs_ref}"