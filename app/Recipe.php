<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    protected $table = 'recipes';
    protected $fillable = [
        'name',
        'description'
    ];

    public function ingridients() {
        return $this->belongsToMany('App\Ingridient', 'recipe_ingridient', 'recipe_id', 'ingridient_id')->withPivot('count');
//        return $this->belongsToMany('App\RecipeIngrigient');
    }
}
