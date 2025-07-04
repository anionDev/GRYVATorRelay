FROM debian:stable-slim

ARG TargetEnvironmentType
ARG Version="0.1.24"
ARG TorKey=A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
ARG TorURL=https://deb.torproject.org/torproject.org
LABEL maintainer "marius.goecke@gmail.com"
LABEL description="GRYVATorRelay is a docker-image for simply running a tor-relay in a docker-container."
LABEL targetEnvironmentType="$TargetEnvironmentType"
LABEL version="$Version"

RUN apt-get -y update \
    && apt-get -y install wget gpg lsb-release \
    && mkdir /Workspace \
    && mkdir /Workspace/Application \
    && mkdir /Workspace/Data \
    && echo "deb $TorURL $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/tor.list \
    && echo "deb-src $TorURL $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/tor.list \
    && wget -qO- $TorURL/$TorKey.asc | gpg --import \
    && gpg --export $TorKey | apt-key add - \
    && apt-get -y update \
    && apt-get -y install tor deb.torproject.org-keyring \
    && apt-get -y purge wget gpg lsb-release \
    && apt-get clean

WORKDIR /Workspace/Data

COPY ./GRYVATorRelay/torrc.template /Workspace/Application/torrc
COPY ./GRYVATorRelay/EntryPoint.sh /Workspace/Application/EntryPoint.sh

ENTRYPOINT ["/Workspace/Application/EntryPoint.sh"]
