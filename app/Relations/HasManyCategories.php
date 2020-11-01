<?php


namespace App\Relations;


use App\Models\Category;

trait HasManyCategories
{
    public function categories() {
        return $this->hasMany(Category::class);
    }
}