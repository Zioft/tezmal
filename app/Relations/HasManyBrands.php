<?php


namespace App\Relations;


use App\Models\Brand;

trait HasManyBrands
{
    public function brands() {
        return $this->hasMany(Brand::class);
    }
}