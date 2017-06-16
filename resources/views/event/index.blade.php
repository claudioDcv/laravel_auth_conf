@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Listado de Medicos</div>
                <div class="panel-body">
                    <hr>
                    <select name="" id="ajax-specialities"  class="form-control" required>
                      <option disabled selected>Seleccione Opción</option>
                    </select>
                    <hr>
                    <select name="" id="ajax-medic" class="form-control" required>
                      <option disabled selected>Seleccione Opción</option>
                    </select>
                    <hr>
                    <input type="text" class="date form-control" name="date" id="date-calendar-medic" />
                    <hr>
                    <button class="btn btn-success" id="button-show-calendar">Calendario</button>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
@section('scripts')
<script src="{{ asset('js/jquery3.js')}}" charset="utf-8"></script>
<script src="{{ asset('library/moment-with-locales.js') }}" charset="utf-8"></script>
<script src="{{ asset('datetimepicker/js/bootstrap-datetimepicker.min.js') }}" charset="utf-8"></script>
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
      $('.date').datetimepicker({
          viewMode: 'years',
          format: 'DD/MM/YYYY',
          defaultDate: new Date(),
      });

      /**************/

      var buttonAction = function(){
        var btn = document.getElementById('button-show-calendar');
        btn.addEventListener('click', function(e){
          var url = "{{ route('medic-event-list',['11','22','3333'])}}";
          var medic = document.getElementById('ajax-medic');
          var medicalspecialty = document.getElementById('ajax-specialities');
          var date = document.getElementById('date-calendar-medic');
          var urlCreate = url.replaceArray(
            ['11','22','3333'],
            [medic.value, medicalspecialty.value, date.value.replaceAll('/','-')],
          );
          window.location.href = urlCreate;
        })
      }

      var poblateSelectMedics = function(data){
        var select = document.getElementById('ajax-medic');
        select.innerHTML = '';
        select.innerHTML = '<option value="0" disabled selected>Seleccione Opción</option>';
        data.forEach(function(e){
          var option = document.createElement('option');
          var txt = document.createTextNode(e.name);
          option.value = e.id;
          option.appendChild(txt);
          select.appendChild(option);
        });
      }
      var loadMedic = function(id){
        var xmlHttp = new XMLHttpRequest();
            xmlHttp.onreadystatechange = function()
            {
                if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
                {
                    var data = JSON.parse(xmlHttp.responseText);
                    poblateSelectMedics(data);
                }
            }
            var url = "{{ route('medic-by-specialities','id_replace') }}/".replace('id_replace',id);
            xmlHttp.open("get",url);
            xmlHttp.send();
      }

      var listenSelectSpecialities = function(){
        var select = document.getElementById('ajax-specialities');
        select.addEventListener('change', function(e){
          loadMedic(e.target.value);
        })
      }
      var loadSpecialities = function(){
        var xmlHttp = new XMLHttpRequest();
        var isChange = false;
        var id = 0;
            xmlHttp.onreadystatechange = function()
            {
                if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
                {
                    var data = JSON.parse(xmlHttp.responseText);
                    var select = document.getElementById('ajax-specialities');
                    data.forEach(function(e){
                      var option = document.createElement('option');
                      var txt = document.createTextNode(e.name);
                      option.value = e.id;
                      if (option.selected) {
                        isChange = true;
                        id = e.id;
                      }
                      option.appendChild(txt);
                      select.appendChild(option);
                    });

                    if (isChange) {
                      loadMedic(id);
                    }
                    listenSelectSpecialities();
                }
            }
            xmlHttp.open("get", "{{ route('medic-specialities-json') }}");
            xmlHttp.send();
      }
      loadSpecialities();
      buttonAction();

    });
</script>
@endsection
