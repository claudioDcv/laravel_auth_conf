@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Mis Horarios Como Cliente
                </div>

                <div class="panel-body">
                  <div class="panel-body table-responsive">
                    <table class="table table-hover table-sm table-bordered">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Titulo</th>
                          <th>Descripción</th>
                          <th>Fecha</th>
                          <th>Medico</th>
                          <th>Especialidad</th>
                        </tr>
                      </thead>
                      <tbody>
                      @foreach($events as $event)
                        <tr>
                          <td>{{ $event->id }}</td>
                          <td>{{ $event->title }}</td>
                          <td>{{ $event->description }}</td>
                          <td style="white-space: nowrap;">{{ $event->start }}</td>
                          <td>{{ $event->users->name }}</td>
                          <td>{{ $event->medspec->name }}</td>
                        </tr>
                      @endforeach
                      </tbody>
                    </table>
                    {{ $events->appends(Request::except('page'))->links() }}
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
