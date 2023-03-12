FROM debian:stable-slim

ARG TargetEnvironmentType
ARG Version="0.1.11"
LABEL maintainer "marius.goecke@gmail.com"
LABEL description="GRYVATorRelay is a docker-image for simply running a tor-relay in a docker-container."
LABEL targetEnvironmentType="$TargetEnvironmentType"
LABEL version="$Version"

RUN mkdir /Workspace \
    RUN mkdir /Workspace \
    && mkdir /Workspace/Application \
    && mkdir /Workspace/Configuration \
    && mkdir /Workspace/Data \
    && useradd --base-dir /Workspace --home /Workspace user \
    && echo "deb http://deb.torproject.org/torproject.org $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/tor.list \
    && echo "deb-src https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/tor.list \
    && wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import \
    && gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - \
    && apt-get -y update \
    && apt-get -y install tor deb.torproject.org-keyring

WORKDIR /Workspace

COPY ./GRYVAPaperServer/torrc.template /Workspace/Application/torrc

COPY ./GRYVAPaperServer/EntryPoint.sh /Workspace/Application/EntryPoint.sh

RUN chown -R user:1000 /Workspace \
    && chmod -R 700 /Workspace

USER user
WORKDIR /Workspace/Configuration

ENTRYPOINT ["/Workspace/Application/EntryPoint.sh"]
