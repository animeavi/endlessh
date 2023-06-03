FROM alpine:3.18 as builder
RUN apk add --no-cache make gcc libc-dev
ADD endlessh.c Makefile /
RUN make LDFLAGS="-static -s"

FROM scratch
EXPOSE 22/tcp
ENTRYPOINT ["/endlessh"]
CMD ["-v"]
COPY --from=builder /endlessh /
