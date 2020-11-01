<?php


namespace App\Relations;


use App\Models\UserStatus;

trait BelongsToUserStatus
{
    public function userStatus() {
        return $this->belongsTo(UserStatus::class);
    }
}