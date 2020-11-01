<?php


namespace App\Relations;


use App\Models\User;

trait BelongsToVendor
{
    public function vendor() {
        return $this->belongsTo(User::class, 'vendor_id');
    }
}