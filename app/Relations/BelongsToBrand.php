<?php


namespace App\Relations;


use App\Models\Brand;

trait BelongsToBrand
{
    public function brand() {
        return $this->belongsTo(Brand::class);
    }
}