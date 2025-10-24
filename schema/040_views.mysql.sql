-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-10-24T09:19:46Z)
-- engine: mysql
-- table:  cart_items
-- Contract view for [cart_items]
CREATE OR REPLACE VIEW vw_cart_items AS
SELECT
  id,
  cart_id,
  book_id,
  sku,
  variant,
  quantity,
  unit_price,
  price_snapshot,
  currency,
  meta
FROM cart_items;
