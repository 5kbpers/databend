FROM debian:bullseye
ARG TARGETPLATFORM
ENV TERM=dumb
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y apt-transport-https ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/*

COPY ./distro/$TARGETPLATFORM/databend-meta /databend-meta
ENTRYPOINT ["/databend-meta"]
