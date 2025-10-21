-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00)
-- table: cart_items
CREATE TABLE IF NOT EXISTS cart_items (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  cart_id CHAR(36) NOT NULL,
  book_id BIGINT UNSIGNED NOT NULL,
  sku VARCHAR(64) NULL,
  variant JSON NULL,
  quantity INT UNSIGNED NOT NULL,
  unit_price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  price_snapshot DECIMAL(12,2) NOT NULL,
  currency CHAR(3) NOT NULL,
  meta JSON NULL,
  PRIMARY KEY (id),
  INDEX idx_cart_items_cart_id (cart_id),
  CONSTRAINT chk_cart_currency CHECK (currency REGEXP ''^[A-Z]{3}$''),
  CONSTRAINT chk_cart_qty CHECK (quantity > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
