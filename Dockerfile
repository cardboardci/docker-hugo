FROM cardboardci/ci-core:latest
USER root

ARG VERSION=0.59.1

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.deb && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "hugo" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "Hugo static site generator" \
    org.label-schema.description = " Hugo is an open-source static site generator" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/hugo" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/hugo/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/hugo" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/hugo" \
    org.label-schema.vcs-ref = "${vcs_ref}" \