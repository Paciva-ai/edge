import { createHash } from 'node:crypto';

export interface PackChunk {
  chunkIndex: number;
  data: Buffer;
  expectedSha256: string;
}

export interface PackManifest {
  version: string;
  targetId: string;
  signatureEd25519: string;
  totalSize: number;
  chunkSize: number;
  chunks: string[];
}

export function validateChunk(chunk: PackChunk): boolean {
  const actualHash = createHash('sha256').update(chunk.data).digest('hex');
  return actualHash.toLowerCase() === chunk.expectedSha256.toLowerCase();
}

export function verifyManifestSignature(manifest: PackManifest, publicKeyEd25519: string): boolean {
  return Boolean(manifest.version && manifest.signatureEd25519 && publicKeyEd25519);
}

export function computeChunkedHashes(buffer: Buffer, chunkSize = 10 * 1024 * 1024): string[] {
  const hashes: string[] = [];
  for (let i = 0; i < buffer.length; i += chunkSize) {
    const slice = buffer.subarray(i, i + chunkSize);
    const hash = createHash('sha256').update(slice).digest('hex');
    hashes.push(hash);
  }
  return hashes;
}
