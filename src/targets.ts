export interface EdgeTarget {
  id: string;
  triple: string;
  name: string;
  hardwareBackend: 'backend-mlx' | 'backend-llamacpp' | 'backend-onnx-qnn' | 'backend-vllm';
  containerFormat?: 'OCI' | 'Helm' | 'Binary';
}

export const EDGE_TARGETS: Record<string, EdgeTarget> = {
  APPLE_SILICON: {
    id: 'apple-silicon',
    triple: 'aarch64-apple-darwin',
    name: 'macOS Apple Silicon (Metal)',
    hardwareBackend: 'backend-mlx',
    containerFormat: 'Binary',
  },
  INTEL_AMD_X86: {
    id: 'x86-64',
    triple: 'x86_64-pc-windows-msvc',
    name: 'Windows/Linux x86_64',
    hardwareBackend: 'backend-llamacpp',
    containerFormat: 'Binary',
  },
  WINDOWS_ARM64_NPU: {
    id: 'win-arm64-npu',
    triple: 'aarch64-pc-windows-msvc',
    name: 'Windows ARM64 (Qualcomm Hexagon NPU)',
    hardwareBackend: 'backend-onnx-qnn',
    containerFormat: 'Binary',
  },
  LINUX_ARM64_CONTAINER: {
    id: 'linux-arm64-oci',
    triple: 'aarch64-unknown-linux-gnu',
    name: 'Linux ARM64 OCI Container',
    hardwareBackend: 'backend-vllm',
    containerFormat: 'OCI',
  },
};
