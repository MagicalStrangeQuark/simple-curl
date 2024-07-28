FROM alpine:latest

RUN apk update && apk add --no-cache curl

RUN curl --version

CMD ["tail", "-f", "/dev/null"]
