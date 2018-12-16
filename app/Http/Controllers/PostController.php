<?php

namespace App\Http\Controllers;

use App\Category;
use App\Post;
use App\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PostController extends Controller
{

    public function index()
    {
        $posts = Post::latest()->where('is_approved', 1)->where('status', 1)->paginate(6);
        return view('posts', compact('posts'));
    }

    public function details($slug)
    {
    	$post = Post::where('slug', $slug)->where('is_approved', 1)->where('status', 1)->first();
    	$blogKey = 'blog_' . $post->id;
    	if (!Session::has($blogKey)) {
    		$post->increment('view_count');
    		session::put($blogKey, 1);
    	}
    	$randompost = Post::all()->where('is_approved', 1)->where('status', 1)->random(3);
    	return view('single-post', compact('post','randompost'));
    }

    public function postByCategory($slug)
    {
        $category = Category::where('slug', $slug)->first();
        $posts = $category->posts->where('is_approved', 1)->where('status', 1);
        return view('postByCategory', compact('category', 'posts'));
    }

    public function postByTag($slug)
    {
        $tag = Tag::where('slug', $slug)->first();
        $posts = $tag->posts->where('is_approved', 1)->where('status', 1);
        return view('postByTag', compact('tag', 'posts'));
    }
}
