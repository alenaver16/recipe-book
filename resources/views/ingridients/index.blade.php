@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Ингридиенты</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="{{ route('ingridients.create') }}">Добавить ингридиент</a>
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
            <th>Меню</th>
            <th width="280px">Действия</th>
        </tr>
        @foreach ($ingridients as $ingridient)
            <tr>
                <td>{{ $ingridient->name }}</td>
                <td>
                    <form action="{{ route('ingridients.destroy',$ingridient->id) }}" method="POST">
                        <a class="btn btn-primary" href="{{ route('ingridients.edit',$ingridient->id) }}">Edit</a>
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
        @endforeach
    </table>

    {!! $ingridients->links() !!}

@endsection