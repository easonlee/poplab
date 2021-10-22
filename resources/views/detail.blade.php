
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    
    @include('head')
    
    <body class="bg-light"> 
        <div class="container-fluid">
            <div class="content-wrapper">	
                <div class="item-container">
                    @if(Session::has('error'))
                        <script>
                            $("#alertmodal").hide().slideDown();
                            setTimeout(function(){
                                $("#alertmodal").slideUp();        
                            }, 4000);
                        </script>
                        <div id="alertmsg" class="alert alert-dismissable alert-danger">
                            <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button> 
                            {!! Session::get('error') !!}
                        </div>
                    @endif 

                    <div class="container">	
                        <div class="row">	
                            <div class="col-md-2">
                                <a class="btn btn-xs btn-outline-primary" href="{{url('/')}}">back</a>
                            </div>
                                
                            <div class="col-md-10">
                                <div class="row">	
                                    <div class="col-md-12 mb-3">
                                        @foreach($product->category as $category)
                                        <a href="{{url('category', ['id' => $category->category->id])}}" class="badge rounded-pill bg-secondary link">{{$category->category->title}}</a> 
                                        @endforeach
                                    </div>
                                </div> 
                                <div class="product-title">{{$product->title}}</div>
                                <div class="product-desc">{{$product->description}}</div>
                                
                                <hr>
                                <div class="product-price">$ {{$product->total}}</div>
                                <div class="product-stock">
                                    @if ($product->quantity>0)
                                    <span class="text-green">In Stock (Total: {{$product->quantity}})</span>
                                    @else
                                    <span class="text-red">Out of Stock</span>
                                    @endif
                                </div>
                                <hr>
                                <div class="btn-group cart">
                                    @if ($product->quantity>0) 
                                    <button type="button" class="btn btn-success">
                                        Add to cart 
                                    </button>
                                    @else 
                                    <button type="button" class="btn btn-success disabled">
                                        Out of Stock
                                    </button>
                                    @endif
                                </div>
                                <div class="btn-group wishlist">
                                    <button type="button" class="btn btn-danger">
                                        Add to wishlist 
                                    </button>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            </div>
        </div> 
    </body>
</html>
