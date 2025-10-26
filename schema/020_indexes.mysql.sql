-- Auto-generated from schema-map-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  cart_items
CREATE UNIQUE INDEX ux_cart_items ON cart_items (cart_id, book_id, sku);
