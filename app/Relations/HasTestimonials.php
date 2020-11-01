<?php


namespace App\Relations;


use App\Models\Testimonial;

trait HasTestimonials
{
    public function testimonials() {
        return $this->hasMany(Testimonial::class, 'vendor_id');
    }
}