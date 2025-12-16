-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  cart_items

CREATE TABLE IF NOT EXISTS cart_items (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  tenant_id BIGINT UNSIGNED NOT NULL,
  cart_id CHAR(36) NOT NULL,
  book_id BIGINT UNSIGNED NOT NULL,
  sku VARCHAR(64) NULL,
  sku_norm VARCHAR(64) AS (COALESCE(sku, '')) STORED,
  variant JSON NULL,
  quantity INT UNSIGNED NOT NULL,
  unit_price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  price_snapshot DECIMAL(12,2) NOT NULL,
  currency CHAR(3) NOT NULL,
  meta JSON NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (id),
  UNIQUE KEY ux_cart_items (tenant_id, cart_id, book_id, sku),
  INDEX idx_cart_items_cart_id (cart_id),
  CONSTRAINT chk_cart_currency CHECK (currency REGEXP '^[A-Z]{3}$'),
  CONSTRAINT chk_cart_qty CHECK (quantity > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
