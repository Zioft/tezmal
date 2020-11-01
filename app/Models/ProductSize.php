<?php

namespace App\Models;

use App\Relations\BelongsToManyProductsWithSizePivot;
use App\Relations\BelongsToUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSize extends Model
{
    use HasFactory, BelongsToUser, BelongsToManyProductsWithSizePivot;

    protected $fillable = [
        'name', 'user_id'
    ];
}
