FROM node:16

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost/api/

RUN npm ci --production && \
    npm run build && \
    npm install -g serve && \
    useradd -m user && \
    rm -rf src && \
    rm -rf public && \
    rm -rf node_modules
USER user

CMD ["serve", "-s", "-l", "5000", "build"]