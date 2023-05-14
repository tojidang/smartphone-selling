<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class LoginController extends Controller
{
    public function flogin(){

        return view('pages.flogin');
    }
     public function fregistor(){

        return view('pages.fregistor');
    }

    public function registor(Request $request){
        // Validate the user input
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
        ]);

        // Create a new user in the database
        $user = new User;
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = bcrypt($request->input('password'));
        $user->save();
        auth()->login($user);
        // Log the user in and redirect them to the dashboard
        $request->session()->put('id', $user->id);
        return Redirect('laravel/php/trangchu');
    }

    public function login(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        $credentials = [
            'email' => $email,
            'password' => $password,
        ];

        if (Auth::attempt($credentials)) {
            // Authentication passed...
            $user = User::where('email', $email)->first();
            $request->session()->put('id', $user->id);
            return redirect()->intended('laravel/php/trangchu');
        } else {
            Session::put('message','Sai tài khoản hoặc mật khẩu!');
            return Redirect('laravel/php/flogin');
        }
    }
    

    public function logout() {
        session()->put('id', NULL);
        
        return redirect()->back();
    }

    

}
