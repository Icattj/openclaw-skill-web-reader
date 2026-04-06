---
name: web-reader
description: Extract clean, readable markdown from any URL using Jina Reader (r.jina.ai). No API key needed for basic use. Use when you need to read a webpage as clean text, extract article content, scrape a page without JavaScript rendering, or get readable content from a URL that web_fetch struggles with.
---

# Web Reader (Jina Reader)

Extract clean markdown from any URL via Jina Reader — no API key required.

## Quick Start

```bash
scripts/read-url.sh "https://example.com/article"
```

## How It Works

Jina Reader (`r.jina.ai`) renders any URL and returns clean markdown. Simply prepend `https://r.jina.ai/` to any URL:

```bash
curl -s "https://r.jina.ai/https://example.com"
```

## Advanced Options

### With headers for better output
```bash
curl -s \
  -H "Accept: text/markdown" \
  -H "X-Return-Format: markdown" \
  "https://r.jina.ai/https://example.com"
```

### Get just the main content (no nav/footer)
```bash
curl -s -H "X-With-Generated-Alt: true" \
  "https://r.jina.ai/https://example.com"
```

### Search the web (Jina Search)
```bash
curl -s "https://s.jina.ai/your+search+query"
```

## When to Use

- **Use web-reader** when `web_fetch` returns garbled/incomplete content
- **Use web-reader** for JavaScript-heavy pages (SPAs)
- **Use web_fetch** for simple pages (faster, no external dependency)
- **Use browser tool** for interactive pages requiring clicks/login

## Rate Limits

- Free tier: ~20 requests/minute
- For heavy use, get an API key at jina.ai and pass via `Authorization: Bearer <key>`

## Script

`scripts/read-url.sh` handles URL encoding and error checking.
