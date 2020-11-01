<?php

namespace App\Models;

use App\Relations\Imageable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory, Imageable;

    protected $fillable = [
        'imageable_id', 'imageable_type', 'path'
    ];
}
