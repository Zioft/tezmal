<?php

namespace App\Models;

use App\Relations\BelongsToCourierCharge;
use App\Relations\BelongsToManyProductsWithOrderPivot;
use App\Relations\BelongsToOrderStatus;
use App\Relations\BelongsToUser;
use App\Relations\BelongsToVendor;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory, BelongsToUser, BelongsToVendor, BelongsToCourierCharge, BelongsToOrderStatus, BelongsToManyProductsWithOrderPivot;

    protected $fillable = [
        'user_id', 'vendor_id', 'total_amount', 'courier_charge_id', 'order_status_id', 'order_status_reason', 'has_shipping_detail'
    ];

    protected $casts = [
        'total_amount' => 'double',
        'has_shipping_detail' => 'boolean'
    ];
}
