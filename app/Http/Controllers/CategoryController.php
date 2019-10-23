<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{   
	public function fetchcategories(){
 
        $category = Category::all();
 
        return view('/addcontacts',compact('admins'));
    }

    public function StoreCategory(){
 
        $category = new Category();
 
        $category->title = request('name');
 
        $category->save();
 
        return redirect('dashboard');
 
    }

}
