<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\CategoryController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('category/create',  [CategoryController::class, 'create']);
Route::post('category/update',  [CategoryController::class, 'update']); 
Route::post('category/detail',  [CategoryController::class, 'detail']);
Route::post('category/delete',  [CategoryController::class, 'delete']);

Route::post('product/create',  [ProductController::class, 'create']);
Route::post('product/detail',  [ProductController::class, 'detail']);
Route::post('product/update',  [ProductController::class, 'update']);
Route::post('product/delete',  [ProductController::class, 'delete']);

