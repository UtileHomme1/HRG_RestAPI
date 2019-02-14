<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class passwordForgot extends Model
{
    protected $fillable = [
        'email', 'token'
    ];
}
