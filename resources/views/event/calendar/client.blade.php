@extends('layouts.app')

@section('content')
<link rel='stylesheet' type='text/css' href="{{ asset('jquery-week-calendar-master/libs/css/smoothness/jquery-ui-1.8.11.custom.css')}}" />
<link rel='stylesheet' type='text/css' href="{{ asset('jquery-week-calendar-master/jquery.weekcalendar.css')}}" />
<style media="screen">

</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Calendario Medico Cliente</div>
                @include('event.calendar.modalclient')
                <div class="panel-body">
                    <div class="row row-margin">
                      <div class="col-md-12">
                      </div>
                    </div>
                    <div class="row row-margin">
                      <div class="col-md-3">
                        <label>Especialidad</label>
                        <select name="" id="ajax-specialities"  class="form-control" required>
                          <option disabled selected>Seleccione Opción</option>
                        </select>
                      </div>
                      <div class="col-md-3">
                        <label>Medico</label>
                        <select name="" id="ajax-medic" class="form-control" required>
                          <option disabled selected>Seleccione Opción</option>
                        </select>
                      </div>
                      <div class="col-md-3">
                        <label>Fecha</label>
                        <input type="text" readonly class="date form-control" name="date" id="date-calendar-medic" />
                      </div>
                      <div class="col-md-3 no-label">
                        <button class="btn btn-block btn-success" id="button-show-calendar">Calendario</button>
                      </div>
                    </div>
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script type='text/javascript' src="{{ asset('jquery-week-calendar-master/jquery.weekcalendar.js') }}"></script>
<script type="text/javascript">
var year = new Date().getFullYear();
var month = new Date().getMonth();
var day = new Date().getDate();
var userId = parseInt('{{ $user->id }}', 10);
var userMedicalSpeciality = parseInt('{{ $spec->id }}', 10);
var medicId = parseInt('{{ $medicId }}', 10);
var currentEvent = {
  data: {}
};

