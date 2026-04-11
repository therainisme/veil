#!/usr/bin/env bash
set -euo pipefail

if [ -S /var/run/docker.sock ]; then
  sock_gid="$(stat -c '%g' /var/run/docker.sock)"

  if getent group docker >/dev/null 2>&1; then
    current_gid="$(getent group docker | cut -d: -f3)"
    if [ "$current_gid" != "$sock_gid" ]; then
      groupmod -o -g "$sock_gid" docker
    fi
  else
    groupadd -for -g "$sock_gid" docker
  fi

  usermod -aG docker veil || true
fi

exec "$@"
