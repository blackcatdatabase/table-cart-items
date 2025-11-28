-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  cart_items

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_cart  FOREIGN KEY (tenant_id, cart_id) REFERENCES carts(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_book  FOREIGN KEY (tenant_id, book_id) REFERENCES books(tenant_id, id) ON DELETE CASCADE;
