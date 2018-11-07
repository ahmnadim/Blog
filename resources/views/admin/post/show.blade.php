@extends('layouts.backend.app')

@section('title', '-Show Post')

@push('css')
	
    
@endpush

@section('content')
		<div class="container-fluid">
            <a href="{{ route('admin.post.index') }}" class="btn btn-danger waves-effect">Back</a>

            @if($post->is_approved == false)
                <button class="btn btn-success pull-right waves-effect" onclick="approve_post({{$post->id}})">
                    <i class="material-icons">done</i>
                    <span>Approve</span>
                </button>

                <form id="approval-form" action="{{ route('admin.post.approved',$post->id) }}" method="post" style="display:none;">
                    @csrf
                    @method('PUT')

                </form>
            @else
                <button class="btn btn-success pull-right" disabled="1">
                    <i class="material-icons">done</i>
                    <span>Approved</span>
                </button>
            @endif
            <br>
            <br>
            <div class="row clearfix">
                <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                {{$post->title}}
                               <small>Posted by <strong>{{$post->user->name}} </strong>
                                    on {{$post->created_at->toFormattedDateString()}}
                               </small>
                            </h2>
                            
                        </div>
                        <div class="body">
                            {!!$post->body!!}

                        </div>
                    </div>
                </div>
                 <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-red">
                            <h2>
                                CATEGORIES
                            </h2>
                            
                        </div>
                        <div class="body">
                            @foreach($post->categories as $category)
                                <span style="margin-right: 2px;" class="label bg-red">{{$category->name}} </span>

                            @endforeach
                        </div>
                    </div>

                    <div class="card">
                        <div class="header bg-cyan">
                            <h2>
                                TAGS
                            </h2>
                            
                        </div>
                        <div class="body">
                            @foreach($post->tags as $tag)
                                <span style="margin-right: 2px;" class="label bg-cyan">{{$tag->name}} </span>
                            @endforeach
                               
                        </div>
                    </div>

                    <div class="card">
                        <div class="header bg-blue">
                            <h2>
                                Featured Image
                            </h2>
                            
                        </div>
                        <div class="body">
                          <img class="img-responsive thumbnail" src="{{url('storage/post/'.$post->image)}} ">
                               
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection

@push('js')
	<script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
    <script type="text/javascript">
        function approve_post(id){
                const swalWithBootstrapButtons = swal.mixin({
                  confirmButtonClass: 'btn btn-success',
                  cancelButtonClass: 'btn btn-danger',
                  buttonsStyling: false,
                })

                swalWithBootstrapButtons({
                  title: 'Are you sure?',
                  text: "You want to APPROVE this post!!!",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonText: 'Yes, APPROVE it!',
                  cancelButtonText: 'No, cancel!',
                  reverseButtons: true
                }).then((result) => {
                  if (result.value) {
                   event.preventDefault();
                   document.getElementById('approval-form').submit();

                  } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                  ) {
                    swalWithBootstrapButtons(
                      'Cancelled',
                      'This Post is remain Pending!!!',
                      'info'
                    )
                  }
                })
                        }
    </script>
@endpush