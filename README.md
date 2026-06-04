# Multica Agent

<!-- MULTICA:v0.3.16 -->
<!-- OPENCODE:v1.15.13 -->
<!-- HERMES:v2026.5.29.2 -->

[![GHCR](https://img.shields.io/badge/ghcr.io-janrk%2Fmultica--agent-blue?logo=github)](https://github.com/JanRK/multica-agent/pkgs/container/multica-agent)
[![Version](https://img.shields.io/badge/version-m0.3.8--o1.15.10-blue)](https://github.com/JanRK/multica-agent/pkgs/container/multica-agent)
[![Multica](https://img.shields.io/badge/multica-v0.3.8-purple?logo=github)](https://github.com/multica-ai/multica)
[![OpenCode](https://img.shields.io/badge/opencode-v1.15.10-purple?logo=github)](https://github.com/anomalyco/opencode)
[![Hermes](https://img.shields.io/badge/hermes--agent-v2026.5.29.2-purple?logo=github)](https://github.com/NousResearch/hermes-agent)

Docker image running the [Multica](https://github.com/multica-ai/multica) daemon with [OpenCode](https://github.com/anomalyco/opencode) and [Hermes](https://github.com/NousResearch/hermes-agent) available as agent CLIs, published automatically to **GitHub Container Registry**.

Hermes is installed from the pinned release tag via the upstream `scripts/install.sh` (with `--skip-setup --skip-browser`).

## Quick start

```bash
docker pull ghcr.io/janrk/multica-agent:latest
docker run -e MULTICA_PAT=mul_xxx -e MULTICA_SERVER_URL=ws://your-server/ws \
  ghcr.io/janrk/multica-agent:latest
```

## Tags

Tags use the format `m{multica_version}-o{opencode_version}-h{hermes_version}`, e.g. `m0.3.14-o1.15.13-h2026.5.29.2`. A new image is built whenever any of the upstreams releases a new version.

## How it works

A daily cron checks [multica-ai/multica](https://github.com/multica-ai/multica/releases), [anomalyco/opencode](https://github.com/anomalyco/opencode/releases) and [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent/releases) for new releases. If any has updated, a new multi-arch image is built and pushed.

## License

MIT
