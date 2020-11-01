<?php

namespace App\Models;

use App\Relations\BelongsToProduct;
use App\Relations\BelongsToUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model
{
    use HasFactory, BelongsToUser, BelongsToProduct;

    protected $fillable = [
        'user_id', 'product_id'
    ];
}
