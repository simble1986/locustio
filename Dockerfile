FROM alpine:latest
MAINTAINER Bo Qi <simble1986@gmail.com>

# Preparation
RUN apk -U add ca-certificates python python-dev py-pip build-base unzip
RUN pip install pyzmq && 、
    wget https://github.com/locustio/locust/archive/master.zip && \
    unzip master.zip && \
    cd locust-master && python setup.py install && \
    cd .. && rm -rf locust-master && \
    apk del python-dev && \
    rm -r /var/cache/apk/* && \
    mkdir /locust
WORKDIR /locust

ADD . /locust

EXPOSE 8089 5557 5558
ENV PARAMS=""
CMD "/usr/bin/locust"  $PARAMS
