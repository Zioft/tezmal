<?php

namespace App\Models;

use App\Relations\BelongsToUser;
use App\Relations\HasManyBrands;
use App\Relations\HasManyProducts;
use App\Relations\HasManySubCategories;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory, BelongsToUser, HasManySubCategories, HasManyBrands, HasManyProducts;

    protected $fillable = [
        'name', 'user_id'
    ];
}
