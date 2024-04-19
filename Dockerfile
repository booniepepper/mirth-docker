FROM alpine as setup

RUN apk add --no-cache gcc libc-dev
WORKDIR "/opt"


FROM setup as build

RUN apk add --no-cache git make
RUN git clone https://github.com/mirth-lang/mirth

WORKDIR "/opt/mirth"
RUN make build
RUN cp ./bin/mirth2 /bin/mirth
COPY eval /bin/


FROM setup as bin

COPY --from=build / /

ENTRYPOINT ["eval"]
