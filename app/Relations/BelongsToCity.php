<?php


namespace App\Relations;


use App\Models\City;

trait BelongsToCity
{
    public function city() {
        return $this->belongsTo(City::class);
    }
}