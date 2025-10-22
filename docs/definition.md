<!-- Auto-generated from schema-map.psd1 @ 6cefe8e (2025-10-22T20:27:41+02:00) -->
# Definition – cart_items

Items added to shopping carts.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | NO | — | Surrogate primary key. |  |
| cart_id | CHAR(36) | NO | — | Cart identifier (UUID textual). |  |
| book_id | BIGINT UNSIGNED | NO | — | Book (FK books.id). |  |
| sku | VARCHAR(64) | YES | — | SKU snapshot. |  |
| variant | JSON | YES | — | JSON with selected variant/options. |  |
| quantity | INT UNSIGNED | NO | — | Quantity > 0. |  |
| unit_price | DECIMAL(12,2) | NO | 0.00 | Unit price at time of adding. |  |
| price_snapshot | DECIMAL(12,2) | NO | — | Cached line price for integrity. |  |
| currency | CHAR(3) | NO | — | ISO 4217 currency code. |  |
| meta | JSON | YES | — | Additional JSON metadata. |  |