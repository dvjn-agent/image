FROM docker.io/nousresearch/hermes-agent:v2026.6.19@sha256:9f367c7756ef087661a361536a89f438d57a122b958dc23d82d456b1433e6e9e

ENV MISE_DATA_DIR=/opt/mise \
    MISE_CONFIG_DIR=/opt/mise \
    MISE_CACHE_DIR=/tmp/mise \
    MISE_YES=1 \
    PATH=/opt/mise/shims:/usr/local/bin:${PATH}

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ARG MISE_VERSION=v2026.6.13
RUN curl -fsSL https://mise.run | MISE_VERSION=${MISE_VERSION} MISE_INSTALL_PATH=/usr/local/bin/mise sh \
 && mise --version

COPY mise.toml /opt/mise/config.toml
RUN mise install \
 && mise reshim \
 && ln -sf /opt/mise/shims/* /usr/local/bin/ \
 && chmod -R a+rX /opt/mise \
 && rm -rf /tmp/mise
