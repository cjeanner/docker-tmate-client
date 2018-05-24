FROM fedora:latest

ARG uid=1000

RUN dnf update -y
RUN dnf install -y tmate procps-ng openssh sudo git git-review vim
RUN yum clean all

COPY ./start.sh /start.sh
COPY ./run_tmate /usr/bin/run_tmate
RUN chmod +x /start.sh
RUN chmod +x /usr/bin/run_tmate

COPY sudo.wheel /etc/sudoers.d/wheel

RUN adduser --home /home/tmate --uid $uid --groups wheel --shell /bin/bash tmate
USER tmate
WORKDIR /home/tmate

CMD /start.sh
