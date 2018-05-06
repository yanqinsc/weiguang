<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Silber\Bouncer\Database\Ability;

class WgAbility extends Ability
{
    public function getAbilitiesByPid($pid)
    {
        $pid = isset($pid) ? $pid : 0;
        $fields = ['p.order', 'p.id', 'p.name', 'p.title', 'p.icon', 'p.is_menu', 'p.route_name'];
        return DB::table('abilities as p')
            ->leftJoin('abilities as s', ['p.id'=>'s.pid'])
            ->select($fields)
            ->selectRaw('COUNT(wg_p.id) as sub_count')
            ->where('p.pid', $pid)
            ->groupBy($fields)
            ->orderBy('p.order')
            ->get();
    }
}
