FROM jenkins:latest

MAINTAINER LiangXingchen <liang@maichong.it>

USER root

RUN curl -sSL https://get.docker.com/ | sh

ENV NPM_CONFIG_LOGLEVEL=info \
  NPM_CONFIG_DISTURL=http://npm.taobao.org/mirrors/node \
  NPM_CONFIG_REGISTRY=https://registry.npm.taobao.org \
  NPM_CONFIG_PROGRESS=false \
  NPM_CONFIG_COLOR=false \
  NODE_VERSION=6.9.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gcc \
        make \
        git \
	&& curl -sSL $NPM_CONFIG_DISTURL/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz | tar -xz -C /usr/local --strip-components=1 \
	&& find /usr/local/lib/node_modules/npm -name test -o -name .bin -o -name example -o -name examples -type d | xargs rm -rf \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
        /root/.npm \
        /usr/share/man /tmp/* \
        /usr/local/lib/node_modules/npm/man /usr/local/lib/node_modules/npm/doc /usr/local/lib/node_modules/npm/html

USER jenkins
