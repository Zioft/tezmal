<?php


namespace App\Relations;


use App\Models\State;

trait BelongsToState
{
    public function state() {
        return $this->belongsTo(State::class);
    }
}