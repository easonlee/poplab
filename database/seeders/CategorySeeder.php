<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use App\Models\Product;
use App\Models\Category;
use App\Models\ProductCategory;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Category::truncate();
        Product::truncate();
        ProductCategory::truncate();

        $faker = \Faker\Factory::create();

        for ($i=0; $i < 10; $i++) {
            $res = Category::create([
                'title' => Str::random(10)
            ]);
        }
        
        $categories = Category::all(); 
        foreach($categories as $category)
        {
            for ($i=0; $i < 10; $i++) {
                $res = Product::createItems([
                    'title' => Str::random(10),
                    'description' => $faker->sentence,
                    'category' => $category->id,
                    'total' => rand(10,100),
                    'quantity' => rand(10,100)
                ]);
            }
        } 
    }
}
