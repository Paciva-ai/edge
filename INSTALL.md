# Paciva Edge — Installation Guide

## System Requirements
- Apple Silicon (macOS 14+), Intel/AMD x86_64, or Windows ARM64 with Qualcomm Hexagon NPU.
- 16GB RAM minimum (32GB recommended for local model weights).

## Quick Install

### macOS / Apple Silicon
```bash
curl -fsSL https://raw.githubusercontent.com/Paciva-ai/edge/main/install.sh | sh
```

### Windows ARM64 (Hexagon NPU)
```powershell
iwr -useb https://raw.githubusercontent.com/Paciva-ai/edge/main/install.ps1 | iex
```

### Docker / OCI Container
```bash
docker run -d --name paciva-edge --gpu all ghcr.io/paciva-ai/edge:latest
```
