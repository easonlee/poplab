<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category; 
use App\Models\Product; 
use App\Models\ProductCategory; 

class HomeController extends Controller
{
    public function index($current=null)
    {  
        $categories = Category::all(); 
        if($current==null)
        {
            $current=$categories[0]->id;
        }
        
        $products = Product::whereHas('category', function ($query) use ($current){
            $query->where(['category_id' => $current]);
        })->get(); 
        
        return view('home',compact('categories','current','products'));
    }
    public function product(Request $request)
    {  
        $id = $request->route("id"); 
        $product = Product::where('id', $id)->first(); 
        if(!$product)
        {
            $msg = "invalid product id";
            return redirect()->route($this->layout.'.index')->withError($msg);
        } 
        
        return view('detail',compact('product'));
    }
    
}
