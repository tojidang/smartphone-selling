<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;
session_start();

class AdminController extends Controller
{
    public function CheckAuth(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('/laravel/php/dashboard');
        }else{
            return Redirect::to('/laravel/php/admin')->send();
        }
    }
    public function index(){
        return view('admin_login');
    }

    public function show_dashboard(){
        $this->CheckAuth();
        return view('admin.dashboard');
    }

    public function dashboard(Request $request)
    {
        $admin_email = $request-> admin_email;
        $admin_password = md5($request-> admin_password);

        $result = DB::table('tbl_admin')-> where ('admin_email',$admin_email)->where('admin_password',$admin_password)->first();
        
        if($result){
            Session::put('admin_name',$result->admin_name);
            Session::put('admin_id',$result->admin_id);
            return Redirect::to('/laravel/php/dashboard');
        }else{
            Session::put('message','Sai tài khoản hoặc mật khẩu!');
            return Redirect::to('/laravel/php/admin');
        }
    }

    public function logout()
    {
        $this->CheckAuth();
        Session::put('admin_name',null);
        Session::put('admin_id',null);
        return Redirect::to('/laravel/php/dashboard');
    }

}
