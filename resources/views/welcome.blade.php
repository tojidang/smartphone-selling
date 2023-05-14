<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Apple Store</title>

    <!-- Favicon  -->
    <link rel="icon" href="{{ asset('laravel/php/public/FE/img/core-img/favicon.ico') }}">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="{{ asset('laravel/php/public/FE/css/core-style.css') }}">
    <link rel="stylesheet" href="{{ asset('laravel/php/public/FE/style.css') }}">
    <script src="{{ asset('laravel/php/public/BE/ckeditor/ckeditor.js') }}"></script>
      <script>
        CKEDITOR.replace('editor');
        CKEDITOR.replace('editor1');
      </script>

</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                  <a class="nav-brand" href="{{ URL::to('laravel/php/trangchu') }}"><img style="height: 40x; width: 90px;" src="{{ asset('laravel/php/public/FE/img/core-img/logo4.png') }}" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li>
                                    <a href="{{ URL::to('laravel/php/product-home') }}">Shop</a>
                                <div class="megamenu">   
                                    @foreach($category as $key => $cate)
                                    <ul class="single-mega cn-col-4">                                        
                                        <a style="font-size:16px; font-weight:bold" href="{{ URL::to('laravel/php/show-category',$cate->category_id) }}" class="title">{{ $cate -> category_name }}</a>    
                                        @foreach($brand as $key => $br)
                                            @if($br->category_id == $cate->category_id )
                                                <a style="font-size:13px" href="{{ URL::to('laravel/php/show-brand',$br->brand_id) }}">{{ $br -> brand_name }}</a>
                                            @endif
                                        @endforeach                  
                                    </ul> 
                                     @endforeach                                                                      
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </div>
                    <!-- Nav End -->
            </nav>
            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->

                <div class="search-area">
                    <form action="{{ URL::to('laravel/php/search') }}" method="post">
                        {{ csrf_field() }}
                        <input type="search" name="keyword" id="headerSearch" placeholder="Type for search">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <!-- Favourite Area -->
                @if(session('id') != NULL )
                    <div class="favourite-area">
                        <a href="{{ URL::to('laravel/php/order-history') }}"><img src="{{ asset('laravel/php/public/FE/img/core-img/heart.svg') }}" alt=""></a>
                    </div>  
                @endif 

                @if(session('id') != NULL )
                <div class="user-login-info">
                    <a href="{{ URL::to('laravel/php/customer', Auth::id()) }}"><img src="{{ asset('laravel/php/public/FE/img/core-img/user.svg') }}" alt=""></a>
                </div>
                <div class="user-login-info">
                    <a href="{{ URL::to('laravel/php/logout') }}"><img src="{{ asset('laravel/php/public/FE/img/core-img/sign_out.svg') }}" alt=""></a>
                </div>
                @else
                <div class="user-login-info">
                    <a href="{{ URL::to('laravel/php/flogin') }}"><img src="{{ asset('laravel/php/public/FE/img/core-img/user.svg') }}" alt=""></a>
                </div>
                @endif
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href="#" id="essenceCartBtn"><img src="{{ asset('laravel/php/public/FE/img/core-img/bag.svg') }}" alt=""> <span></span></a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Right Side Cart Area ##### -->
    <div class="cart-bg-overlay"></div>

    <div class="right-side-cart-area">

        <!-- Cart Button -->
        <div class="cart-button">
            <a href="#" id="rightSideCart"><img src="{{ asset('laravel/php/public/FE/img/core-img/bag.svg') }}" alt=""> <span></span></a>
        </div>

        <div class="cart-content d-flex">
            <?php
            $content = Cart::content();
            ?>
            <!-- Cart List Area -->
            <div class="cart-list">
                @foreach($content as $v_content)
                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="{{ URL::to('laravel/php/delete-to-cart/'.$v_content-> rowId) }}" class="product-image" style="width: 200px; height: 200px;">
                        <img src="{{ asset('laravel/php/public/uploads/product/'.$v_content-> options-> image) }}" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close"  aria-hidden="true"></i></span>
                            <span class="badge"></span>
                            <h6>{{ $v_content -> name }}</h6>
                            <p class="size">{{ $v_content -> options -> storage }}</p>
                            <p class="color">{{ $v_content -> options -> color }}</p>
                            <p class="price">{{number_format($v_content-> price).' VNĐ'}}</p>
                        </div>
                    </a>
                </div>
                @endforeach
            </div>

            <!-- Cart Summary -->
            <div class="cart-amount-summary">

                <h2>Summary</h2>
                <ul class="summary-table">
                    <li><span>subtotal:</span> <span>{{Cart::subtotal().' VNĐ'}}</span></li>
                    <li><span>delivery:</span> <span>Free</span></li>

                    <li><span>discount:</span><span>{{ Cart::discount().' VNĐ' }}</span></li>

                    <li><span>total:</span> <span>{{Cart::priceTotal().' VNĐ'}}</span></li>
                </ul>
                @if(session('id') != NULL )

                    <div class="checkout-btn mt-100">
                    <a href="{{ URL::to('laravel/php/checkout') }}" class="btn essence-btn">check out</a>
                </div>
                @else
                    <div class="checkout-btn mt-100">
                    <a href="{{ URL::to('laravel/php/flogin') }}" class="btn essence-btn">check out</a>
                </div>
                @endif
                
            </div>
        </div>
    </div>
    <!-- ##### Right Side Cart End ##### -->

    <!-- ##### Welcome Area Start ##### -->
    <section class="slide-home">
        <div class="slider">
          <div class="slider-wrapper">
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner3.jpg') }}" alt="Slide 1">
            </div>
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner4.jpg') }}" alt="Slide 2">
            </div>
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner2.jpg') }}" alt="Slide 3">
            </div>
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner1.jpg') }}" alt="Slide 4">
            </div>
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner6.jpg') }}" alt="Slide 5">
            </div>
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner7.jpg') }}" alt="Slide 6">
            </div>
            <div class="slider-slide">
              <img src="{{ asset('laravel/php/public/FE/img/banner-img/banner5.jpg') }}" alt="Slide 7">
            </div>
          </div>
          
          <div class="slider-prev">&#10094;</div>
          <div class="slider-next">&#10095;</div>
        </div>
        <style>
            .slider {
              position: relative;
              overflow: hidden;  
              width: 2000px; 
              height: 550px;          
            }

            .slider-wrapper {
              display: flex;
              transition: transform 0.5s ease;
            }

            .slider-slide {
                box-sizing: border-box;
              width: 100%;
              padding: 0 auto;
              flex: 0 0 100%;
            }

            .slider-slide img {
              display: block; margin: 0 auto;
              width: 100%;
              height: auto;
            }

            .slider-prev,
            .slider-next {
              position: relative;
              top: 50%;
              
              z-index: 1;
              cursor: pointer;
            }

            .slider-prev {
              left: 0;
            }

            .slider-next {
              right: 0;
            }

        </style>   
        <script>
           var sliderWrapper = document.querySelector('.slider-wrapper');
            var sliderPrev = document.querySelector('.slider-prev');
            var sliderNext = document.querySelector('.slider-next');
            var slideWidth = document.querySelector('.slider-slide').clientWidth;
            var currentSlide = 0;

            function slideNext() {
              currentSlide++;
              if (currentSlide > sliderWrapper.children.length - 1) {
                currentSlide = 0;
              }
              sliderWrapper.style.transform = 'translateX(-' + slideWidth * currentSlide + 'px)';
            }

            var slideInterval = setInterval(slideNext, 5000);

            sliderPrev.addEventListener('click', function() {
              currentSlide--;
              if (currentSlide < 0) {
                currentSlide = sliderWrapper.children.length - 1;
              }
              sliderWrapper.style.transform = 'translateX(-' + slideWidth * currentSlide + 'px)';
            });

            sliderNext.addEventListener('click', slideNext);

        </script> 
    </section>
    <!-- ##### Welcome Area End ##### -->
    
 @yield('content')
  

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="#"><img src="{{ asset('laravel/php/public/FE/img/core-img/logo2.png') }}" alt=""></a>
                        </div>
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <ul>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area mb-30">
                        <ul class="footer_widget_menu">
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Payment Options</a></li>
                            <li><a href="#">Shipping and Delivery</a></li>
                            <li><a href="#">Guides</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Use</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row align-items-end">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area">
                        <div class="footer_heading mb-30">
                            <h6>Subscribe</h6>
                        </div>
                        <div class="subscribtion_form">
                            <form action="#" method="post">
                                <input type="email" name="mail" class="mail" placeholder="Your email here">
                                <button type="submit" class="submit"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area">
                        <div class="footer_social_area">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>

<div class="row mt-5">
                <div class="col-md-12 text-center">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>, distributed by <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>

        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="{{ asset('laravel/php/public/FE/js/jquery/jquery-2.2.4.min.js') }}"></script>
    <!-- Popper js -->
    <script src="{{ asset('laravel/php/public/FE/js/popper.min.js') }}"></script>
    <!-- Bootstrap js -->
    <script src="{{ asset('laravel/php/public/FE/js/bootstrap.min.js') }}"></script>
    <!-- Plugins js -->
    <script src="{{ asset('laravel/php/public/FE/js/plugins.js') }}"></script>
    <!-- Classy Nav js -->
    <script src="{{ asset('laravel/php/public/FE/js/classy-nav.min.js') }}"></script>
    <!-- Active js -->
    <script src="{{ asset('laravel/php/public/FE/js/active.js') }}"></script>

</body>

</html>