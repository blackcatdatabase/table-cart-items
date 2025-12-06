-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  cart_items

CREATE INDEX idx_cart_items_cart_id ON cart_items (cart_id);

CREATE INDEX idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);

CREATE INDEX idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);

CREATE UNIQUE INDEX ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, sku_norm);
