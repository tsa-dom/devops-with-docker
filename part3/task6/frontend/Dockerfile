FROM node:16-alpine as build

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost/api/

RUN npm ci --production && \
    npm run build && \
    rm -rf src && \
    rm -rf public && \
    rm -rf node_modules

FROM alpine:3.13
COPY --from=build /usr/src/app /app

WORKDIR /app
RUN apk add --update nodejs npm && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup && \
    npm install -g serve && \
    apk del npm --quiet

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]