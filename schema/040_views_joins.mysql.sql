-- Auto-generated from joins-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- view:   cart_items_detailed

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_cart_items_detailed AS
SELECT
  ci.id,
  ci.cart_id,
  ci.tenant_id,
  ci.book_id,
  ci.quantity,
  ci.unit_price,
  ci.currency,
  c.user_id,
  b.title      AS book_title,
  a.name       AS author_name
FROM cart_items ci
LEFT JOIN carts c
  ON c.id = ci.cart_id AND c.tenant_id = ci.tenant_id
LEFT JOIN books b
  ON b.id = ci.book_id AND b.tenant_id = ci.tenant_id
LEFT JOIN authors a
  ON a.id = b.author_id AND a.tenant_id = b.tenant_id;
