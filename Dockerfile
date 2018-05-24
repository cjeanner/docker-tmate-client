FROM fedora:latest

ARG usr

RUN dnf update -y
RUN dnf install -y tmate procps-ng openssh sudo git git-review
RUN yum clean all

COPY ./start.sh /start.sh
COPY ./run_tmate /usr/bin/run_tmate
RUN chmod +x /start.sh
RUN chmod +x /usr/bin/run_tmate

COPY sudo.wheel /etc/sudoers.d/wheel

RUN adduser --home /home/$usr --uid 1000 --groups wheel --shell /bin/bash $usr
USER $usr
WORKDIR /home/$usr

CMD /start.sh
