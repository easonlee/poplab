<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('category/{id}', [HomeController::class, 'index'])->name('category');
Route::get('product/{id}', [HomeController::class, 'product'])->name('product');
