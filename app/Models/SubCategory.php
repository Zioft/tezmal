<?php

namespace App\Models;

use App\Relations\BelongsToCategory;
use App\Relations\BelongsToUser;
use App\Relations\HasManyBrands;
use App\Relations\HasManyProducts;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory, BelongsToUser, BelongsToCategory, HasManyBrands, HasManyProducts;

    protected $fillable = [
        'name', 'user_id', 'category_id'
    ];
}
