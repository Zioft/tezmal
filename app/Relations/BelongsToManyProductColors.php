<?php


namespace App\Relations;


use App\Models\ProductColor;

trait BelongsToManyProductColors
{
    public function productColors() {
        return $this->belongsToMany(ProductColor::class)
            ->withTimestamps();
    }
}