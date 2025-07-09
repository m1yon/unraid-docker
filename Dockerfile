FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    sudo \
    neovim \
    micro \
    git \
    tree \
    curl \
    wget \
    htop \
    iputils-ping \
    ffmpeg \
    7zip \
    jq \
    poppler-utils \
    fd-find \
    ripgrep \
    fzf \
    zoxide \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

# This command does nothing but keeps the container running in the background.
# This allows you to 'docker exec' into it at any time.
CMD ["tail", "-f", "/dev/null"]
