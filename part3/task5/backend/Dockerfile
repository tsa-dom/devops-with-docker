FROM golang:1.16-alpine

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .
ENV REQUEST_ORIGIN=http://localhost/

RUN go build && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup
USER appuser

CMD ["./server"]