<?php

namespace App\Http\Controllers\Author;

use App\Comment;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
     public function index()
    {
    	$posts = Auth::user()->posts;
    	return view('author.comments', compact('posts'));
    }

    public function destroy($id)
    {
    	$comment = Comment::find($id);
    	if ($comment->user->id == Auth::id()) {

    		$comment->delete();
    		Toastr::success('Comment deleted!!!', 'success');

    	}
    	else
    	{
    		Toastr::success('You cant delete this comment!!!', 'warning');
    	}
    	
    	return redirect()->back();
    }
}
