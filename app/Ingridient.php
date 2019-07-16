<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ingridient extends Model
{
    protected $table = 'ingridients';
    protected $fillable = [
        'name'
    ];

    public function recipes() {
        return $this->belongsToMany('App\Recipe', 'recipe_ingridient',  'ingridient_id', 'recipe_id');
//        return $this->belongsToMany('App\RecipeIngrigient');
    }
}
