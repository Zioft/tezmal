<?php


namespace App\Relations;


use App\Models\Order;

trait HasManyOrders
{
    public function orders() {
        return $this->hasMany(Order::class);
    }
}