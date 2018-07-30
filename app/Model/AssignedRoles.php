<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AssignedRoles extends Model
{
    protected $table = 'assigned_roles';

    public function destroyByRoleId($id)
    {
        $this->where('role_id', $id)->delete();
    }
}
