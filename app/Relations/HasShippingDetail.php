<?php


namespace App\Relations;


use App\Models\ShippingDetail;

trait HasShippingDetail
{
    public function shippingDetail() {
        return $this->hasOne(ShippingDetail::class);
    }
}