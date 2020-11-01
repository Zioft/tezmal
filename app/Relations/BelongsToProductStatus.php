<?php


namespace App\Relations;


use App\Models\ProductStatus;

trait BelongsToProductStatus
{
    public function productStatus() {
        return $this->belongsTo(ProductStatus::class);
    }
}