@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Vista de Usuario
                </div>
                <div class="panel-body table-responsive">
                  <h3>#{{ $user->id }} {{ $user->name }}</h3>
                  <hr/>
                  <p>Email: {{ $user->email }}</p>
                  <p>Creado el: {{ $user->created_at->format('l j F Y \a \l\a\s H:i:s') }}</p>
                  <p>Creado hace: {{ Carbon\Carbon::parse($user->created_at)->diffForHumans() }}</p>
                  <hr/>
                  <h4>Roles</h4>
                    <ul class="tags">
                      @foreach($user->roles as $rol)
                        <li>
                          {{ $rol->name }}
                        </li>
                      @endforeach
                    </ul>
                  <hr/>
                  @role('admin')
                    <a href="{{ route('user-view-asigns-role', $user->id)}}" class="btn btn-primary">Modificar Roles</a>
                  @endrole
                  @if (count($user->medicalspecialties) > 0)
                  <hr/>
                  <h4>Especialidades</h4>
                    <ul class="tags tags-medic">
                      @foreach($user->medicalspecialties as $m)
                        <li>
                          {{ $m->name }}
                        </li>
                      @endforeach
                    </ul>
                    <hr/>
                  @endif
                  @role('admin')
                  @if ($user->hasRole('medic'))
                    <a href="{{ route('user-view-asigns-specialities', $user->id)}}" class="btn btn-primary">Modificar Especialidades</a>
                  @endif
                  @endrole('admin')
                  <hr/>
                  <a
                    href="{{ route('users') }}{{ Request::getQueryString() ? '?' . Request::getQueryString() : '' }}"
                    class="btn btn-default"
                  >Listado de Usuarios</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
