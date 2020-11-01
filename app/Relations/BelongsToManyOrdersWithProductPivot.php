<?php


namespace App\Relations;


use App\Models\Order;

trait BelongsToManyOrdersWithProductPivot
{
    public function orders() {
        return $this->belongsToMany(Order::class)
            ->withPivot('quantity')
            ->withTimestamps();
    }
}