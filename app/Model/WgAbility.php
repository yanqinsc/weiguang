<?php

namespace App\Model;

use Silber\Bouncer\Database\Ability;

class WgAbility extends Ability
{
    public function getAbilities($number, $condition = null)
    {
        if (empty($condition)) {
            return $this->leftJoin('ability_meta', 'id', '=', 'ability_id')
                ->select('id', 'name', 'title', 'icon', 'route_name', 'order', 'pid')
                ->paginate($number)
                ->appends(['number' => $number]);
        } else {
            return $this->leftJoin('ability_meta as m', 'id', '=', 'ability_id')
                ->select('id', 'name', 'title', 'icon', 'route_name', 'order', 'pid')
                ->where('name', 'LIKE', "%$condition%")
                ->paginate($number)
                ->appends([
                    'condition' => $condition,
                    'number' => $number
                ]);
        }

    }
}
