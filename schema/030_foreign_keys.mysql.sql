-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  cart_items

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_cart FOREIGN KEY (tenant_id, cart_id) REFERENCES carts(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_book FOREIGN KEY (tenant_id, book_id) REFERENCES books(tenant_id, id) ON DELETE CASCADE;
