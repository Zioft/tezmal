<?php


namespace App\Relations;


use App\Models\Image;

trait HasImages
{
    public function images() {
        return $this->morphMany(Image::class, 'imageable');
    }
}