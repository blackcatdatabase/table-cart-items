-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  cart_items

CREATE INDEX idx_cart_items_cart_id ON cart_items (cart_id);

CREATE INDEX idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);

CREATE INDEX idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);

CREATE UNIQUE INDEX ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, (COALESCE(sku, '')));
