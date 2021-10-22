<?php
namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [ 
            'title' => Str::random(10),
            'description' => $this->faker->name(),
            'total' => rand(10,100),
            'quantity' => rand(10,100)
        ];
    } 
    
    public function store($inputData)
    {
        $res = Product::createItems($inputData);
 
        return $res;
    } 
    
    public function update($inputData)
    {
        $res = Product::updateItems($inputData);
 
        return $res;
    } 
}


