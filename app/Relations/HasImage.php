<?php


namespace App\Relations;


use App\Models\Image;

trait HasImage
{
    public function image() {
        return $this->morphOne(Image::class, 'imageable');
    }
}