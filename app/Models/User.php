<?php

namespace App\Models;

use App\Relations\BelongsToCity;
use App\Relations\BelongsToCountry;
use App\Relations\BelongsToState;
use App\Relations\BelongsToUserStatus;
use App\Relations\HasImage;
use App\Relations\HasManyBrands;
use App\Relations\HasManyCategories;
use App\Relations\HasManyInWishlist;
use App\Relations\HasManyProducts;
use App\Relations\HasManyProductSizes;
use App\Relations\HasManySubCategories;
use App\Relations\HasShippingDetail;
use App\Relations\HasTestimonial;
use App\Relations\HasTestimonials;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasFactory, HasRoles, Notifiable, BelongsToUserStatus, BelongsToCountry, BelongsToState, BelongsToCity, HasImage, HasManyCategories, HasManySubCategories, HasManyBrands, HasManyProductSizes, HasManyProducts, HasShippingDetail, HasManyInWishlist, HasTestimonial, HasTestimonials;

    protected $fillable = [
        'name', 'email', 'password', 'country_id', 'state_id', 'city_id', 'address', 'postal_code', 'contact_no', 'user_status_id', 'date_of_birth'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'date_of_birth' => 'date'
    ];
}
