@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Panel de Control
                  @role('admin')
                       | Hola Admin
                  @endrole
                </div>
                <div class="col-md-12">
                  <hr/>
                  <form class="" action="{{ Request::fullUrl() }}" method="get">
                    <div class="form-inline">
                      <input autofocus type="text" name="q" value="{{ Request::input('q') }}" class="form-control">
                      <input type="submit" name="" value="Buscar" class="btn btn-success">
                    </div>
                  </form>
                  <hr/>
                </div>
                <div class="panel-body table-responsive">
                  <table class="table table-hover table-sm table-bordered">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Email</th>
                        <th>Nombre</th>
                        <th>Rol</th>
                        <th>Especialidad</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                    @if(count($users) < 1)
                      <tr>
                        <td colspan="5">No se encontraron resultados</td>
                      </tr>
                    @endif
                    @foreach($users as $user)
                      <tr>
                        <td>{{ $user->id }}</td>
                        <td>{{ $user->email }}</td>
                        <td>{{ $user->name }}</td>
                        <td>
                          <ul class="tags">
                            @foreach($user->roles as $rol)
                              <li>
                                {{ $rol->name }}
                              </li>
                            @endforeach
                          </ul>
                        </td>
                        @if (count($user->medicalspecialties) > 0)
                        <td>
                          <ul class="tags tags-medic">
                            @foreach ($user->medicalspecialties as $m)
                              <li>{{ $m->name }}</li>
                            @endforeach
                          </ul>
                        </td>
                        @else
                          <td></td>
                        @endif
                        <td style="white-space: nowrap;">
                          <div class="btn-group">
                            <a href="{{ route('user-view', ['id' => $user->id, 'page' => $users->currentPage()]) }}" class="text-primary"><i class="fa fa-eye" aria-hidden="true"></i></a>
                            @role('admin')
                            <!-- <a href="#" class="text-success"><i class="fa fa-pencil" aria-hidden="true"></i></a> -->
                            <!-- <a href="#" class="text-danger"><i class="fa fa-trash" aria-hidden="true"></i></a> -->
                            @endrole
                          </div>
                        </td>
                      </tr>
                    @endforeach
                    </tbody>
                  </table>
                  {{ $users->appends(Request::except('page'))->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
