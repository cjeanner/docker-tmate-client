FROM fedora:latest

ARG uid=1000
ARG usr

RUN dnf update -y && \
  dnf install -y \
    bash-completion \
    gcc \
    git \
    git-review \
    openssh \
    procps-ng \
    python2-reno \
    python3-reno \
    python2-tox \
    python3-tox \
    sudo \
    tmate \
    vim \
    && dnf clean all

COPY ./start.sh /start.sh
COPY ./run_tmate /usr/bin/run_tmate
RUN chmod +x /start.sh
RUN chmod +x /usr/bin/run_tmate

COPY sudo.wheel /etc/sudoers.d/wheel

RUN adduser --home /home/$usr --uid $uid --groups wheel --shell /bin/bash $usr
USER $usr
COPY ./user.bashrc /home/$usr/.bashrc
WORKDIR /home/$usr

CMD /start.sh
