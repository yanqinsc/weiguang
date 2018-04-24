<?php

namespace App\Model;

use Silber\Bouncer\Database\Role;

class WgRole extends Role
{
    public function getRoles($number, $condition = null)
    {
        if (empty($condition)) {
            return $this->select('id', 'name', 'title')->paginate($number)
                ->appends(['number' => $number]);
        } else {
            return $this->select('id', 'name', 'title')
                ->where('name', 'LIKE', "%$condition%")
                ->paginate($number)
                ->appends([
                    'condition' => $condition,
                    'number' => $number
                ]);
        }
    }
}
