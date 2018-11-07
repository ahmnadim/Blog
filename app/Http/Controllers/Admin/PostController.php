<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Http\Controllers\Controller;
use App\Post;
use App\Tag;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::latest()->get();
        return view('admin.post.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('admin.post.create', compact('categories', 'tags'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       $this->validate($request,[
            'title'=>'required|unique:posts',
            'image'=>'required|mimes:jpg,jpeg,png,bmp',
            'categories'=>'required',
            'tags'=>'required',
            'body'=>'required'
       ]);

       $image = $request->file('image');
       $slug = str_slug($request->title);

       if (isset($image)) {

           $currentDate = Carbon::now()->toDateString();
           $imageName = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();


       if (!Storage::disk('public')->exists('post')) {

           Storage::disk('public')->makeDirectory('post');
       }

       $postImage = Image::make($image)->resize(1600,1066)->save($imageName);

       Storage::disk('public')->put('post/'.$imageName, $postImage);

       }else{
            $imageName = 'default.png';
        }

        $post = new Post();
        $post->user_id = Auth::id();
        $post->title = $request->title;
        $post->slug = $slug;
        $post->image = $imageName;
        $post->body = $request->body;

        if (isset($request->status)) {
            $post->status = true;
        }else{
            $post->status = false;
        }

        $post->is_approved = true;
        $post->save();

        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);

        Toastr::success('Post Added Successfully...', 'success');
        return redirect()->route('admin.post.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        return view('admin.post.show',compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('admin.post.edit', compact('post', 'categories', 'tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        $this->validate($request,[
            'title'=>'required',
            'image'=>'image|mimes:jpg,jpeg,png,bmp',
            'categories'=>'required',
            'tags'=>'required',
            'body'=>'required'
       ]);

       $image = $request->file('image');
       $slug = str_slug($request->title);

       if (isset($image)) {

           $currentDate = Carbon::now()->toDateString();
           $imageName = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();


       if (!Storage::disk('public')->exists('post')) {

           Storage::disk('public')->makeDirectory('post');
       }

       if (Storage::disk('public')->exists('post/'.$post->image)) {

          Storage::disk('public')->delete('post/'.$post->image);
       }

       $postImage = Image::make($image)->resize(1600,1066)->save($imageName);

       Storage::disk('public')->put('post/'.$imageName, $postImage);

       }else{
            $imageName = $post->image;
        }

        
        $post->user_id = Auth::id();
        $post->title = $request->title;
        $post->slug = $slug;
        $post->image = $imageName;
        $post->body = $request->body;

        if (isset($request->status)) {
            $post->status = true;
        }else{
            $post->status = false;
        }

        $post->is_approved = true;
        $post->save();

        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);

        Toastr::success('Post Updated Successfully...', 'success');
        return redirect()->route('admin.post.index');
    }

    public function pending()
    {
        $posts = Post::where('is_approved',false)->get();
        return view('admin.post.index', compact('posts'));
    }

    public function approved($id)
    {
        $post = Post::find($id);

        if ($post->is_approved == false) {
            $post->is_approved = true;
            $post->save();
            Toastr::success('Approved Successfully!!!', 'success');
        }

        return redirect()->route('admin.post.pending');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        if (Storage::disk('public')->exists('post/'.$post->image)) {

            Storage::disk('public')->delete('post/'.$post->image);
        }

        $post->categories()->detach();
        $post->tags()->detach();
        $post->delete();

        Toastr::success('Post Deleted Successfully...', 'success');
        return redirect()->route('admin.post.index');
    }
}
