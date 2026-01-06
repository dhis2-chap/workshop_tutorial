#!/bin/bash
# Demo setup script for CHAP Workshop
# Run inside a fresh Docker container: docker run -it --rm ubuntu:24.04 bash
# Then: curl -sSL <url> | bash  OR copy-paste sections

set -e

echo "========================================"
echo "CHAP Workshop Demo Setup"
echo "========================================"
echo ""

# ----------------------------------------
# PART 1: Install tools
# ----------------------------------------

echo ">>> Installing git, curl, wget..."
apt update && apt install -y git curl wget sudo

echo ""
echo ">>> Installing GitHub CLI (gh)..."
(type -p wget >/dev/null || (apt update && apt-get install wget -y)) \
&& mkdir -p -m 755 /etc/apt/keyrings \
&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
&& cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

echo ""
echo ">>> Installing uv (Python package manager)..."
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

echo ""
echo "========================================"
echo "Setup complete!"
echo "========================================"
echo ""
echo "Installed versions:"
git --version
gh --version | head -1
uv --version
echo ""
echo "Next steps:"
echo "  1. Run: gh auth login"
echo "  2. Run: git config --global user.name \"Your Name\""
echo "  3. Run: git config --global user.email \"you@example.com\""
echo ""
