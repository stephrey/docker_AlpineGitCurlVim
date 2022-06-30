FROM alpine
MAINTAINER Stephane Rey stephane.rey@wago.com

RUN apk update
RUN apk add vim curl && \
    apk add git
