<?php

namespace App\Models;

use App\Relations\HasManyOrders;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderStatus extends Model
{
    use HasFactory, HasManyOrders;

    protected $fillable = [
        'name'
    ];
}
