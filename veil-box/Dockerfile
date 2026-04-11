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
      sudo \
      python3 \
      python3-pip \
      build-essential \
      pkg-config \
      libssl-dev \
      iproute2 \
      iputils-ping \
      traceroute \
      dnsutils \
      openssh-server \
      systemd \
      systemd-sysv \
      dbus && \
    useradd -m -s /bin/bash veil && \
    usermod -aG sudo veil && \
    passwd -d veil && \
    printf 'veil ALL=(ALL) NOPASSWD:ALL\n' > /etc/sudoers.d/veil && \
    chmod 0440 /etc/sudoers.d/veil && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd

WORKDIR /home/veil

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
