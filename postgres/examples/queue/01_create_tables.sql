DROP SCHEMA IF EXISTS deadtuples;
CREATE SCHEMA deadtuples;

SET search_path TO deadtuples;

CREATE TABLE queue (
    id SERIAL PRIMARY KEY,
    payload JSONB NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending', -- 'pending', 'processing', 'completed'
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX queue_status_idx ON queue (status);
CREATE INDEX queue_created_at_idx ON queue (created_at);
