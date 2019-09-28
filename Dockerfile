FROM fpco/stack-build:lts-14.6 as builder

WORKDIR /usr/lib/gcc/x86_64-linux-gnu/7.4.0
RUN cp crtbeginT.o crtbeginT.o.orig
RUN cp crtbeginS.o crtbeginT.o

ADD ./hlint /work
WORKDIR /work

RUN set -e \
  && stack setup \
  && stack --system-ghc build --ghc-options='-fPIC -optl-static -optl-pthread -optc-Os' \
  && stack --local-bin-path /work/bin install

FROM alpine:3.10.2
ENV PATH $PATH:/opt/hlint/bin
ENV VERSION 2.2.2_lts-14.6_alpine3.10.2
COPY --from=builder /work/bin/hlint /opt/hlint/bin/hlint
COPY --from=builder /work/data /opt/hlint/bin/data
WORKDIR /
RUN hlint

ENTRYPOINT ["/opt/hlint/bin/hlint"]

