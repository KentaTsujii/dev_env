FROM ubuntu:23.10

ENV LESSCHARSET "utf-8"
ENV RUST_HOME /usr/local/lib/rust
ENV RUSTUP_HOME ${RUST_HOME}/rustup
ENV CARGO_HOME ${RUST_HOME}/cargo
ENV GOPATH=${HOME}/go
ENV PATH ${PATH}:${CARGO_HOME}/bin:${GOPATH}/bin

RUN cd /opt && \
    apt-get update && \
    apt-get install -y software-properties-common \
                       sudo \
                       build-essential \
                       curl \
                       wget \
                       zsh \
                       zip \
                       unzip \
                       gosu \
                       fd-find \
                       ripgrep \
                       trash-cli \
                       python3-pip \
                       python3-venv \
                       nodejs \
                       npm \
                       golang-go \
                       ruby-full \
                       luarocks && \
    mkdir /usr/local/lib/rust && \
    chmod 0755 ${RUST_HOME} && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ${RUST_HOME}/rustup.sh && \
    chmod +x ${RUST_HOME}/rustup.sh && \
    ${RUST_HOME}/rustup.sh -y --default-toolchain nightly --no-modify-path && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get install -y git && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get -y install docker-ce-cli && \
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
    install lazygit /usr/local/bin && \
    git config --global --add safe.directory '*' && \
    gpasswd -a ubuntu systemd-journal && \
    echo ubuntu:user | chpasswd && \
    echo "ubuntu   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY --chown=ubuntu:ubuntu dotfiles/ /home/ubuntu/
COPY --chmod=777 entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /home/ubuntu

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/usr/bin/zsh"]

