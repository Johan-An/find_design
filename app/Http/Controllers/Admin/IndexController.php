<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;;

class IndexController extends Controller
{
    //
    public function index()
    {
    	$list = DB::table('enterprises')->get();
    	dd($list);
    }

    public function detail()
    {
        
    }

    public function save()
    {

    }
}
