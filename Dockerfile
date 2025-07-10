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
    && rm -rf /var/lib/apt/lists/*

# Install lazygit and lazydocker
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    install lazygit /usr/local/bin && \
    rm lazygit.tar.gz lazygit && \
    LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\\K[^"]*') && \
    curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazydocker.tar.gz lazydocker && \
    install lazydocker /usr/local/bin && \
    rm lazydocker.tar.gz lazydocker

# Install rustup and the latest stable toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install yazi
RUN cargo install --locked yazi-fm yazi-cli

# This command does nothing but keeps the container running in the background.
# This allows you to 'docker exec' into it at any time.
WORKDIR /unraid
CMD ["tail", "-f", "/dev/null"]
