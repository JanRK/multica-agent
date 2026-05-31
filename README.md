# Multica Agent

<!-- MULTICA:v0.3.12 -->
<!-- OPENCODE:v1.15.13 -->

[![GHCR](https://img.shields.io/badge/ghcr.io-janrk%2Fmultica--agent-blue?logo=github)](https://github.com/JanRK/multica-agent/pkgs/container/multica-agent)
[![Version](https://img.shields.io/badge/version-m0.3.8--o1.15.10-blue)](https://github.com/JanRK/multica-agent/pkgs/container/multica-agent)
[![Multica](https://img.shields.io/badge/multica-v0.3.8-purple?logo=github)](https://github.com/multica-ai/multica)
[![OpenCode](https://img.shields.io/badge/opencode-v1.15.10-purple?logo=github)](https://github.com/anomalyco/opencode)

Docker image running the [Multica](https://github.com/multica-ai/multica) daemon with [OpenCode](https://github.com/anomalyco/opencode) as the agent CLI, published automatically to **GitHub Container Registry**.

## Quick start

```bash
docker pull ghcr.io/janrk/multica-agent:latest
docker run -e MULTICA_PAT=mul_xxx -e MULTICA_SERVER_URL=ws://your-server/ws \
  ghcr.io/janrk/multica-agent:latest
```

## Tags

Tags use the format `m{multica_version}-o{opencode_version}`, e.g. `m0.3.8-o1.15.10`. A new image is built whenever either upstream releases a new version.

## How it works

A daily cron checks [multica-ai/multica](https://github.com/multica-ai/multica/releases) and [anomalyco/opencode](https://github.com/anomalyco/opencode/releases) for new releases. If either has updated, a new multi-arch image is built and pushed.

## License

MIT
