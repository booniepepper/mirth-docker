FROM alpine as build

WORKDIR "/opt"

RUN apk add --no-cache gcc git libc-dev make
RUN git clone https://github.com/mirth-lang/mirth

WORKDIR "/opt/mirth"
RUN make install
RUN cp "$HOME/.mirth/bin/mirth" /bin/
COPY eval /bin/


FROM alpine as bin

COPY --from=build /bin/mirth /bin/eval /bin

ENTRYPOINT ["mirth"]
