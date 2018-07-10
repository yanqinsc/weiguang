<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class RegisterCode extends Model
{
    protected $table = 'register_codes';
    protected $fillable = ['email', 'code', 'created_at'];
}
