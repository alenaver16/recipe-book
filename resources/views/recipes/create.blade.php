@extends('layouts.app')
{{--@push('scripts')--}}
    {{--<script src="{{ asset('js/recipe.js' }}"></script>--}}
{{--@endpush--}}
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
                    <textarea class="form-control" style="height:150px" name="description" placeholder="Описание"></textarea>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Ингридиенты:</strong>
                    <table>
                        {{--@foreach ($recipe->ingridients() as $ingridient)--}}
                            <tr>
                                {{--<form action="{{ route('recipes.destroy',$recipe->id) }}" method="POST">--}}
                                <td>
                                    {{ Form::open(array('url' => 'foo/bar')) }}
                                    //
                                    {{ Form::close() }}
                                    {{--{{ \Symfony\Component\DomCrawler\Form::select('size', $ingridient) }}--}}
                                </td>
                                {{--                                <td>{{ $ingridient->name }}</td>--}}
                                {{--<td>{{ $ingridient->count }}</td>--}}
                                {{--</form>--}}
                            </tr>
                        {{--@endforeach--}}
                    </table>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Сохранить рецепт</button>
            </div>
        </div>

    </form>
@endsection