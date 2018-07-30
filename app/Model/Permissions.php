<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;


class Permissions extends Model
{

    public function destroyById($id)
    {
        $this->where('ability_id', $id)->delete();
    }
}
