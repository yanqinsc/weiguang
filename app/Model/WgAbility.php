<?php

namespace App\Model;

use Silber\Bouncer\Database\Ability;

class WgAbility extends Ability
{
    public function getAbilities()
    {
        return $this->select('id', 'name', 'title')->get();
    }
}
