<?php


namespace App\Relations;


use App\Models\Country;

trait BelongsToCountry
{
    public function country() {
        return $this->belongsTo(Country::class);
    }
}