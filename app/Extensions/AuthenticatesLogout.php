<?php
/**
 * Created by PhpStorm.
 * User: YamTsin
 * Date: 2018/5/24
 * Time: 21:46
 */

namespace App\Extensions;

use Illuminate\Http\Request;


trait AuthenticatesLogout
{
    public function logout(Request $request)
    {
        $this->guard()->logout();
        $request->session()->forget($this->guard()->getName());
        $request->session()->regenerate();

        return $request->getRequestUri() == '/logout' ? redirect('/') : redirect(route('admin.login'));
    }
}