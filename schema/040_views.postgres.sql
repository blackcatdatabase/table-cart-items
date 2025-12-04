-- Auto-generated from schema-views-postgres.yaml (map@4ae85c5)
-- engine: postgres
-- table:  cart_items

-- Contract view for [cart_items]
CREATE OR REPLACE VIEW vw_cart_items AS
SELECT
  id,
  tenant_id,
  cart_id,
  book_id,
  sku,
  variant,
  quantity,
  unit_price,
  price_snapshot,
  currency,
  meta,
  created_at,
  updated_at
FROM cart_items;
