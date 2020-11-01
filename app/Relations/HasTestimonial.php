<?php


namespace App\Relations;


use App\Models\Testimonial;

trait HasTestimonial
{
    public function testimonial() {
        return $this->hasOne(Testimonial::class);
    }
}