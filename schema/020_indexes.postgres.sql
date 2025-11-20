-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  cart_items
CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items (cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, COALESCE(sku, ''));

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);
