<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecipeIngrigient extends Model
{
    protected $table = 'recipe_ingridient';
    protected $fillable = [
        'recipe_id',
        'ingridient_id',
        'count'
    ];

    public function recipe()
    {
        return $this->belongsTo('App\Recipe');
    }

    public function ingridient()
    {
        return $this->belongsTo('App\Ingridient');
    }
}
