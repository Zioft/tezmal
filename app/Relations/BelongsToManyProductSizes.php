<?php


namespace App\Relations;


use App\Models\ProductSize;

trait BelongsToManyProductSizes
{
    public function productSizes() {
        return $this->belongsToMany(ProductSize::class)
            ->withPivot('regular_price', 'sale_price')
            ->withTimestamps();
    }
}