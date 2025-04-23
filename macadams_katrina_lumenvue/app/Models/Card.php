<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Card extends Model
{
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['title','poster','upright','reversed','suit_id',
];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
