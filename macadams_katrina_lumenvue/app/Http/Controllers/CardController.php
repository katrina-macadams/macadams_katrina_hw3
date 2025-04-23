<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Card;


class CardController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getAll() {
        $cards = Card::join('suits', 'suit_id', '=', 'suits.id')
        ->select('cards.id', 'title', 'cards.poster', 'upright', 'reversed', 'suits.name as suit_name', 'suits.element as suit_element', 'suits.description as suit_description')
        ->orderBy('cards.id', 'asc')
        ->get();
return response()->json($cards);
     }
     
     public function getOne($id) {
         $card = Card::join('suits', 'suit_id', '=', 'suits.id')
             ->select('cards.id', 'title', 'poster', 'cards.upright', 'cards.reversed', 'suits.name as suit_name', 'suits.element as suit_element', 'suits.description as suit_description')
             ->where('cards.id', '=', $id)
             ->first();
         return response()->json($card);
     }

     public function save(Request $request) {
        $this->validate($request, [
            'title' => 'required',
            'suit_id' => 'required',
            'published_date' => 'required|date',
            'card_image' => 'required'
        ]);
        $card = Card::create($request->all());
        return response()->json($card, 201);
    }



    /* public function save(Request $request) {
         $this->validate($request, [
             'title' => 'required',
             'suit_id' => 'required',
             'published_date' => 'required|date',
             'card_image' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048'
         ]);

         if ($request->hasFile('card_image')) {
            $file = $request->file('card_image');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
            $imagePath = $file->storeAs('images', $filename, 'public');
         } else {
             return response()->json(['error' => 'Image upload failed'], 400);
         }

         $card = Card::create([
             'title' => $request->title,
             'suit_id' => $request->suit_id,
             'published_date' => $request->published_date,
             'card_image' => $imagePath
         ]);

         return response()->json($card, 201);
     } */
    

    public function update(Request $request, $id) {
        $card = Card::findOrFail($id);
    
        $this->validate($request, [
            'title' => 'required',
            'suit_id' => 'required',
            'published_date' => 'required|date',
            'card_image' => 'required'
        ]);
        $card->update($request->all());
        return response()->json($card);
    }
    
    
    public function delete($id) {
        $card = Card::findOrFail($id);
        $card->delete();
        return response()->json(null, 204);
    }
    
}
