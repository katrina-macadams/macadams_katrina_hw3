<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Suit;


class SuitController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getSuits() {
         $suits = Suit::all();
         return response()->json($suits);
     }
    
}
