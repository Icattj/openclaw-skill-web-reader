#!/usr/bin/env bash
# Read a URL via Jina Reader and output clean markdown
# Usage: read-url.sh <url>
set -euo pipefail

URL="${1:?Usage: read-url.sh <url>}"

# Ensure URL has protocol
if [[ ! "$URL" =~ ^https?:// ]]; then
    URL="https://$URL"
fi

echo "📖 Reading: $URL"
echo ""

RESPONSE=$(curl -sL --max-time 30 \
    -H "Accept: text/markdown" \
    "https://r.jina.ai/$URL" 2>/dev/null)

if [ -z "$RESPONSE" ]; then
    echo "❌ No content returned. The page may be blocked or empty."
    exit 1
fi

echo "$RESPONSE"
