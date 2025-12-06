-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  cart_items

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_cart FOREIGN KEY (tenant_id, cart_id) REFERENCES carts(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_book FOREIGN KEY (tenant_id, book_id) REFERENCES books(tenant_id, id) ON DELETE CASCADE;
