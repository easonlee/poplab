<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
    ];

    public function products()
    {
        return $this->hasMany(ProductCategory::class, 'category_id','id');
    }

    public function getTotalProducts()
    {
        return $this->hasMany(ProductCategory::class, 'category_id','id')->count();

    }
}
