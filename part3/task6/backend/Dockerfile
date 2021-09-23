FROM golang:1.16-alpine as build

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .
ENV REQUEST_ORIGIN=http://localhost/

RUN go build && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup
USER appuser

FROM alpine:3.13

WORKDIR /app
COPY --from=build /usr/src/app/server /app

CMD ["./server"]