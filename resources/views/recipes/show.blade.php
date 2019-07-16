@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>{{ $recipe->name }}</h2>
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
                    <strong>Ингридиенты:</strong>
                    <table>
                        @foreach ($recipe->ingridients() as $ingridient)
                            <tr>
                                {{--<form action="{{ route('recipes.destroy',$recipe->id) }}" method="POST">--}}
{{--                                <td>{{ $ingridient->name }}</td>--}}
                                {{--<td>{{ $ingridient->count }}</td>--}}
                                {{--</form>--}}
                            </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        @endif
    </div>
@endsection