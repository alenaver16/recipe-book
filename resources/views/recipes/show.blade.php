@extends('layouts.app')
<link href="{{ URL::asset('css/recipe.css') }}" rel="stylesheet">
@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>{{ $recipe->name }}  <a href="{{ route('recipes.edit',$recipe->id) }}"> &#9998; </a></h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('recipes.index') }}"> Назад</a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="form-group">
                {{ $recipe->description }}
            </div>
        </div>
        @if ($recipe->ingridients())
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong class="font-size-24">Ингредиенты:</strong>
                    <table class="full-width-table">
                        @foreach ($recipe->ingridients()->get() as $ingridient)
                            <tr class="bordered-tr">
                                <td>{{ $ingridient->name }}</td>
                                <td>{{ $ingridient->pivot->count }}</td>
                            </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        @endif
    </div>
@endsection