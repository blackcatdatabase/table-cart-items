-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  cart_items
CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items (cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items ON cart_items (cart_id, book_id, sku);
