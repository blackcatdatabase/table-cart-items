-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  cart_items

CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items (cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, sku_norm);

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items ON cart_items (tenant_id, cart_id, book_id, sku);

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);
