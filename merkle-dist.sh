#!/bin/bash
echo "demonstration of merkle tree distribution"
cat ./scripts/complex_example.json
echo "given the above json purchased tokens..."
ts-node ./scripts/generate-merkle-root.ts -i ./scripts/complex_example.json | jq .
echo "generated merkle root"
echo "exporting to file for verification stage"
ts-node ./scripts/generate-merkle-root.ts -i ./scripts/complex_example.json | jq . >./scripts/generated-merkle-distributor.json
echo "verifying generated merkle roots"
ts-node ./scripts/verify-merkle-root.ts -i scripts/generated-merkle-distributor.json
echo "verified, cleaning up"
rm -v ./scripts/generated-merkle-distributor.json
