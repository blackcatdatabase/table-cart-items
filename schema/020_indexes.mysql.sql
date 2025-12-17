-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  cart_items

CREATE INDEX idx_cart_items_cart_id ON cart_items (cart_id);

CREATE INDEX idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);

CREATE INDEX idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);

CREATE UNIQUE INDEX ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, sku_norm);
