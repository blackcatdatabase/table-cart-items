-- Auto-generated from schema-map.psd1 (map@6cefe8e)
-- table: cart_items
ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_cart FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE;

ALTER TABLE cart_items ADD CONSTRAINT fk_cart_items_book FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;
