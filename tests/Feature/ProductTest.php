<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Product;
use App\Models\Category;

class ProductTest extends TestCase
{
    public function testsProductCreatedErrorTitleEmpty()
    {
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Category = Category::factory()->store($payload1);

        $payload = [
            'title' => '',
            'description' => 'product 04product 04product 04',
            'total' => 300,
            'quantity' => 10,
            'category' => 1
        ];

        $this->json('POST', 'api/product/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "0",
                "message" => "The title field is required"
            ]);
    }
    public function testsProductCreatedErrorCategoryEmpty()
    {
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Category = Category::factory()->store($payload1);

        $payload = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 300,
            'quantity' => 10,
            'category' => '',
        ];

        $this->json('POST', 'api/product/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "0",
                "message" => "The category field is required"
            ]);
    }
    public function testsProductCreatedErrorTotalSmallThan0()
    {
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Category = Category::factory()->store($payload1);

        $payload = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => -1,
            'quantity' => 10,
            'category' => 1
        ];

        $this->json('POST', 'api/product/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "0",
                "message" => "The total must be greater than or equal 0"
            ]);
    }
    public function testsProductCreatedErrorQuantitySmallThan0()
    {
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Category = Category::factory()->store($payload1);

        $payload = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => -1,
            'category' => 1
        ];

        $this->json('POST', 'api/product/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "0",
                "message" => "The quantity must be greater than or equal 0"
            ]);
    }
    public function testsProductCreatedErrorCategoryError()
    {
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Category = Category::factory()->store($payload1);

        $payload = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => 10,
            'category' => "44,55,66"
        ];

        $this->json('POST', 'api/product/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "0",
                "message" => "Category error. Invalid CategoryId: 44,55,66"
            ]);
    }
    public function testsProductAreCreatedCorrectly()
    {
        $payload1 = ['title' => 'IpsumIpsum'];
        $Category = Category::factory()->store($payload1);
        $payload2 = ['title' => 'IpsumIpsum2'];
        $Category = Category::factory()->store($payload2);

        $payload = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => 10,
            'category' => "1,2"
        ];

        $this->json('POST', 'api/product/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "1",
                "message" => "success",
                "data" => [ 
                    'ProductId' => "1"
                ]
            ]);
    }
    public function testsProductAreUpdateErrorWrongId()
    {
        $payload1 = ['title' => 'IpsumIpsum'];
        $Category = Category::factory()->store($payload1);

        $payload1 = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];
        $Lists = Product::factory()->store($payload1);

        $payload = [
            'id' => 13,
            'title' => 'test product 01aa33',
            'description' => 'product 04product 04product 04',
            'quantity' => 20,
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];

        $this->json('POST', 'api/product/update', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 0,
                "message" => "Product not found.Invalid ProductId."
            ]);
    }
    public function testsProductAreUpdateCorrectly()
    {
        $payload1 = ['title' => 'IpsumIpsum'];
        $Category = Category::factory()->store($payload1);

        $payload1 = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];
        $Lists = Product::factory()->store($payload1);

        $payload = [
            'id' => 1,
            'title' => 'test product 01aa33', 
            'description' => 'product 04product 04product 04',
            'quantity' => 20,
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];

        $this->json('POST', 'api/product/update', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 1,
                "message" => "success"
            ]);
    }
    public function testsProductAreDeleteErrorWrongID()
    {
        $payload1 = ['title' => 'IpsumIpsum'];
        $Category = Category::factory()->store($payload1);

        $payload1 = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];
        $Lists = Product::factory()->store($payload1);

        $payload = [
            'id' => 12,
        ];
        $this->json('POST', 'api/product/delete', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 0,
                "message" => "Product not found.Invalid ProductId."
            ]);
    }
    public function testsProductAreDeleteCorrectly()
    {
        $payload1 = ['title' => 'IpsumIpsum'];
        $Category = Category::factory()->store($payload1);

        $payload1 = [
            'title' => 'product01',
            'description' => 'product 04product 04product 04',
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];
        $Lists = Product::factory()->store($payload1);

        $payload = [
            'id' => 1,
        ];
        $this->json('POST', 'api/product/delete', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 1,
                "message" => "success"
            ]);
    }
    public function testsProductDetailAreShowCorrectly()
    {
        $payload1 = ['title' => 'IpsumIpsum'];
        $Category = Category::factory()->store($payload1);

        $payload1 = [
            'title' => 'product01',
            'description' => 'product01product01product01',
            'total' => 10,
            'quantity' => 10,
            'category' => "1"
        ];
        $Lists = Product::factory()->store($payload1);

        $payload = [
            'id' => 1
        ];

        $this->json('POST', 'api/product/detail', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 1,
                "message" => "success",
                "data" => [
                    "ProductId"=> 1,
                    "title"=> "product01",
                    "description"=> "product01product01product01",
                    "quantity"=> 10,
                    "total"=> "10.00",
                    "category"=> [
                        [
                            "categoryID"=> 1,
                            "categoryName"=> "IpsumIpsum" 
                        ]
                    ] 
                ]
                    
            ]);
    }
}
