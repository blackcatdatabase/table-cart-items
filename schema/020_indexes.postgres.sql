-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  cart_items

CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items (cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, COALESCE(sku, ''));

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items ON cart_items (tenant_id, cart_id, book_id, sku);

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);
