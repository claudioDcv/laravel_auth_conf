@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Panel de Control
                  @role('admin')
                       | Hola Admin
                  @endrole
                </div>
                {!! Form::open(['url' => 'foo/bar']) !!}

                {!! Form::close() !!}
                <div class="panel-body">
                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
