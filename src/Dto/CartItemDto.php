<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\CartItems\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Žádná logika; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class CartItemDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $cartId,
        public readonly int $bookId,
        public readonly ?string $sku,
        public readonly array|null $variant,
        public readonly int $quantity,
        public readonly string $unitPrice,
        public readonly string $priceSnapshot,
        public readonly string $currency,
        public readonly array|null $meta
    ) {}

    /** Vhodné pro serializaci/logování (bez binárních/velkých blobů). */
    public function toArray(): array {
        // get_object_vars funguje dobře s public readonly vlastnostmi
        return get_object_vars($this);
    }
}
