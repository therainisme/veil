FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl && \
    . /etc/os-release && \
    curl -fsSL "https://pkgs.tailscale.com/stable/ubuntu/${VERSION_CODENAME}.noarmor.gpg" -o /usr/share/keyrings/tailscale-archive-keyring.gpg && \
    curl -fsSL "https://pkgs.tailscale.com/stable/ubuntu/${VERSION_CODENAME}.tailscale-keyring.list" -o /etc/apt/sources.list.d/tailscale.list && \
    apt-get update && \
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
      dbus \
      tailscale && \
    useradd -m -s /bin/bash veil && \
    usermod -aG sudo veil && \
    passwd -d veil && \
    printf 'veil ALL=(ALL) NOPASSWD:ALL\n' > /etc/sudoers.d/veil && \
    chmod 0440 /etc/sudoers.d/veil && \
    systemctl enable tailscaled.service ssh.service && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd

WORKDIR /home/veil

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
