<?php

namespace App\Models;

use App\Relations\BelongsToBrand;
use App\Relations\BelongsToCategory;
use App\Relations\BelongsToManyOrdersWithProductPivot;
use App\Relations\BelongsToManyProductColors;
use App\Relations\BelongsToManyProductSizes;
use App\Relations\BelongsToProductStatus;
use App\Relations\BelongsToSubCategory;
use App\Relations\BelongsToUser;
use App\Relations\HasImages;
use App\Relations\InWishlist;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory, BelongsToUser, BelongsToCategory, BelongsToSubCategory, BelongsToBrand, BelongsToProductStatus, BelongsToManyProductSizes, BelongsToManyProductColors, BelongsToManyOrdersWithProductPivot, HasImages, InWishlist;

    protected $fillable = [
        'title', 'quantity', 'sku', 'width', 'height', 'weight', 'depth', 'short_description', 'long_description', 'features', 'contains', 'user_id', 'category_id', 'sub_category_id', 'brand_id', 'product_status_id', 'is_approved', 'is_featured', 'is_package', 'package_size'
    ];

    protected $casts = [
        'is_approved' => 'boolean',
        'is_featured' => 'boolean',
        'is_package' => 'boolean',
    ];
}
