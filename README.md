# Veil

Veil gives you a shared proxy network for containers by running Mihomo with TUN in `veil-net` and placing `veil-box` in the same network namespace, so traffic from `veil-box` uses your configured proxy path by default and DNS is handled by the proxy container while still returning real IPs.

## Start

1. Create your local config:

```bash
cp veil.yml.example veil.yml
```

2. Edit `veil.yml` and fill in your server settings.

3. Start the stack:

```bash
docker compose up -d
```

4. Enter the box:

```bash
docker exec -it veil-box bash
```

## Update

Update the image and restart the containers:

```bash
docker compose pull
docker compose up -d
```

If you changed `veil.yml`, restart the proxy container:

```bash
docker compose restart veil-net
```
