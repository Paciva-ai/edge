# Paciva Edge — Uninstallation & Zeroization Guide

## Full Removal & Flash Zeroization

To purge Paciva Edge binary artifacts, OS Keychain keys, and cached local weights:

```bash
paciva-edge zeroize --purge-all
```

This first purges the OS Keychain master key, performs a 0x00 block overwrite on SQLite database files, and sends a SIGKILL signal.
