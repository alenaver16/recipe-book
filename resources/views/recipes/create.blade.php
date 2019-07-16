@extends('layouts.app')
<link href="{{ URL::asset('css/recipe.css') }}" rel="stylesheet">
@push('scripts')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        var ingridients = @json($ingridient->toArray());
    </script>
    <script type="text/javascript" src="{{ URL::asset('js/recipe.js') }}"></script>
@endpush
@stack('scripts')
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

    <form action="{{ route('recipes.store') }}" method="POST">
        @csrf
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Название:</strong>
                    <input type="text" name="name" class="form-control" placeholder="Оливье">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Описание:</strong>
                    <textarea class="form-control" style="height:150px" name="description"
                              placeholder="Описание"></textarea>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">

                    <table>
                        <tr>
                            <td>
                                <div class="ingridients-container">
                                    <div class="labels">
                                        <strong>Ингредиенты:</strong>
                                        <strong>Количество:</strong>
                                    </div>
                                    <div class="ingridients-row">
                                        <select class="form-control select-box-container"
                                                name="ingridient[1][ingridient_id]">
                                            @foreach($ingridient as $ingr)
                                                <option value="{{$ingr->id}}">{{$ingr->name}}</option>
                                            @endforeach
                                        </select>
                                        <input class="form-control ml-10 mr-10" name="ingridient[1][count]" type="text">
                                        <button type="button" onclick="removeRow(this)" class="btn btn-danger remove-button"><strong>X</strong></button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <button type="button" class="btn btn-default" id="add-ingridient">Добавить ингредиент</button>
                    <button type="button" class="btn btn-success" data-toggle="modal"
                            data-target="#create-ingridient-form">Создать новый ингредиент
                    </button>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Сохранить рецепт</button>
            </div>
        </div>
    </form>
@endsection

<div class="modal fade" id="create-ingridient-form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Добавление ингредиента</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="name" class="col-form-label">Название:</label>
                    <input type="text" class="form-control" id="create-ingridient-name">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                <button type="button" id="create-ingridient" class="btn btn-primary">Сохранить</button>
            </div>
        </div>
    </div>
</div>