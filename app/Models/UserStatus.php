<?php

namespace App\Models;

use App\Relations\HasManyUsers;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserStatus extends Model
{
    use HasFactory, HasManyUsers;

    protected $fillable = [
        'name'
    ];
}
