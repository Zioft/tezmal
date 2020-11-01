<?php


namespace App\Relations;


use App\Models\Product;

trait BelongsToManyProductsWithSizePivot
{
    public function products() {
        return $this->belongsToMany(Product::class)
            ->withPivot('regular_price', 'sale_price')
            ->withTimestamps();
    }
}