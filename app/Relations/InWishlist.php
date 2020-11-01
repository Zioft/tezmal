<?php


namespace App\Relations;


use App\Models\Wishlist;

trait InWishlist
{
    public function wishlist() {
        return $this->hasOne(Wishlist::class);
    }
}