$(window).load(function() {
  var dateBackEnd = function(date){
    var d = date,
    dformat = [
                d.getDate() < 10 ? '0' + d.getDate() : d.getDate(),
                d.getMonth()+1 < 10 ? '0' + (d.getMonth()+1) : d.getMonth()+1,
                d.getFullYear(),
              ].join('/')+' '+
              [d.getHours() < 10 ? '0' + d.getHours() : d.getHours(),
               d.getMinutes() < 10 ? '0' + d.getMinutes() : d.getMinutes(),
               d.getSeconds() < 10 ? '0' + d.getSeconds() : d.getSeconds()].join(':');
               return dformat;
  }
  var saveEvent = function(calEvent, $event, opt){
    var e = $event;
    var n = calEvent;
    if (opt) {
      if (opt.new) {
        n.user_id = '{{ $user->id }}';
        n.status_id = 1;
        n.is_active = 1;
        n.client_id = '{{ Auth::user()->id }}';
      }else{

      }
    }

    if (n.end.getHours() > opt.businessHours.businessHours.end) {
      n.end.setHours(opt.businessHours.businessHours.end);
    }

    if (n.start.getDate() !== n.end.getDate()) {
      if (n.start.getHours() > n.end.getHours()) {
        n.end.setHours(00,00,00);
      }else{
        return false;
      }
    }
    e['_token'] = _token;
    e.start = dateBackEnd(n.start);
    e.end = dateBackEnd(n.end);
    $.ajax({
          url: '/week-event/save',
          type: 'post',
          dataType: 'json',
          success: function (data) {
              opt.calendar.weekCalendar('refresh');
          },
          data: e
      });
  }

  var _token = '{{ csrf_token() }}';
  var calendar = $('#calendar').weekCalendar({
    readonly: true,
    apiSave: 'jquery-week-calendar/save',
    data: '/week-event/{{ $medicId }}',
    date: Date.parse('{{ $date }}'),
    switchDisplay: {'1 dia': 1,'3 dias': 3,'Semana Trabajo': 5, 'Toda la Semana': 7},
    timeslotsPerHour: 4,
    businessHours: {start: 8, end: 18, limitDisplay: true},
    shortMonths: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    longMonths: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    shortDays: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
    longDays: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
    height: function($calendar) {
      return $(window).height() - $('h1').outerHeight() - $('.description').outerHeight();
    },
    eventRender: function(calEvent, $event) {
      currentEvent.data[calEvent.id] = calEvent;
      var template = '<button type="button" data-id="' + calEvent.id +'" class="btn btn-primary modal-edit" data-toggle="modal" data-target="#modalEdit" data-whatever="@mdo">Editar</button>';
      template += '<div>' + (calEvent.description || '') + '</div>';
      template += '<div>' + (calEvent.status ? calEvent.status.name : '') + '</div>';
      template += '<div>Medico: ' + (calEvent.users ? calEvent.users.name : '' ) + '</div>';
      $event.html($event.html() + template);
      if (calEvent.end.getTime() < new Date().getTime()) {
        $event.css('color', 'red');
        $event.css('opacity', '0');
        $event.css('pointer-events','none');
        $event.find('.time').css({
          backgroundColor: '#999',
          border:'1px solid #888'
        });
      }
    },
    eventNew: function(calEvent, $event) {
      var businessHours = arguments[5];
      calEvent.title = prompt('title');
      calEvent.description = prompt('description');
      if (calEvent.title && calEvent.description) {
          saveEvent(calEvent, calEvent,{
            'new': true,
            'calendar': calendar,
            'businessHours': businessHours,
          });
      }

      // displayMessage('<strong>Added event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      // alert('You\'ve added a new event. You would capture this event, add the logic for creating a new event with your own fields, data and whatever backend persistence you require.');
    },
    eventDrop: function(calEvent, $event) {
      var businessHours = arguments[3];
      saveEvent(calEvent, $event,{
        'new': false,
        'calendar': calendar,
        'businessHours': businessHours,
      });
      // displayMessage('<strong>Moved Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
    },
    eventResize: function(calEvent, $event) {
      var businessHours = arguments[3];
      saveEvent(calEvent, $event,{
        'new': false,
        'calendar': calendar,
        'businessHours': businessHours,
      });
      // displayMessage('<strong>Resized Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
    },
    eventClick: function(calEvent, $event) {
      console.log(1);
      //displayMessage('<strong>Clicked Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
    },
    eventMouseover: function(calEvent, $event) {
      //displayMessage('<strong>Mouseover Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
    },
    eventMouseout: function(calEvent, $event) {
      //displayMessage('<strong>Mouseout Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
    },
    noEvents: function() {
      //alert('Este medico no posee horas disponibles esta semana.');
    },
    reachedmindate: function($calendar, date) {
      //displayMessage('You reached mindate');
    },
    reachedmaxdate: function($calendar, date) {
      //displayMessage('You cannot go further');
    }
  });

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
      defaultDate: Date.parse('{{ $date }}'),
      calendarWeeks: true,
      keepInvalid: true,
      ignoreReadonly: true,
    });

    // var start = $('#date_start').datetimepicker({
    //           viewMode: 'years',
    //           // format: 'DD/MM/YYYY'
    //       });
    //   $('#date_end').datetimepicker({
    //       useCurrent: false, //Important! See issue #1075
    //   });
    //   $("#date_start").on("dp.change", function (e) {
    //       $('#date_end').data("DateTimePicker").minDate(e.date);
    //   });
    //   $("#date_end").on("dp.change", function (e) {
    //       $('#date_start').data("DateTimePicker").maxDate(e.date);
    //   });

  document.getElementById('calendar').addEventListener('click',function(e){
    if (e.target.className === 'btn btn-primary modal-edit') {
        var elm = currentEvent.data[e.target.dataset.id];
        document.getElementById('event-id').value = elm.id;
        document.getElementById('title').value = elm.title;
        $('#event-status option:eq('+elm.status_id+')').prop('selected', true);
        document.getElementById('description').value = elm.description;
        // $('#date_start').data('DateTimePicker').date(new Date(elm.start));
        // $('#date_end').data('DateTimePicker').date(new Date(elm.end));
    }
  });

  function displayMessage(message) {
    console.log(message);
  }

  $('<div id="message" class="ui-corner-all"></div>').prependTo($('body'));



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
      option.selected = medicId === e.id;
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
                select.innerHTML = '<option disabled>Seleccione Opción</option>';
                data.forEach(function(e){
                  var option = document.createElement('option');
                  var txt = document.createTextNode(e.name);
                  option.value = e.id;
                  option.selected = userMedicalSpeciality === e.id ? 'selected': '';
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
