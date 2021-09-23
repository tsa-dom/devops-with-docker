FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git

COPY . .

CMD [ "bash", "image_builder.sh" ]