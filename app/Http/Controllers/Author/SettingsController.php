<?php

namespace App\Http\Controllers\Author;

use App\Http\Controllers\Controller;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class SettingsController extends Controller
{
    public function index()
    {
    	return view('author.settings');
    }

    public function updateProfile(Request $request)
    {
    	$this->validate($request,[
    		'name'=>'required',
    		'email'=>'required|email',
    		'image'=>'required|image',
    	]);

    	$image = $request->file('image');
    	$slug = str_slug($request->name);
    	$user = User::find(Auth::user()->id);

    	if (isset($image))
    	{
    		$dateTime = Carbon::now()->toDateString();
    		$imageName = $slug.'-'.$dateTime.'-'.uniqid().'.'.$image->getClientOriginalExtension();

    		if (!Storage::disk('public')->exists('profile'))
    		{
    			Storage::disk('public')->makeDirectory('profile');
    		}

    		if (Storage::disk('public')->exists('profile/'.$user->image)) 
    		{
    			Storage::disk('public')->delete('profile/'.$user->image);
    		}

    		$profileImage = Image::make($image)->resize(500, 500)->save($imageName);
    		Storage::disk('public')->put('profile/'.$imageName, $profileImage);
    	}
    	else
    	{
    		$imageName = $request->image;
    	}

    	$user->name = $request->name;
    	$user->email = $request->email;
    	$user->image = $imageName;
    	$user->about = $request->about;
    	$user->save();

    	Toastr::success('Profile Updated Successfully!!!', 'success');
    	return redirect()->back();
    }

    public function updatePassword(Request $request)
    {
    	$this->validate($request,[
    		'old_password'=>'required',
    		'password'=>'required|confirmed'
    	]);

    	$hashedPassword = Auth::user()->password;
    	if (Hash::check($request->old_password, $hashedPassword)) 
    	{
    		
    		if (!Hash::check($request->password, $hashedPassword)) 
    		{
    			$user = User::find(Auth::id());
    			$user->password = Hash::make($request->password);
    			$user->save();
    			Toastr::success('Password Successfully Changed.', 'success');
    			Auth::logout();
    			return redirect()->back();
    		}
    		else
    		{
    			Toastr::error('You entered and old password.', 'error');
    			return redirect()->back();
    		}
    	}
    	else
    	{
    		Toastr::error('Please Enter a valid password.', 'error');
    		return redirect()->back();
    	}
    }
}
