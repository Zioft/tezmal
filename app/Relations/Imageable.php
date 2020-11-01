<?php


namespace App\Relations;


trait Imageable
{
    public function imageable() {
        return $this->morphTo();
    }
}