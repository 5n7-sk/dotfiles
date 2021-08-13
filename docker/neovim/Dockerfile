FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

ARG asdf_golang_version="1.16.7"
ARG asdf_nodejs_version="16.6.1"
ARG asdf_python_version="3.9.6"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ Asia/Tokyo

WORKDIR /work

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    dirmngr \
    gcc \
    git \
    gpg \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-dev && \
    apt-get -y clean && \
    rm -r /var/lib/apt/lists/*

# Neovim nightly
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && \
    chmod +x ./nvim.appimage && \
    ./nvim.appimage --appimage-extract && \
    mv squashfs-root / && \
    ln -s /squashfs-root/AppRun /usr/local/bin/nvim && \
    rm ./nvim.appimage

RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git "$HOME/.asdf" && \
    echo ". \"\$HOME/.asdf/asdf.sh\"" >> "$HOME/.bashrc" && \
    . "$HOME/.asdf/asdf.sh" && \
    # Go
    asdf plugin add golang && \
    asdf install golang ${asdf_golang_version} && \
    asdf global golang ${asdf_golang_version} && \
    # Node.js
    asdf plugin add nodejs && \
    asdf install nodejs ${asdf_nodejs_version} && \
    asdf global nodejs ${asdf_nodejs_version} && \
    # Python
    asdf plugin add python && \
    asdf install python ${asdf_python_version} && \
    asdf global python ${asdf_python_version} && \
    pip install --user pynvim

COPY .config/nvim /root/.config/nvim

RUN nvim --headless +PackerSync +sleep30 +qa

CMD ["nvim"]
