<?php

namespace App\Models;

use App\Relations\BelongsToCountry;
use App\Relations\BelongsToState;
use App\Relations\HasCourierCharge;
use App\Relations\HasManyShippingDetails;
use App\Relations\HasManyUsers;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory, HasManyUsers, BelongsToCountry, BelongsToState, HasCourierCharge, HasManyShippingDetails;

    protected $fillable = [
        'name', 'state_id', 'country_id', 'latitude', 'longitude'
    ];

    protected $casts = [
        'latitude' => 'decimal:8',
        'longitude' => 'decimal:8'
    ];
}
