<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecipeIngrigient extends Model
{
    public function Recipe()
    {
        return $this->belongsTo('App\Recipe');
    }

    public function Ingridient()
    {
        return $this->belongsTo('App\Ingridient');
    }
}
