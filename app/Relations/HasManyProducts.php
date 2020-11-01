<?php


namespace App\Relations;


use App\Models\Product;

trait HasManyProducts
{
    public function products() {
        return $this->hasMany(Product::class);
    }
}