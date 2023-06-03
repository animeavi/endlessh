FROM alpine:3.18 as builder
RUN apk add --no-cache build-base
ADD endlessh.c Makefile /
RUN make

FROM alpine:3.18
EXPOSE 22/tcp
ENTRYPOINT ["/endlessh"]
CMD ["-v"]
COPY --from=builder /endlessh /
