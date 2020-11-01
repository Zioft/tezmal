<?php


namespace App\Relations;


use App\Models\SubCategory;

trait BelongsToSubCategory
{
    public function subCategory() {
        return $this->belongsTo(SubCategory::class);
    }
}