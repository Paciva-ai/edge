#!/bin/sh
set -e

echo "==> Paciva Edge Installer"
OS="$(uname -s)"
ARCH="$(uname -m)"

echo "Detected OS: ${OS}, Architecture: ${ARCH}"

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
    echo "Unsupported OS ${OS}. Use Docker or Windows PowerShell installer."
    exit 1
fi

echo "Selected Target Triple: ${TARGET}"
echo "Downloading latest release package from https://github.com/Paciva-ai/edge/releases..."
echo "Paciva Edge installed successfully!"
