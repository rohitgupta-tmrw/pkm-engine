-- Graph tables for V1 (SQLite-based property graph; superseded by Neo4j at V2).

CREATE TABLE IF NOT EXISTS graph_nodes (
    id          TEXT PRIMARY KEY,            -- mirrors entity/concept/etc id
    label       TEXT NOT NULL,               -- Source|Concept|Company|Pattern|...
    name        TEXT NOT NULL,
    properties  TEXT,                         -- JSON
    confidence  REAL DEFAULT 0.5,
    provenance  TEXT,                         -- JSON array of {source_id,chunk_id}
    created_at  TEXT NOT NULL,
    updated_at  TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_nodes_label ON graph_nodes(label);

CREATE TABLE IF NOT EXISTS graph_edges (
    id          TEXT PRIMARY KEY,
    src         TEXT NOT NULL REFERENCES graph_nodes(id) ON DELETE CASCADE,
    dst         TEXT NOT NULL REFERENCES graph_nodes(id) ON DELETE CASCADE,
    type        TEXT NOT NULL,               -- SUPPORTS|CONTRADICTS|ABOUT|...
    description TEXT,
    strength    INTEGER CHECK (strength BETWEEN 1 AND 10),
    confidence  REAL DEFAULT 0.5,
    provenance  TEXT,                         -- JSON array
    created_at  TEXT NOT NULL,
    updated_at  TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_edges_src  ON graph_edges(src);
CREATE INDEX IF NOT EXISTS idx_edges_dst  ON graph_edges(dst);
CREATE INDEX IF NOT EXISTS idx_edges_type ON graph_edges(type);
