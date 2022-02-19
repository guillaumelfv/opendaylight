FROM anapsix/alpine-java:8_jdk

LABEL LABEL org.opencontainers.image.authors="glefevre.inbox@gmail.com"

RUN mkdir /odl

RUN apk add --no-cache gcc g++ make libc-dev python-dev openssl && \
    apk add maven --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ && \
    wget --no-check-certificate https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/distribution-karaf/0.5.0-Boron/distribution-karaf-0.5.0-Boron.tar.gz && \
    tar -xvzf distribution-karaf-0.5.0-Boron.tar.gz --strip-components 1 -C /odl && \
    rm -f distribution-karaf-0.5.0-Boron.tar.gz && \
    apk del gcc make python-dev libc-dev g++ maven && \
    rm -rf /var/cache/apk/*

WORKDIR /odl

EXPOSE 8181 6633 8101

ENTRYPOINT ["./bin/karaf"]