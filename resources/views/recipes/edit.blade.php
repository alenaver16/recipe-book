@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Добавление рецепта</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('recipes.index') }}"> Back</a>
            </div>
        </div>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>Whoops!</strong> There were some problems with your input.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form method="post" action="{{ route('recipes.update',$recipe->id) }}">
        @method('PUT')
        @csrf
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Название:</strong>
                    <input type="text" name="name" value="{{ $recipe->name }}" class="form-control" placeholder="Оливье">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Описание:</strong>
                    <textarea class="form-control" style="height:150px" name="description" placeholder="Описание">{{ $recipe->description }}</textarea>
                </div>
            </div>
            @if ($recipe->ingridients())
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group">
                        <strong class="font-size-24">Ингредиенты:</strong>
                        <table class="full-width-table">
                            <?php $i=0; ?>
                            @foreach ($recipe->ingridients()->get() as $ingridient)
                                <tr class="bordered-tr">
                                    <td><select class="form-control select-box-container"
                                                name="ingridient[1][ingridient_id]">
                                            @foreach(\App\Ingridient::all() as $ingr)
                                                <option value="{{$ingr->id}}" <?= $ingr->name == $ingridient->name ?  'selected = "selected"' : '' ?>>{{$ingr->name}}</option>
                                            @endforeach
                                        </select></td>
                                    <td><input class="form-control ml-10 mr-10" name="ingridient[{{++$i}}][count]" value="{{ $ingridient->pivot->count }}" ></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            @endif
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Сохранить рецепт</button>
            </div>
        </div>

    </form>
@endsection