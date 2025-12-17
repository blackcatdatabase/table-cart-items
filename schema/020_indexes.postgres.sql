-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  cart_items

CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items (cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, sku_norm);

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items ON cart_items (tenant_id, cart_id, book_id, sku);

CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_book ON cart_items (tenant_id, book_id);
