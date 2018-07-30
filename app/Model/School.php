<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    public $table = 'schools';
    public $timestamps = false;

    public function hasManyClasses()
    {
        return $this->hasMany('App\Model\Classes', 'school_id', 'id');
    }
}
