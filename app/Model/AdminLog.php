<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AdminLog extends Model
{
    protected $table = 'admin_logs';

    public function log($username, $action, $route, $method, $parameters)
    {
        $json = json_encode($parameters, JSON_UNESCAPED_UNICODE);
        // 如果参数超过长度就舍弃
        if (strlen($json) > 250) {
            $json = '';
        }
        return $this->insert([
            'username' => $username,
            'action' => $action,
            'route' => $route,
            'method' => $method,
            'parameters' => empty($json) ? '' : $json
        ]);
    }
}
