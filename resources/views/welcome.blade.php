@extends('layouts.frontend.app')

@section('title', '-Home')
@push('css')
        <link href="{{('assets/frontend/css/home/styles.css')}}" rel="stylesheet">

        <link href="{{('assets/frontend/css/home/responsive.css')}}" rel="stylesheet">

        <style type="text/css">
            .f_post{color:blue;}
        </style>
@endpush

@section('content')
      <div class="main-slider">
        <div class="swiper-container position-static" data-slide-effect="slide" data-autoheight="false"
            data-swiper-speed="500" data-swiper-autoplay="10000" data-swiper-margin="0" data-swiper-slides-per-view="4"
            data-swiper-breakpoints="true" data-swiper-loop="true" >
            <div class="swiper-wrapper">

                @foreach($categories as $category)
                    <div class="swiper-slide">
                    <a class="slider-category" href="{{ route('category.posts',$category->slug) }}">
                        <div class="blog-image"><img src="{{ Storage::url('category/slider/'.$category->image) }}" alt="{{$category->name}}"></div>

                        <div class="category">
                            <div class="display-table center-text">
                                <div class="display-table-cell">
                                    <h3><b>{{$category->name}}</b></h3>
                                </div>
                            </div>
                        </div>

                    </a>
                </div><!-- swiper-slide -->
                @endforeach

            </div><!-- swiper-wrapper -->

        </div><!-- swiper-container -->

    </div><!-- slider -->

    <section class="blog-area section">
        <div class="container">

            <div class="row">

                @foreach($posts as $post)
                    <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="single-post post-style-1">

                            <div class="blog-image"><img src="{{ Storage::url('post/'.$post->image) }}" alt="{{$post->slug}}"></div>

                            <a class="avatar" href="#"><img src="{{ Storage::url('profile/'.$post->user->image) }}" alt="{{$post->slug}}"></a>

                            <div class="blog-info">

                                <h4 class="title"><a href="{{route('post.details', $post->slug)}}"><b>{{ $post->title  }}</b></a></h4>

                                <ul class="post-footer">
                                    <li>
                                    @guest
                                        <a href="javascript:void(0);" onclick="toastr.info('Login first to add as favorite!', 'info',{
                                            closeButton:true,
                                            progressBar:true,
                                        })"><i class="ion-heart"></i>{{$post->favorite_to_users->count()}}</a>
                                    @else
                                        <a href="javascript:void(0);" onclick="document.getElementById('favorite-post-{{$post->id}}').submit();" class="{{Auth::user()->favorite_posts->where('pivot.post_id',$post->id)->count() == 1 ? 'f_post' : ''}}"><i class="ion-heart"></i>{{$post->favorite_to_users->count()}}</a>

                                        <form id="favorite-post-{{$post->id}}" method="POST" action="{{route('post.favorite',$post->id)}}" style="display: none;">
                                            @csrf
                                        </form>
                                    @endguest

                                    </li>
                                    <li><a href="#"><i class="ion-chatbubble"></i>{{$post->comments->count()}}</a></li>
                                    <li><a href="#"><i class="ion-eye"></i>{{$post->view_count}}</a></li>
                                </ul>

                            </div><!-- blog-info -->
                        </div><!-- single-post -->
                    </div><!-- card -->
                </div><!-- col-lg-4 col-md-6 -->
                @endforeach

            </div><!-- row -->

           
           
            {{ $posts->links() }}

        </div><!-- container -->
    </section><!-- section -->
@endsection

@push('js')
    
    
    <script src="{{asset('assets/frontend/js/swiper.js')}}"></script>
    <script src="{{asset('assets/frontend/js/scripts.js')}}"></script>
   

@endpush