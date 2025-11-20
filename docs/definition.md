<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – cart_items

Items added to shopping carts. UNIQUE (cart_id, book_id, sku) to prevent duplicate items in the cart.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — |  |  |
| cart_id | CHAR(36) | NO | — | Cart identifier (UUID textual). |  |
| book_id | BIGINT | NO | — | Book (FK books.id). |  |
| sku | VARCHAR(64) | YES | — | SKU snapshot. |  |
| variant | JSONB | YES | — | JSON with selected variant/options. |  |
| quantity | INTEGER | NO | — | Quantity > 0. |  |
| unit_price | NUMERIC(12,2) | NO | 0.00 | Unit price at time of adding. |  |
| price_snapshot | NUMERIC(12,2) | NO | — | Cached line price for integrity. |  |
| currency | CHAR(3) | NO | — | ISO 4217 currency code. |  |
| meta | JSONB | YES | — | Additional JSON metadata. |  |