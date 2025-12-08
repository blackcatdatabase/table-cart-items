# cart_items

Items added to shopping carts. UNIQUE (cart_id, book_id, sku) to prevent duplicate items in the cart.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| book_id | BIGINT | NO |  | Book (FK books.id). |
| cart_id | CHAR(36) | NO |  | Cart identifier (UUID textual). |
| currency | CHAR(3) | NO |  | ISO 4217 currency code. |
| id | BIGINT | NO |  | Surrogate primary key. |
| meta | JSONB | YES |  | Additional JSON metadata. |
| price_snapshot | NUMERIC(12,2) | NO |  | Cached line price for integrity. |
| quantity | INTEGER | NO |  | Quantity > 0. |
| sku | VARCHAR(64) | YES |  | SKU snapshot. |
| unit_price | NUMERIC(12,2) | NO | 0.00 | Unit price at time of adding. |
| variant | JSONB | YES |  | JSON with selected variant/options. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_cart_items | tenant_id, cart_id, book_id, sku |
| ux_cart_items_tenant_norm | tenant_id, cart_id, book_id, sku_norm |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_cart_items_cart_id | cart_id | CREATE INDEX idx_cart_items_cart_id ON cart_items (cart_id) |
| idx_cart_items_tenant_book | tenant_id,book_id | CREATE INDEX idx_cart_items_tenant_book ON cart_items (tenant_id, book_id) |
| idx_cart_items_tenant_cart | tenant_id,cart_id | CREATE INDEX idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id) |
| ux_cart_items | tenant_id,cart_id,book_id,sku | UNIQUE KEY ux_cart_items (tenant_id, cart_id, book_id, sku) |
| ux_cart_items_tenant_norm | tenant_id,cart_id,book_id,sku_norm | CREATE UNIQUE INDEX ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, sku_norm) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_cart_items_book | tenant_id,book_id | books(tenant_id,id) | ON DELETE CASCADE |
| fk_cart_items_cart | tenant_id,cart_id | carts(tenant_id,id) | ON DELETE CASCADE |
| fk_cart_items_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_cart_items | tenant_id, cart_id, book_id, sku |
| ux_cart_items_tenant_norm | tenant_id, cart_id, book_id, sku_norm |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_cart_items_cart_id | cart_id | CREATE INDEX IF NOT EXISTS idx_cart_items_cart_id ON cart_items (cart_id) |
| idx_cart_items_tenant_book | tenant_id,book_id | CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_book ON cart_items (tenant_id, book_id) |
| idx_cart_items_tenant_cart | tenant_id,cart_id | CREATE INDEX IF NOT EXISTS idx_cart_items_tenant_cart ON cart_items (tenant_id, cart_id) |
| ux_cart_items | tenant_id,cart_id,book_id,sku | CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items ON cart_items (tenant_id, cart_id, book_id, sku) |
| ux_cart_items_tenant_norm | tenant_id,cart_id,book_id,sku_norm | CREATE UNIQUE INDEX IF NOT EXISTS ux_cart_items_tenant_norm ON cart_items (tenant_id, cart_id, book_id, sku_norm) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_cart_items_book | tenant_id,book_id | books(tenant_id,id) | ON DELETE CASCADE |
| fk_cart_items_cart | tenant_id,cart_id | carts(tenant_id,id) | ON DELETE CASCADE |
| fk_cart_items_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_cart_items | mysql | algorithm=MERGE, security=INVOKER | [packages\cart-items\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/cart-items/schema/040_views.mysql.sql) |
| vw_cart_items_detailed | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\cart-items\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/cart-items/schema/040_views_joins.mysql.sql) |
| vw_cart_items | postgres |  | [packages\cart-items\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/cart-items/schema/040_views.postgres.sql) |
| vw_cart_items_detailed | postgres |  | [packages\cart-items\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/cart-items/schema/040_views_joins.postgres.sql) |
