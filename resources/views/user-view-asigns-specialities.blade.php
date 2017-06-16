@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Asignación de Especialidad Medica
                </div>
                <div class="panel-body">
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
                <!-------------->
                <h4>Especialidades</h4>
                <form action="{{ route('save-asigns-specialities') }}" method="POST"/>
                {{ csrf_field() }}
                <input type="hidden" value="{{ $user->id }}" name="user_id"/>
                <div class="row">
                  <div class="col-xs-5">Listado de Especialidades</div>
                  <div class="col-xs-2"></div>
                  <div class="col-xs-5">Especialidades Seleccionadas</div>
                </div>
                <div class="row" id="select-medical-specialities">
                        <div class="col-xs-5">
                            <select name="from[]" id="multiselect" class="form-control" size="8" multiple="multiple">
                                @foreach ( $to as $medspec)
                                <option value="{{ $medspec->id }}">{{ $medspec->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-xs-2">
                            <button type="button" id="multiselect_rightAll" class="btn btn-block btn-default"><i class="fa fa-forward" aria-hidden="true"></i></button>
                            <button type="button" id="multiselect_rightSelected" class="btn btn-block btn-success"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
                            <button type="button" id="multiselect_leftSelected" class="btn btn-block btn-danger"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
                            <button type="button" id="multiselect_leftAll" class="btn btn-block btn-default"><i class="fa fa-backward" aria-hidden="true"></i></button>
                        </div>

                        <div class="col-xs-5">
                            <select name="to[]" id="multiselect_to" class="form-control" size="8" multiple="multiple">
                              @foreach ( $from as $medspec)
                              <option value="{{ $medspec->id }}">{{ $medspec->name }}</option>
                              @endforeach
                            </select>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                      <div class="col-xs-12">
                        <a href="{{ route('user-view',$user->id) }}" class="btn btn-default">Volver a usuario</a>
                        <input type="submit" value="Guardar" class="btn btn-primary"/>
                      </div>
                    </div>
                  </form>
                <!------------->
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script src="{{ asset('js/jquery3.js')}}" charset="utf-8"></script>
<script src="{{ asset('js/multiselect.min.js') }}" charset="utf-8"></script>
<script src="{{ asset('js/ControllerMultiSelect.js')}}" charset="utf-8"></script>
@endsection
