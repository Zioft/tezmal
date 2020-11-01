<?php


namespace App\Relations;


use App\Models\User;

trait HasManyUsers
{
    public function users() {
        return $this->hasMany(User::class);
    }
}