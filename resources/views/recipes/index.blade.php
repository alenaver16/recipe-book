@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Мои рецепты</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="{{ route('recipes.create') }}">Добавить рецепт</a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    <table class="table table-bordered">
        <tr>
            <th>Рецепт</th>
            <th>Описание</th>
            <th width="280px">Действия</th>
        </tr>
        @foreach ($recipes as $recipe)
            <tr>
                <td>{{ $recipe->name }}</td>
                <td>{{ $recipe->description }}</td>
                <td>
                    <form action="{{ route('recipes.destroy',$recipe->id) }}" method="POST">
                        <a class="btn btn-info" href="{{ route('recipes.show',$recipe->id) }}">Show</a>
                        <a class="btn btn-primary" href="{{ route('recipes.edit',$recipe->id) }}">Edit</a>
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
        @endforeach
    </table>

    {!! $recipes->links() !!}

@endsection