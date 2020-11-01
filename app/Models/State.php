<?php

namespace App\Models;

use App\Relations\BelongsToCountry;
use App\Relations\HasManyShippingDetails;
use App\Relations\HasManyUsers;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    use HasFactory, HasManyUsers, BelongsToCountry, HasManyShippingDetails;

    protected $fillable = [
        'name', 'country_id', 'iso2'
    ];
}
