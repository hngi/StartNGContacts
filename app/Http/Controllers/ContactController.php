<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contact;
use App\Category;




class ContactController extends Controller
{
	public function FetchCategories(){
 
        $category = Category::all();
 
        return view('/addcontacts',compact('category'));
    }
    
}
