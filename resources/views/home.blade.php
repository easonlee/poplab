
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    
    @include('head')
    
  <body class="bg-light">
    
    <div class="container"> 
        <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-primary">Categories</span>
        </h4>
        <div class="row g-5">
            <div class="col-md-5 col-lg-4">
                <ul class="list-group mb-3"> 
                    @foreach ($categories as $key => $category)
                    <li class="list-group-item d-flex justify-content-between lh-sm"> 
                        <a class="nav-link @if($current==$category->id) active @endif" href="{{url('category',['id' => $category->id])}}">
                            <h6 class="my-0">{{$category->title}}<small class="text-muted product-count">({{$category->getTotalProducts()}})</small> </h6>
                        </a>
                    </li>
                    @endforeach  
                </ul>
            </div>
            <div class="col-md-7 col-lg-8"> 
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
                
                @if ($products)
                <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
                    @foreach($products as $product)
                    <div class="col">
                        <div class="card mb-4 rounded-3 shadow-sm">
                        <div class="card-header py-3">
                            <h4 class="my-0 fw-normal">{{$product->title}}</h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title">${{$product->total}}</h1>
                            <p>{{$product->description}}</p>
                            <a href="{{url('product',['id' => $product->id])}}" class="w-100 btn btn-xs btn-outline-primary">view detail</a>
                        </div>
                        </div>
                    </div>
                    @endforeach
                </div>
                @else
                <p>There was no items in this category</p>
                @endif
                
            </div>
        </div> 
    </div> 

    </body>
</html>
