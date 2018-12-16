@extends('layouts.frontend.app')

@section('title')
@push('css')
        <link href="{{asset('assets/frontend/css/posts/styles.css')}}" rel="stylesheet">

        <link href="{{asset('assets/frontend/css/posts/responsive.css')}}" rel="stylesheet">

        <style type="text/css">
            .slider {
                height: 400px;
                width: 100%;
                background-image: url({{Storage::url('category/'.$category->image)}});
                background-size: cover;
                }
            .f_post{color:blue;}
            
        </style>
@endpush

@section('content')
    <div class="slider display-table center-text">
        <h1 class="title display-table-cell"><b>{{$category->name}}</b></h1>
    </div><!-- slider -->

    <section class="blog-area section">
        <div class="container">

            <div class="row">

             @if($category->posts->count() > 0 )
                @foreach($category->posts as $post)
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

            @else
                  <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="single-post post-style-1">

                            <div class="blog-info">

                                <h4 class="title"><strong>There is no post for {{$category->name}}</strong></h4>

                            </div><!-- blog-info -->
                        </div><!-- single-post -->
                    </div><!-- card -->
                </div><!-- col-lg-4 col-md-6 -->
            @endif
            </div><!-- row -->

           {{-- {{$posts->links()}} --}}

        </div><!-- container -->
    </section><!-- section -->

      
@endsection

@push('js')
    
   

@endpush