@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Nueva Atención Medica</div>
                <div class="panel-body">
                    <form role="form" method="POST" action="{{ route('event.store') }}">
                        {{ csrf_field() }}
                        <div>
                          <div class="row">
                            <div class='col-sm-12'>
                                <div class="form-group">
                                  <label for="sel1">Estatus</label>
                                  <select required class="form-control" id="medic" name="medic">
                                    <option selected disabled>Seleccione Medico</option>
                                    @foreach($medics as $medic)
                                      <option value="{{ $medic->id }}">{{ $medic->name }}</option>
                                    @endforeach
                                  </select>
                                </div>
                              </div>
                              <div class='col-sm-12'>
                                  <div class="form-group">
                                    <label for="sel1">Estatus</label>
                                    <select required class="form-control" id="sel1" name="status">
                                      <option selected disabled>Seleccione Estado</option>
                                      @foreach($status as $stat)
                                        <option value="{{ $stat->id }}">{{ $stat->name }}</option>
                                      @endforeach
                                    </select>
                                  </div>
                                </div>
                                @input([
                                  'type' : 'text',
                                  'col' : 12,
                                  'name' : 'title',
                                  'title' : 'Titulo',
                                  'max' : 100,
                                  'min' :  2
                                ])
                                @textarea([
                                  'type' : 'text',
                                  'col' : 12,
                                  'name' : 'description',
                                  'title' : 'Descripción',
                                  'max' : 100,
                                  'min' :  2,
                                  'row' : 3
                                ])
                                @input([
                                  'type' : 'text',
                                  'col' : 6,
                                  'name' : 'date_start',
                                  'title' : 'Inicio',
                                  'icon' : 'fa fa-calendar'
                                ])
                                @input([
                                  'type' : 'text',
                                  'col' : 6,
                                  'name' : 'date_end',
                                  'title' : 'Fin',
                                  'icon' : 'fa fa-calendar'
                                 ])
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <div class="radio-inline">
                                        <label><input required type="radio" name="is_active">Activo</label>
                                      </div>
                                      <div class="radio-inline">
                                        <label><input required type="radio" name="is_active">Inactivo</label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <button type="submit" class="btn btn-primary">
                                          Registrar
                                      </button>
                                    </div>
                                  </div>
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
<script src="{{ asset('js/multiselect.min.js') }}" charset="utf-8"></script>
<script src="{{ asset('js/ControllerMultiSelect.js')}}" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
      $.fn.datetimepicker.defaults.icons = {
        time: 'fa fa-clock-o',
        date: 'fa fa-calendar',
        up: 'fa fa-chevron-up',
        down: 'fa fa-chevron-down',
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-dot-circle-o',
        clear: 'fa fa-trash',
        close: 'fa fa-times'
      };
      $('#date_start').datetimepicker({
                viewMode: 'years',
                // format: 'DD/MM/YYYY'
            });
        $('#date_end').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#date_start").on("dp.change", function (e) {
            $('#date_end').data("DateTimePicker").minDate(e.date);
        });
        $("#date_end").on("dp.change", function (e) {
            $('#date_start').data("DateTimePicker").maxDate(e.date);
        });
    });
</script>
@endsection
