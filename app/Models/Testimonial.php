<?php

namespace App\Models;

use App\Relations\BelongsToUser;
use App\Relations\BelongsToVendor;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Testimonial extends Model
{
    use HasFactory, BelongsToUser, BelongsToVendor;

    protected $fillable = [
        'user_id', 'vendor_id', 'comment'
    ];
}
