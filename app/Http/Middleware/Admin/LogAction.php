<?php

namespace App\Http\Middleware\Admin;

use Closure;
use App\Model\AdminLog;
use Illuminate\Support\Facades\Auth;

class LogAction
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $route = $request->route()->getAction()['as'];
        $route_names = get_route_titles();
        if (array_key_exists($route, $route_names)) {
            $username = Auth::user()->name;
            $action = $route_names[$route];
            $method = $request->method();
            $parameters = $request->all();
            unset($parameters['_token'], $parameters['_method'], $parameters['_method']);
            (new AdminLog())->log($username, $action, $route, $method, $parameters);
        }

        return $next($request);

    }


}
