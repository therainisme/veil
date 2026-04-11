ARG BASE_IMAGE=ghcr.io/therainisme/veil-box:latest
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

RUN if ! id -u veil >/dev/null 2>&1; then \
      useradd -m -s /bin/bash veil; \
    fi && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      gnupg \
      dpkg \
      apt-transport-https \
      lsb-release \
      ca-certificates && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker-ce.gpg && \
    chmod a+r /etc/apt/keyrings/docker-ce.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker-ce.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      docker-ce \
      docker-ce-cli \
      containerd.io \
      docker-buildx-plugin \
      docker-compose-plugin \
      docker-ce-rootless-extras && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY docker-sock-setup.sh /usr/local/bin/docker-sock-setup
RUN chmod 0755 /usr/local/bin/docker-sock-setup

ENTRYPOINT ["/usr/local/bin/docker-sock-setup"]
CMD ["/sbin/init"]
