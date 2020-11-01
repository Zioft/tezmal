<?php

namespace App\Models;

use App\Relations\HasManyShippingDetails;
use App\Relations\HasManyUsers;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory, HasManyUsers, HasManyShippingDetails;

    protected $fillable = [
        'name', 'iso3', 'iso2', 'phonecode', 'capital', 'currency', 'native', 'emoji', 'emojiU', 'flag'
    ];

    protected $casts = [
        'flag' => 'boolean'
    ];
}
