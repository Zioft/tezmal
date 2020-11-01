<?php


namespace App\Relations;


use App\Models\OrderStatus;

trait BelongsToOrderStatus
{
    public function orderStatus() {
        return $this->belongsTo(OrderStatus::class);
    }
}