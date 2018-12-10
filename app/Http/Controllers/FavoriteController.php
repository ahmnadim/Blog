<?php

namespace App\Http\Controllers;

use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
    public function add($post)
    {
    	$user = Auth::user();
    	$is_favorite = $user->favorite_posts()->where('post_id', $post)->count();

    	if ($is_favorite == 0) 
    	{
    		$user->favorite_posts()->attach($post);
    		Toastr::success('Added successfully to your favorite list.', 'success');
    		return redirect()->back();
    	}
    	else
    	{
    		$user->favorite_posts()->detach($post);
    		Toastr::success('Removed successfully from your favorite list.', 'success');
    		return redirect()->back();
    	}
    }
}
