<?php


namespace App\Relations;


use App\Models\ProductSize;

trait HasManyProductSizes
{
    public function productSizes() {
        return $this->hasMany(ProductSize::class);
    }
}