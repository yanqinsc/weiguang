<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AdminLog extends Model
{
    protected $table = 'admin_logs';

    public function log($username, $action, $route, $method, $parameters)
    {
        return $this->insert([
            'username' => $username,
            'action' => $action,
            'route' => $route,
            'method' => $method,
            'parameters' => empty($parameters) ? '' : json_encode($parameters, JSON_UNESCAPED_UNICODE)
        ]);
    }
}
