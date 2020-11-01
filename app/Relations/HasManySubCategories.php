<?php


namespace App\Relations;


use App\Models\SubCategory;

trait HasManySubCategories
{
    public function subCategories() {
        return $this->hasMany(SubCategory::class);
    }
}