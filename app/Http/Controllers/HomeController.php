<?php

namespace App\Http\Controllers;

use App\Category;
use App\Post;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    
    public function index()
    {
        $categories = Category::all();
        $posts = Post::latest()->where('is_approved', 1)->where('status', 1)->paginate(6);
        return view('welcome', compact('categories', 'posts'));
    }
}
