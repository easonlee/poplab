<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\ApiResponser;
use App\Models\Category; 
use App\Models\ProductCategory; 

class CategoryController extends Controller
{
    use ApiResponser;

    public function create(Request $request)
    {
        $request->validate([
            'title' => 'required',
        ]);  
        $postdata   = $request->all(); 

        $createData = [
            'title'         => $postdata['title'], 
            'created_at'    => date("Y-m-d H:i:s")
        ]; 

        try{
            $res = Category::create($createData);   
            return $this->success(['CategoryId'=>$res->id]);
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
        ]);  
        $postdata   = $request->all();
        $res = Category::where('id', $postdata['id'])->first();

        if(!$res)
        {
            return $this->error('Category not found.Invalid CategoryId.');
        }

        $updateData = [
            'title'         => $postdata['title'], 
            'updated_at'    => date("Y-m-d H:i:s")
        ]; 

        try{
            $res = Category::where('id', $postdata['id'])->update($updateData);   
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
        $res = Category::where('id', $postdata['id'])->first();

        if(!$res)
        {
            return $this->error('Category not found.Invalid CategoryId.');
        }

        try{
            $readData = [
                'categoryId'=> $res['id'],  
                'title'     => $res['title']
            ];  
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
        $res = Category::where('id', $postdata['id'])->first();

        if(!$res)
        {
            return $this->error('Category not found.Invalid CategoryId.');
        }

        try{
            $res->delete();
            ProductCategory::where('category_id', $postdata['id'])->delete();
            
            return $this->success();
        }
        catch(\Exception $e)
        { 
            return $this->error($e->getMessage());
        }
    }
}
