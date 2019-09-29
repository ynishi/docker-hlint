FROM ubuntu:eoan-20190916

ENV PATH $PATH:/hlint
ENV HLINT_VERSION 2.2.2
ENV VERSION ${HLINT_VERSION}_ubuntu_eon-20190916

RUN set -e \
  && apt-get update \
  && apt-get install wget -y \
  && rm -rf /var/lib/apt/lists/* \
  && wget \
    https://github.com/ndmitchell/hlint/releases/download/v$HLINT_VERSION/hlint-$HLINT_VERSION-x86_64-linux.tar.gz \
    -O hlint.tar.gz \
  && tar xzvf hlint.tar.gz \
  && ln -s /hlint-$HLINT_VERSION /hlint \
  && rm -f hlint.tar.gz \
  && hlint

WORKDIR /hlint

ENTRYPOINT ["/hlint/hlint"]
