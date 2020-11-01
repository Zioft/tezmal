<?php


namespace App\Relations;


use App\Models\ShippingDetail;

trait HasManyShippingDetails
{
    public function shippingDetails() {
        return $this->hasMany(ShippingDetail::class);
    }
}