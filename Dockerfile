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
    # Dependencies for building yazi
    build-essential \
    libssl-dev \
    pkg-config \
    libfontconfig1-dev \
    lazygit \
    lazydocker \
    && rm -rf /var/lib/apt/lists/*


# Install rustup and the latest stable toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install yazi
RUN cargo install --locked yazi-fm yazi-cli

# This command does nothing but keeps the container running in the background.
# This allows you to 'docker exec' into it at any time.
WORKDIR /unraid
CMD ["tail", "-f", "/dev/null"]
