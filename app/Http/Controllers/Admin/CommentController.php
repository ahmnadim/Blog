<?php

namespace App\Http\Controllers\Admin;

use App\Comment;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index()
    {
    	$comments = Comment::latest()->get();
    	return view('admin.comments', compact('comments'));
    }

    public function destroy($id)
    {
    	$comment = Comment::find($id)->delete();
    	Toastr::success('Comment deleted!!!', 'success');
    	return redirect()->back();
    }
}

