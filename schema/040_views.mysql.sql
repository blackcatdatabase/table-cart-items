-- Auto-generated from schema-views-mysql.yaml (map@sha1:B3C579FF17AC186C47D2C4AC86B0738DB2308BF2)
-- engine: mysql
-- table:  cart_items

-- Contract view for [cart_items]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_cart_items AS
SELECT
  tenant_id,
  id,
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
