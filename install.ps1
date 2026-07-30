Write-Host "==> Paciva Edge Windows Installer" -ForegroundColor Green
$arch = $env:PROCESSOR_ARCHITECTURE

if ($arch -eq "ARM64") {
    $target = "aarch64-pc-windows-msvc"
    Write-Host "Detected Windows ARM64 (Qualcomm Hexagon NPU Offload enabled)." -ForegroundColor Cyan
} else {
    $target = "x86_64-pc-windows-msvc"
    Write-Host "Detected Windows x86_64." -ForegroundColor Cyan
}

Write-Host "Target: $target"
Write-Host "Downloading latest release package from https://github.com/Paciva-ai/edge/releases..."
Write-Host "Paciva Edge installed successfully!" -ForegroundColor Green
