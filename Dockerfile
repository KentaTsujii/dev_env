FROM ubuntu:23.10

WORKDIR /opt

COPY dotfiles/ /root/

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get install -y git curl zsh && \
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz && \
    tar xzvf nvim-linux64.tar.gz && \
    rm nvim-linux64.tar.gz && \
    ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim && \
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
      | bash -s -- --repo rossmacarthur/sheldon --to /opt && \
    ln -s /opt/sheldon /usr/local/bin/sheldon && \
    curl -sS https://starship.rs/install.sh | sh -s -- --yes && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    rm lazygit.tar.gz && \
    install lazygit /usr/local/bin

WORKDIR /root

ENTRYPOINT ["/usr/bin/zsh"]

