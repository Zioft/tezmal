<?php


namespace App\Relations;


use App\Models\Wishlist;

trait HasManyInWishlist
{
    public function wishlist() {
        return $this->hasMany(Wishlist::class);
    }
}