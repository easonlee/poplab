<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\ApiResponser;
use App\Models\Category; 
use App\Models\Product; 
use App\Models\ProductCategory; 

class ProductController extends Controller
{
    use ApiResponser;

    public function create(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'total' => 'required|numeric|gte:0',
            'quantity' => 'required|numeric|gte:0', 
            'category' => 'required'
        ]);  
        $postdata   = $request->all(); 

        $category = explode(',',$postdata['category']);
        $categories = Category::whereIn('id', $category)->get(); 
        if(count($categories) != count($category))
        {
            $cat_list = array_column($categories->toArray(), 'id');
            $err_cat = array_diff($category,$cat_list); 
            return $this->error('Category error. Invalid CategoryId: '.implode(',',$err_cat));
        }

        try{
            $res = Product::createItems($request->all());   
            return $this->success(['ProductId'=>$res]);
        }
        catch(\Exception $e)
        { 
            return $this->error($e->getMessage());
        }
    } 

    public function update(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
            'title' => 'required',
            'description' => 'required',
            'total' => 'required|numeric|gte:0',
            'quantity' => 'required|numeric|gte:0', 
            'category' => 'required'
        ]);  
        $postdata   = $request->all();
        $res = Product::where('id', $postdata['id'])->first();

        if(!$res)
        {
            return $this->error('Product not found.Invalid ProductId.');
        }

        $category = explode(',',$postdata['category']);
        $categories = Category::whereIn('id', $category)->get(); 
        if(count($categories) != count($category))
        {
            $cat_list = array_column($categories->toArray(), 'id');
            $err_cat = array_diff($category,$cat_list); 
            return $this->error('Category error. Invalid CategoryId: '.implode(',',$err_cat));
        }

        try{
            $res = Product::updateItems($request->all());   
            return $this->success();
        }
        catch(\Exception $e)
        { 
            return $this->error($e->getMessage());
        }
    }

    public function detail(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
        ]);  
        $postdata   = $request->all();  
        $res = Product::where('id', $postdata['id'])->first();

        if(!$res)
        {
            return $this->error('Product not found.Invalid ProductId.');
        }
        $categoryArr = [];
        if($res->category)
        {
            foreach($res->category as $catDetail)
            { 
                $categoryArr[] = [
                    'categoryID' => $catDetail->category->id,
                    'categoryName' => $catDetail->category->title
                ];
            }
        }
        $readData = [
            'ProductId'=> $res['id'],  
            'title'     => $res['title'],
            'description'     => $res['description'],
            'quantity'     => $res['quantity'],
            'total'     => $res['total'],
            'category'     => $categoryArr,
        ];

        try{  
            return $this->success($readData);
        }
        catch(\Exception $e)
        { 
            return $this->error($e->getMessage());
        }
    }

    public function delete(Request $request)
    {
        $request->validate([
            'id' => 'required|integer'
        ]);   
        $postdata   = $request->all();
        $res = Product::where('id', $postdata['id'])->first();

        if(!$res)
        {
            return $this->error('Product not found.Invalid ProductId.');
        }

        try{
            $res->delete();
            ProductCategory::where('product_id', $postdata['id'])->delete();
            
            return $this->success();
        }
        catch(\Exception $e)
        { 
            return $this->error($e->getMessage());
        }
    }
}
