FROM gitpod/workspace-full

USER root
RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add - \
     && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
     && apt-get update \
     && apt-get install -y tailscale \
     && apt-get install -y screen

USER gitpod

ENV ALL_PROXY=socks5://localhost:1055/
ENV HTTP_PROXY=localhost:1080
ENV http_proxy=localhost:1080
