<?php

namespace App\Models;

use App\Relations\BelongsToCity;
use App\Relations\BelongsToCountry;
use App\Relations\BelongsToState;
use App\Relations\BelongsToUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingDetail extends Model
{
    use HasFactory, BelongsToUser, BelongsToCountry, BelongsToState, BelongsToCity;

    protected $fillable = [
        'user_id', 'name', 'email', 'country_id', 'state_id', 'city_id', 'address', 'postal_code', 'contact_no'
    ];
}
