<?php

namespace App\Models;

use App\Relations\BelongsToCategory;
use App\Relations\BelongsToSubCategory;
use App\Relations\BelongsToUser;
use App\Relations\HasManyProducts;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory, BelongsToUser, BelongsToCategory, BelongsToSubCategory, HasManyProducts;

    protected $fillable = [
        'name', 'user_id', 'category_id', 'sub_category_id'
    ];
}
