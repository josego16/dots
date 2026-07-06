# Installation Guide

Step-by-step instructions to set up a development environment from scratch on a fresh Ubuntu/Debian install.

## Fonts

### CaskaydiaCove Nerd Font

```sh
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip \
  && unzip -o /tmp/CascadiaCode.zip -d /tmp/CascadiaCode \
  && mkdir -p ~/.local/share/fonts \
  && cp /tmp/CascadiaCode/*.ttf ~/.local/share/fonts/ \
  && fc-cache -fv \
  && rm -rf /tmp/CascadiaCode /tmp/CascadiaCode.zip
```

### FiraCode Nerd Font

```sh
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip \
  && unzip -o /tmp/FiraCode.zip -d /tmp/FiraCode \
  && mkdir -p ~/.local/share/fonts \
  && cp /tmp/FiraCode/*.ttf ~/.local/share/fonts/ \
  && fc-cache -fv \
  && rm -rf /tmp/FiraCode /tmp/FiraCode.zip
```

### Iosevka Nerd Font

```sh
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Iosevka.zip \
  && unzip -o /tmp/Iosevka.zip -d /tmp/Iosevka \
  && mkdir -p ~/.local/share/fonts \
  && cp /tmp/Iosevka/*.ttf ~/.local/share/fonts/ \
  && fc-cache -fv \
  && rm -rf /tmp/Iosevka /tmp/Iosevka.zip
```

### JetBrains Mono Nerd Font

```sh
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip \
  && unzip -o /tmp/JetBrainsMono.zip -d /tmp/JetBrainsMono \
  && mkdir -p ~/.local/share/fonts \
  && cp /tmp/JetBrainsMono/*.ttf ~/.local/share/fonts/ \
  && fc-cache -fv \
  && rm -rf /tmp/JetBrainsMono /tmp/JetBrainsMono.zip
```

### Inter Font (Google)

```sh
wget -P /tmp https://github.com/rsms/inter/releases/download/v4.1/Inter-4.1.zip \
  && unzip -o /tmp/Inter-4.1.zip -d /tmp/Inter \
  && mkdir -p ~/.local/share/fonts \
  && find /tmp/Inter -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp {} ~/.local/share/fonts/ \; \
  && fc-cache -fv \
  && rm -rf /tmp/Inter /tmp/Inter-4.1.zip
```

## IDE, terminal, browser and other apps

### Zed

```sh
curl -f https://zed.dev/install.sh | sh
```

### Kitty

```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

### Chrome

```sh
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && sudo apt install -y /tmp/chrome.deb \
  && rm /tmp/chrome.deb
```

### DBeaver

```sh
wget -O /tmp/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb \
  && sudo apt install -y /tmp/dbeaver.deb \
  && rm /tmp/dbeaver.deb
```

## External Package Manager

### Homebrew

Install Homebrew using the official installer.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Uninstall Homebrew.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

## Terminal tools

Install Homebrew apps using `brew install`.

```sh
brew install fzf lazygit lazydocker ripgrep bat fd eza
```

### Zoxide

```sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

### Starship

```sh
curl -sS https://starship.rs/install.sh | sh
```

## Runtimes

### Fnm

```sh
curl -fsSL https://fnm.vercel.app/install | bash
```

### Pnpm

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

### Bun

```sh
curl -fsSL https://bun.sh/install | bash
```

### Sdkman

```sh
curl -s "https://get.sdkman.io" | zsh
```

### Rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Golang

Fetch and install the latest stable release automatically:

```sh
GO_VERSION=$(curl -sL "https://go.dev/dl/?mode=json" | grep -oP '"version":\s*"\Kgo[0-9]+\.[0-9]+\.[0-9]+')
wget -P /tmp "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz" \
  && sudo rm -rf /usr/local/go \
  && sudo tar -C /usr/local -xzf "/tmp/${GO_VERSION}.linux-amd64.tar.gz" \
  && rm "/tmp/${GO_VERSION}.linux-amd64.tar.gz"
```

Add `/usr/local/go/bin` to your `PATH` in `~/.zshrc` or `~/.bashrc`:

```sh
export PATH=$PATH:/usr/local/go/bin
```

## Other tools

### GitHub CLI

```sh
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
```

### Docker

Remove any old Docker packages:

```sh
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
```

Add the official Docker GPG key:

```sh
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Register the Docker APT source:

```sh
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```

Install Docker Engine and plugins:

```sh
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Opencode

```sh
curl -fsSL https://opencode.ai/install | bash
```

### Antigravity

```sh
curl -fsSL https://antigravity.google/cli/install.sh | bash
```

### Gentle-ai

```sh
brew tap Gentleman-Programming/homebrew-starship
brew trust gentleman-programming/tap
brew install gentle-ai
```
