<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'title',
        'description',
        'total',
        'quantity'
    ];

    public static function createItems($postdata)
    { 
        $createData = [
            'title'         => $postdata['title'], 
            'description'   => $postdata['description'], 
            'total'         => $postdata['total'], 
            'quantity'      => $postdata['quantity']
        ];
        $res = Product::create($createData);
        self::saveCategory($res->id, $postdata['category']); 

        return $res->id;
    }

    public static function updateItems($postdata)
    { 
        $updateData = [
            'title'         => $postdata['title'], 
            'description'   => $postdata['description'], 
            'total'         => $postdata['total'], 
            'quantity'      => $postdata['quantity']
        ];
        $res = Product::where('id', $postdata['id'])->update($updateData);
        self::saveCategory($postdata['id'], $postdata['category']); 

        return $postdata['id'];
    }

    public static function saveCategory($product_id, $categories)
    { 
        ProductCategory::where('product_id', $product_id)->delete();
        foreach(explode(',',$categories) as $category) {
            $createData = [
                'category_id'   => trim($category), 
                'product_id'    => $product_id
            ];
            $res = ProductCategory::create($createData);
        }
    }

	public function category()
    {
        return $this->hasMany(ProductCategory::class, 'product_id','id');
	}

}
