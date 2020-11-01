<?php

namespace App\Models;

use App\Relations\BelongsToCity;
use App\Relations\HasManyOrders;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourierCharge extends Model
{
    use HasFactory, BelongsToCity, HasManyOrders;

    protected $fillable = [
        'charges', 'city_id'
    ];

    protected $casts = [
        'charges' => 'double'
    ];
}
