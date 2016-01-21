FROM jenkins:latest

MAINTAINER LiangXingchen <liang@maichong.it>

USER root

RUN curl -sSL https://get.docker.com/ | sh

USER jenkins
