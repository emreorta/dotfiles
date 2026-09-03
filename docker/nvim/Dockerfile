FROM archlinux/archlinux:latest

ENV VIRTUALENVS_HOME=/root/.virtualenvs
ENV NVIM_IN_DOCKER=1
ENV PATH="/root/.local/bin:$PATH"

RUN pacman -Syu --noconfirm \
    base-devel \
    ca-certificates \
    curl \
    difftastic \
    fd \
    fish \
    fzf \
    git \
    go \
    gzip \
    lua \
    neovim \
    nodejs \
    npm \
    openssh \
    python \
    ripgrep \
    rust \
    tree-sitter-cli \
    unzip \
    uv \
    xclip \
 && rm -rf /var/cache/pacman/pkg/*

# fzf-lua complains without this
RUN git config --system --add safe.directory "*"

# virtualenv needed python provider for neovim
RUN uv tool install virtualfish \
  && uv tool update-shell \
  && mkdir -p "$VIRTUALENVS_HOME" \
  && fish -c "set -gx VIRTUALENVS_HOME $VIRTUALENVS_HOME" \
  && fish -c "vf install" \
  && fish -c "vf new neovim && \
    vf activate neovim && \
    pip install --upgrade pynvim && \
    python -c 'import pynvim' && \
    vf deactivate"

RUN chsh -s $(which fish)

WORKDIR /work
ENTRYPOINT ["nvim"]
