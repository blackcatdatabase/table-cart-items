-- Auto-generated from schema-views-postgres.psd1 (map@38d5403)
-- engine: postgres
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
