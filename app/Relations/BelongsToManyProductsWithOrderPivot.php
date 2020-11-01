<?php


namespace App\Relations;


use App\Models\Product;

trait BelongsToManyProductsWithOrderPivot
{
    public function products() {
        return $this->belongsToMany(Product::class)
            ->withPivot('quantity')
            ->withTimestamps();
    }
}