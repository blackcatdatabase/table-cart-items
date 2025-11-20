-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  cart_items
CREATE UNIQUE INDEX ux_cart_items ON cart_items (tenant_id, cart_id, book_id, sku);

CREATE INDEX idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);
