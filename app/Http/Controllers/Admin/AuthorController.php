<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function index()
    {
    	$authors = User::authors()->withCount('posts')
    	->withCount('favorite_posts')->withCount('comments')->get();
    	return view('admin.authors', compact('authors'));
    }

    public function destroy($id)
    {
    	$author = User::find($id)->delete();
    	Toastr::success('Author Deleleted!!!', 'success');
    	return redirect()->back();
    }
}
