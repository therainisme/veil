FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      wget \
      git \
      vim \
      nano \
      tmux \
      htop \
      iproute2 \
      iputils-ping \
      traceroute \
      dnsutils \
      openssh-server \
      systemd \
      systemd-sysv \
      dbus && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
