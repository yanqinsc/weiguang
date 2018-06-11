<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $fillable = ['pid', 'title', 'icon', 'route_name', 'order'];
}
