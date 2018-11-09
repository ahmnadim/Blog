<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Subscriber;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class SubscriberController extends Controller
{
    public function index()
    {
    	$subscribers = Subscriber::latest()->get();
    	return view('admin.subscriber', compact('subscribers'));
    }

    public function destroy($subscriber)
    {
    	Subscriber::findOrFail($subscriber)->delete();
    	Toastr::success('Subscriber Deleted Successfully!!!', 'success');
    	return redirect()->back();
    }
}
