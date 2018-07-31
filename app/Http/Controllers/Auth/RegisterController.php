<?php

namespace App\Http\Controllers\Auth;


use App\Model\User;
use App\Model\RegisterCode;
use Illuminate\Http\Request;
use App\Traits\RegistersUsers;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Cms\Controller;
use Illuminate\Support\Facades\Validator;
use App\Mail\RegisterCode as SendRegisterCode;


class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        $this->middleware('guest');
        $this->middleware('throttle:1,1')->only(['mailRegisterCode']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'code' => 'required|alpha_num'
        ], ['code.required' => '注册码不能为空']);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array $data
     * @return \App\Model\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password'])
        ]);
    }

    public function mailRegisterCode(Request $request)
    {
        if ($request->ajax()) {
            $request->validate([
                'email' => 'required|string|email|max:255|unique:users'
            ]);

            $code = rand(100000, 999999);

            RegisterCode::insert([
                'email' => $request->email,
                'code' => $code,
                'created_at' => date('Y-m-d H:i:s')
            ]);

            Mail::to($request->email)->queue(new SendRegisterCode($code));

            return ['code' => 200, 'msg' => 'success'];
        }
    }
}
