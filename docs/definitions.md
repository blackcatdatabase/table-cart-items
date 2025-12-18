# cart_items

Items added to shopping carts. UNIQUE (cart_id, book_id, sku) to prevent duplicate items in the cart.

## Columns
| Column | Type | Null | Default | Description | Crypto |
| --- | --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |  |
| tenant_id | BIGINT | NO |  | Owning tenant (FK tenants.id). |  |
| cart_id | CHAR(36) | NO |  | Cart identifier (UUID textual). |  |
| book_id | BIGINT | NO |  | Book (FK books.id). |  |
| sku | VARCHAR(64) | YES |  | SKU snapshot. |  |
| sku_norm | VARCHAR(64) | YES |  | Generated normalized SKU (COALESCE(sku, '')). |  |
| variant | mysql: JSON / postgres: JSONB | YES |  | JSON with selected variant/options. |  |
| quantity | mysql: INT / postgres: INTEGER | NO |  | Quantity > 0. |  |
| unit_price | mysql: DECIMAL(12,2) / postgres: NUMERIC(12,2) | NO | 0.00 | Unit price at time of adding. |  |
| price_snapshot | mysql: DECIMAL(12,2) / postgres: NUMERIC(12,2) | NO |  | Cached line price for integrity. |  |
| currency | CHAR(3) | NO |  | ISO 4217 currency code. |  |
| meta | mysql: JSON / postgres: JSONB | YES |  | Additional JSON metadata. |  |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Update timestamp (UTC). |  |

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
| vw_cart_items | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_cart_items_detailed | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_cart_items | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_cart_items_detailed | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
