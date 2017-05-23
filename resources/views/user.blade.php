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
                <div class="panel-body table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Email</th>
                        <th>Nombre</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
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
                        <td style="white-space: nowrap;">
                          <div class="btn-group">
                            <a href="{{ route('user-view',$user->id) }}" class="text-primary"><i class="fa fa-eye" aria-hidden="true"></i></a>
                            <a href="#" class="text-success"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                            <a href="#" class="text-danger"><i class="fa fa-trash" aria-hidden="true"></i></a>
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
