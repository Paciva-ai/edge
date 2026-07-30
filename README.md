# Paciva Edge (`paciva-edge`)

Standalone multi-platform open-source runtime, cross-compilation pipeline, and packaging toolchain for **Paciva Edge**.

## Architecture & Hardware Backends
- **macOS Apple Silicon (`aarch64-apple-darwin`)**: Metal acceleration (`backend-mlx`).
- **Windows / Linux x86_64 (`x86_64`)**: Vulkan & DirectML acceleration (`backend-llamacpp`).
- **Windows ARM64 (`aarch64-pc-windows-msvc`)**: Qualcomm Hexagon NPU offload (`backend-onnx-qnn`).
- **Linux Container (`aarch64-unknown-linux-gnu`)**: OCI container & Helm chart distribution (`backend-vllm`).

## Quick Install

### macOS (Apple Silicon)
```bash
curl -fsSL https://raw.githubusercontent.com/Paciva-ai/edge/main/install.sh | sh
```

### Windows ARM64
```powershell
iwr -useb https://raw.githubusercontent.com/Paciva-ai/edge/main/install.ps1 | iex
```

### Docker / OCI Container
```bash
docker run -d --name paciva-edge --gpu all ghcr.io/paciva-ai/edge:latest
```

## Security & Clean-Room Guarantee
This repository contains strictly open-source runtime binaries, CLI tools, and installation scripts. Zero enterprise database schemas, internal API keys, or proprietary backend code are included.

## License
[Apache License 2.0](LICENSE)
