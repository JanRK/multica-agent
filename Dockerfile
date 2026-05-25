FROM debian:trixie-slim

# System deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git ca-certificates jq \
    && rm -rf /var/lib/apt/lists/*

# Install multica CLI
ARG MULTICA_VERSION=latest
RUN set -e; \
    ARCH=$(dpkg --print-architecture); \
    if [ "$MULTICA_VERSION" = "latest" ]; then \
      LATEST=$(curl -sI https://github.com/multica-ai/multica/releases/latest | grep -i '^location:' | sed 's/.*tag\///' | tr -d '\r\n'); \
    else \
      LATEST="${MULTICA_VERSION#v}"; LATEST="v${LATEST}"; \
    fi; \
    VERSION="${LATEST#v}"; \
    curl -sL "https://github.com/multica-ai/multica/releases/download/${LATEST}/multica-cli-${VERSION}-linux-${ARCH}.tar.gz" \
      | tar -xz -C /usr/local/bin multica; \
    chmod +x /usr/local/bin/multica

# Install OpenCode
RUN set -e; \
    ARCH=$(dpkg --print-architecture); \
    if [ "$ARCH" = "amd64" ]; then ARCH="x64"; fi; \
    curl -sL "https://github.com/anomalyco/opencode/releases/latest/download/opencode-linux-${ARCH}.tar.gz" \
      | tar -xz -C /usr/local/bin opencode; \
    chmod +x /usr/local/bin/opencode

# Create non-root user
RUN useradd -m -s /bin/bash multica
USER multica
WORKDIR /home/multica

# Workspace directory
RUN mkdir -p /home/multica/multica_workspaces

ENV MULTICA_WORKSPACES_ROOT=/home/multica/multica_workspaces \
    MULTICA_OPENCODE_PATH=/usr/local/bin/opencode

ENTRYPOINT ["sh", "-c", "while [ ! -f ~/.multica/config.json ]; do sleep 5; done; exec multica daemon start --foreground"]
