<?php


namespace App\Relations;


use App\Models\CourierCharge;

trait BelongsToCourierCharge
{
    public function courierCharge() {
        return $this->belongsTo(CourierCharge::class);
    }
}