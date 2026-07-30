# Paciva Edge — Multi-Platform Model Packs

## Supported Hardware Acceleration Backends
- **macOS Metal**: `backend-mlx`
- **Linux / Vulkan**: `backend-llamacpp`
- **Windows ARM64**: `backend-onnx-qnn` (Qualcomm Hexagon NPU offload)
- **Linux VPC Containers**: `backend-vllm`

## Resumable Downloader Architecture
All model packs are divided into 10MB chunked HTTP Range requests, each validated with SHA-256 and signed via Ed25519 manifests.
