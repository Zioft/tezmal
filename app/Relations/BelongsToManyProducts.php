<?php


namespace App\Relations;


use App\Models\Product;

trait BelongsToManyProducts
{
    public function products() {
        return $this->belongsToMany(Product::class)
            ->withTimestamps();
    }
}