<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admin;

class Admincontroller extends Controller
{
    
   public function index(){
 
        $admins = Admin::all();
 
        return view('admins.index',compact('admins'));
    }
 
    public function create(){
        return view('admins.create');
    }
 
    public function storeAdmin(){
 
        $admins = new Admin();
 
        $admins->name = request('name');
        $admins->username = request('username');
         $admins->email = request('email');
          $admins->password = request('password');
           $admins->phone = request('phone');

 
        $admins->save();
 
        return redirect('/admin');
 
    }

   

   public function Login()
  {
   $email = request ('email');
   $password = request ('password');

    $user = Admin::where([
    ['email', '=', $email],
    ['password', '=', $password],
])->get();

    if(count($user) > 0){

       return redirect('/dashboard');
    }
    else
    {
      return redirect('/')->withMessage('Wrong sigin details. Try to search again !');;
      //return view ('/login')->withMessage('Wrong sigin details. Try to search again !');
    } 
  }

}
