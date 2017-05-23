@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Usuario
                  @role('admin')
                       | Hola Admin
                  @endrole
                </div>
                <div class="panel-body table-responsive">
                  <h3>#{{ $user->id }} {{ $user->name }}</h3>
                  <hr/>
                  <p>Roles:
                    <ul class="tags">
                      @foreach($user->roles as $rol)
                        <li>
                          {{ $rol->name }}
                        </li>
                      @endforeach
                    </ul>
                  </p>
                  <hr/>
                  <p>Email: {{ $user->email }}</p>
                  <p>Creado el: {{ $user->created_at->format('l j F Y \a \l\a\s H:i:s') }}</p>
                  <p>Creado hace: {{ Carbon\Carbon::parse($user->created_at)->diffForHumans() }}</p>
                  @if (count($user->medicalspecialties) > 0)
                  <hr/>
                  <h4>Especialidades</h4>
                  <ol>
                    @foreach ($user->medicalspecialties as $m)
                      <li>{{ $m->name }}</li>
                    @endforeach
                  </ol>
                  @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
