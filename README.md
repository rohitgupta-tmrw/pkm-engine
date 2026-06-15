# pkm-engine — AI-assisted Personal Knowledge Management pipeline

Clip → synthesized wiki page, $0 infrastructure, zero local daemon.

## Setup

```bash
pip install -e .
cp .env.example .env
# Edit .env and fill in your API keys
```

## Local dev

Leave `TURSO_URL` blank in `.env` to use a local `pkm.db` SQLite file (offline development mode).

## Running tests

```bash
pytest tests/
```
