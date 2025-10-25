#!/usr/bin/env bash
set -euo pipefail

echo "=== Triton Bot Update Script Started ==="

cd ~/ojuswi/triton-bot

# 1️⃣ Stop the running Triton service
make stop

# 2️⃣ Update repository from GitHub
make update

# 3️⃣ Reinstall
echo "➡️  Running make install..."
poetry env activate
poetry install
make install

# 4️⃣ Restart the Triton service
echo "➡️  Starting triton.service..."
make start

echo "✅ Triton Bot Update Completed Successfully!"
