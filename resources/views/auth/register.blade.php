@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Registro de Usuario</div>
                <div class="panel-body">
                    <form role="form" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class=" col-sm-6 form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="control-label">Nombre</label>
                            <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>
                            @if ($errors->has('name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="col-sm-6 form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="control-label">Dirección de E-Mail</label>
                            <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                            @if ($errors->has('email'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="col-sm-6 form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="control-label">Contraseña</label>
                            <input id="password" type="password" class="form-control" name="password" required>
                            @if ($errors->has('password'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="col-sm-6 form-group">
                            <label for="password-confirm" class="control-label">Confirmar Contraseña</label>
                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                        </div>
                        
                        <div class="col-sm-6 form-group{{ $errors->has('rut') ? ' has-error' : '' }}">
                            <label for="password" class="control-label">Rut</label>
                            <input id="rut" type="rut" class="form-control" name="rut" value="{{ old('rut') }}" required>
                            @if ($errors->has('rut'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('rut') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="col-sm-6 form-group{{ $errors->has('hh_value') ? ' has-error' : '' }}">
                            <label for="password" class="control-label">Valor Hora</label>
                            <input id="hh_value" type="hh_value" class="form-control" name="hh_value" value="{{ old('hh_value') }}" required>
                            @if ($errors->has('hh_value'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('hh_value') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-sm-12"><hr/></div>
                        <!------------------------------------->
                        <div class="">
                          <div class="col-xs-5">Listado de Roles</div>
                          <div class="col-xs-2"></div>
                          <div class="col-xs-5">Roles Seleccionados</div>
                        </div>
                        <div class="" id="select-medical-specialities">
                                <div class="col-xs-5">
                                    <select name="from[]" id="multiselect" class="form-control" size="8" multiple="multiple">
                                        @foreach ($roles as $rol)
                                        <option value="{{ $rol->id }}">{{ $rol->name }}</option>
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
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12"><hr/></div>
                            <!---------------------------------->
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary">
                                    Registrar
                                </button>
                            </div>
                        </div>
                    </form>
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
