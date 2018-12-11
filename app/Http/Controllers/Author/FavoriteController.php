<?php

namespace App\Http\Controllers\Author;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
   public function index()
    {
    	$posts = Auth::user()->favorite_posts;
    	return view('author.favorite', compact('posts'));
    }
}
