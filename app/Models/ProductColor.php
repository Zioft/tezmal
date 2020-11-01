<?php

namespace App\Models;

use App\Relations\BelongsToManyProducts;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductColor extends Model
{
    use HasFactory, BelongsToManyProducts;

    protected $fillable = [
        'name'
    ];
}
