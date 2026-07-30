#!/bin/sh
set -e

echo "==> Paciva Edge Installer"
OS="$(uname -s)"
ARCH="$(uname -m)"

echo "[+] Detected OS: ${OS}, Architecture: ${ARCH}"

if [ "${OS}" = "Darwin" ]; then
    if [ "${ARCH}" = "arm64" ]; then
        TARGET="aarch64-apple-darwin"
    else
        TARGET="x86_64-apple-darwin"
    fi
elif [ "${OS}" = "Linux" ]; then
    if [ "${ARCH}" = "aarch64" ]; then
        TARGET="aarch64-unknown-linux-gnu"
    else
        TARGET="x86_64-unknown-linux-gnu"
    fi
else
    echo "[!] Unsupported OS ${OS}. Use Docker or Windows PowerShell installer."
    exit 1
fi

echo "[+] Selected Target Triple: ${TARGET}"

BIN_DIR="${HOME}/.local/bin"
mkdir -p "${BIN_DIR}"

echo "[+] Downloading paciva-edge executable to ${BIN_DIR}/paciva-edge..."
curl -fsSL https://raw.githubusercontent.com/Paciva-ai/edge/main/bin/paciva-edge -o "${BIN_DIR}/paciva-edge"
chmod +x "${BIN_DIR}/paciva-edge"

# Ensure ~/.local/bin is in PATH for current script invocation
export PATH="${BIN_DIR}:${PATH}"

# Check shell configuration files for PATH export
if [ -f "${HOME}/.zshrc" ]; then
    if ! grep -q '\.local/bin' "${HOME}/.zshrc" 2>/dev/null; then
        echo 'export PATH="${HOME}/.local/bin:$PATH"' >> "${HOME}/.zshrc"
        echo "[+] Added ~/.local/bin to ${HOME}/.zshrc"
    fi
elif [ -f "${HOME}/.bash_profile" ]; then
    if ! grep -q '\.local/bin' "${HOME}/.bash_profile" 2>/dev/null; then
        echo 'export PATH="${HOME}/.local/bin:$PATH"' >> "${HOME}/.bash_profile"
        echo "[+] Added ~/.local/bin to ${HOME}/.bash_profile"
    fi
fi

# Fallback: symlink to /usr/local/bin if writable
if [ -d "/usr/local/bin" ] && [ -w "/usr/local/bin" ]; then
    ln -sf "${BIN_DIR}/paciva-edge" /usr/local/bin/paciva-edge 2>/dev/null || true
fi

echo "[+] Verifying 'paciva-edge doctor' execution..."

if command -v paciva-edge >/dev/null 2>&1; then
    paciva-edge doctor
    echo "==> Paciva Edge installed and verified successfully!"
elif [ -x "${BIN_DIR}/paciva-edge" ]; then
    "${BIN_DIR}/paciva-edge" doctor
    echo "==> Paciva Edge installed and verified successfully!"
else
    echo "[!] Installation verification failed: paciva-edge command failed to execute."
    exit 1
fi
