<?php


namespace App\Relations;


use App\Models\CourierCharge;

trait HasCourierCharge
{
    public function courierCharge() {
        return $this->belongsTo(CourierCharge::class);
    }
}