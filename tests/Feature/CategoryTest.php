<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Category;

class CategoryTest extends TestCase
{ 
    public function testsCategoryCreatedError()
    {
        $payload = [
            'title' => ''
        ];

        $this->json('POST', 'api/category/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "0",
                "message" => "The title field is required"
            ]);
    }
    public function testsCategoryAreCreatedCorrectly()
    {
        
        $payload = [
            'title' => 'test category 01'
        ];

        $this->json('POST', 'api/category/create', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => "1",
                "message" => "success",
                "data" => [ 
                    'CategoryId' => "1"
                ]
            ]);
    }
    public function testsCategoryAreUpdateErrorWrongId()
    {
        
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Lists = Category::factory()->store($payload1);

        $payload = [
            'id' => 12,
            'title' => 'test category 01aa33'
        ];

        $this->json('POST', 'api/category/update', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 0,
                "message" => "Category not found.Invalid CategoryId."
            ]);
    }
    public function testsCategoryAreUpdateCorrectly()
    {
        
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Lists = Category::factory()->store($payload1);

        $payload = [
            'id' => 1,
            'title' => 'test category 01aa'
        ];

        $this->json('POST', 'api/category/update', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 1,
                "message" => "success"
            ]);
    }
    public function testsCategoryAreDeleteErrorWrongId()
    {
        
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Lists = Category::factory()->store($payload1);

        $payload = [
            'id' => 12
        ];

        $this->json('POST', 'api/category/delete', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 0,
                "message" => "Category not found.Invalid CategoryId."
            ]);
    }
    public function testsCategoryAreDeleteCorrectly()
    {
        
        $payload1 = [
            'title' => 'IpsumIpsum'
        ];
        $Lists = Category::factory()->store($payload1);

        $payload = [
            'id' => 1
        ];

        $this->json('POST', 'api/category/delete', $payload, [])
            ->assertStatus(200)
            ->assertJson([ 
                "code" => 1,
                "message" => "success"
            ]);
    }

}
