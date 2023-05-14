<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PayPalController;

//FE
Route::get('/', 'App\Http\Controllers\HomeController@index');
Route::get('laravel/php/trangchu/', 'App\Http\Controllers\HomeController@index');


//Category Home
Route::get('laravel/php/show-category/{category_id}', 'App\Http\Controllers\CategoryProduct@show_category');
Route::get('laravel/php/show-brand/{brand_id}', 'App\Http\Controllers\BrandProduct@show_brand');

Route::get('laravel/php/product-detail/{product_id}', 'App\Http\Controllers\ProductController@product_detail');
Route::get('laravel/php/product-home', 'App\Http\Controllers\ProductController@product_home');

Route::post('laravel/php/search','App\Http\Controllers\HomeController@search');


//BE
Route::get('laravel/php/admin','App\Http\Controllers\AdminController@index');
Route::get('laravel/php/dashboard','App\Http\Controllers\AdminController@show_dashboard');
Route::post('laravel/php/admin-dashboard','App\Http\Controllers\AdminController@dashboard');
Route::post('laravel/php/logout','App\Http\Controllers\AdminController@logout');


//Category Product
Route::get('laravel/php/add-category-product','App\Http\Controllers\CategoryProduct@add_category_product');
Route::get('laravel/php/all-category-product','App\Http\Controllers\CategoryProduct@all_category_product');

Route::post('laravel/php/save-category-product','App\Http\Controllers\CategoryProduct@save_category_product');
Route::post('laravel/php/update-category-product/{category_id}','App\Http\Controllers\CategoryProduct@update_category_product');

Route::get('laravel/php/edit-category-product/{category_id}','App\Http\Controllers\CategoryProduct@edit_category_product');
Route::get('laravel/php/delete-category-product/{category_id}','App\Http\Controllers\CategoryProduct@delete_category_product');

Route::get('laravel/php/active-category-product/{category_id}','App\Http\Controllers\CategoryProduct@active_category_product');
Route::get('laravel/php/inactive-category-product/{category_id}','App\Http\Controllers\CategoryProduct@inactive_category_product');



//Brand Product
Route::get('laravel/php/add-brand-product','App\Http\Controllers\BrandProduct@add_brand_product');
Route::get('laravel/php/all-brand-product','App\Http\Controllers\BrandProduct@all_brand_product');

Route::post('laravel/php/save-brand-product','App\Http\Controllers\BrandProduct@save_brand_product');
Route::post('laravel/php/update-brand-product/{brand_id}','App\Http\Controllers\BrandProduct@update_brand_product');

Route::get('laravel/php/edit-brand-product/{brand_id}','App\Http\Controllers\BrandProduct@edit_brand_product');
Route::get('laravel/php/delete-brand-product/{brand_id}','App\Http\Controllers\BrandProduct@delete_brand_product');

Route::get('laravel/php/active-brand-product/{brand_id}','App\Http\Controllers\BrandProduct@active_brand_product');
Route::get('laravel/php/inactive-brand-product/{brand_id}','App\Http\Controllers\BrandProduct@inactive_brand_product');


//Product
Route::get('laravel/php/add-product','App\Http\Controllers\ProductController@add_product');
Route::get('laravel/php/all-product','App\Http\Controllers\ProductController@all_product');

Route::post('laravel/php/save-product','App\Http\Controllers\ProductController@save_product');
Route::post('laravel/php/update-product/{product_id}','App\Http\Controllers\ProductController@update_product');

Route::get('laravel/php/edit-product/{product_id}','App\Http\Controllers\ProductController@edit_product');
Route::get('laravel/php/delete-product/{product_id}','App\Http\Controllers\ProductController@delete_product');

Route::get('laravel/php/active-product/{product_id}','App\Http\Controllers\ProductController@active_product');
Route::get('laravel/php/inactive-product/{product_id}','App\Http\Controllers\ProductController@inactive_product');

//Cart
Route::post('laravel/php/save-cart','App\Http\Controllers\CartController@save_cart');
// Route::get('laravel/php/show-cart','App\Http\Controllers\CartController@show_cart');
Route::get('laravel/php/delete-to-cart/{rowId}','App\Http\Controllers\CartController@delete_to_cart');



//Login
Route::get('laravel/php/flogin','App\Http\Controllers\LoginController@flogin');
Route::get('laravel/php/fregistor','App\Http\Controllers\LoginController@fregistor');
Route::get('laravel/php/logout','App\Http\Controllers\LoginController@logout');

Route::post('laravel/php/registor','App\Http\Controllers\LoginController@registor');
Route::post('laravel/php/login','App\Http\Controllers\LoginController@login');

//User
Route::get('laravel/php/customer/{id}','App\Http\Controllers\HomeController@information');
Route::post('laravel/php/update-user/{id}','App\Http\Controllers\HomeController@update_user');


//Checkout
Route::get('laravel/php/checkout','App\Http\Controllers\CheckoutController@checkout')->name('checkout');
Route::post('laravel/php/order-place','App\Http\Controllers\CheckoutController@order_place');
Route::get('laravel/php/order-history','App\Http\Controllers\OrderController@order_history');

//Manage Order
Route::get('laravel/php/manage-order','App\Http\Controllers\OrderController@manage_order');
Route::get('laravel/php/view-order/{orderId}','App\Http\Controllers\OrderController@view_order');
Route::get('laravel/php/view-my-order/{orderId}','App\Http\Controllers\OrderController@view_my_order');
Route::get('laravel/php/print-order/{order_id}','App\Http\Controllers\OrderController@print_order');
Route::post('laravel/php/update-status/{id}', 'App\Http\Controllers\OrderController@updateStatus');
Route::get('laravel/php/cancel-order/{order_id}','App\Http\Controllers\OrderController@cancel_order');

//send email
Route::get('laravel/php/sendmail','App\Http\Controllers\HomeController@sendmail');

//Coupon
Route::get('laravel/php/list-coupon','App\Http\Controllers\CouponController@list_coupon');
Route::get('laravel/php/insert-coupon','App\Http\Controllers\CouponController@insert_coupon');
Route::post('laravel/php/insert-coupon-code','App\Http\Controllers\CouponController@insert_coupon_code');
Route::get('laravel/php/delete-coupon/{coupon_id}','App\Http\Controllers\CouponController@delete_coupon');

Route::post('laravel/php/check-coupon','App\Http\Controllers\CheckoutController@check_coupon');
Route::get('laravel/php/unset-coupon','App\Http\Controllers\CheckoutController@unset_coupon');


//payment
Route::post('laravel/php/vnpay-payment','App\Http\Controllers\CheckoutController@vnpay_payment');
Route::post('laravel/php/momo-payment','App\Http\Controllers\CheckoutController@momo_payment');

Route::get('laravel/php/create-transaction', [PayPalController::class, 'createTransaction'])->name('createTransaction');
Route::get('laravel/php/process-transaction', [PayPalController::class, 'processTransaction'])->name('processTransaction');
Route::get('laravel/php/success-transaction', [PayPalController::class, 'successTransaction'])->name('successTransaction');
Route::get('laravel/php/cancel-transaction', [PayPalController::class, 'cancelTransaction'])->name('cancelTransaction');