FROM ubuntu:latest
#MAINTAINER fnndsc "dev@babymri.org"
#source https://hub.docker.com/r/fnndsc/ubuntu-python3/dockerfile/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

ENTRYPOINT ["python3"]
