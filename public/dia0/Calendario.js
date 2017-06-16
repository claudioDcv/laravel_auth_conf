(function() {
console.log(1111111111111);
var Calendar = function(id){
  this.id = id;
  this.wrapper = document.getElementById(id);

  this.container_table = this.tag('DIV',"calendar-container-table");
  this.container_reloj = this.tag('DIV','calendar-container-horario');
  this.table           = this.tag('TABLE');

  this.wrapper.appendChild(this.container_table);
  this.wrapper.appendChild(this.container_reloj);

  this.setInicioSemana;
  this.init("monday");
  this.actual       = {};

  this.tablemonth = new _0().i('table').cssClass('table-month').node;

  this.tableyear = new _0().i('table').cssClass('table-year').node;

  //this.createStyle();
  this.isWorking = false;
}

Calendar.prototype.getAllMonth = function () {
  var self = this;
  var a = new Fecha(this.actual.fecha);

  Ajax.request({
    url:base_url + '/json/event/filter?year='+a.getFullYear()+'&month='+(a.getMonth()+1 < 10 ? '0'+(a.getMonth()+1) : a.getMonth()+1),
    json:true,
  })
  .done(function(data){
    self.event_in_month = data;
    self.crearMesConDias();

    var fechaSeleccionada = new Fecha(self.actual.fecha);
        fechaSeleccionada = new Fecha(fechaSeleccionada).setHours(0,0,0,0);
    var a = new Fecha(fechaSeleccionada);

    // Dia.init({
    //   data : data,
    //   date : new Date(fechaSeleccionada),
    //   start : '00:00',
    //   end : '24:00',
    // });

  }).fail(function(data){
    return;
  });

}
Calendar.prototype.tag = function(obj,cssClass){
  var elm = document.createElement(obj);
    if(cssClass){elm.className = cssClass};
  return elm;
}

Calendar.prototype.init = function(diaInicioSemana){
  //Metodo que sobreescribe el calendario para que el primer dia sea otro dia
    var original = Fecha.prototype.getDay;
    var daysOfWeek = {
      sunday: 0,
      monday: 1,
      tuesday: 2,
      wednesday: 3,
      thursday: 4,
      friday: 5,
      saturday: 6,
    };
    this.setInicioSemana = daysOfWeek[diaInicioSemana];

    Fecha.prototype.getDay = function(weekBegins) {
      weekBegins = (weekBegins || "monday").toLowerCase();
      return (original.apply(this) + 7 - daysOfWeek[weekBegins]) % 7;
    };

}
Calendar.prototype.create = function (date) {

  //console.table([this.actual]);
  //INIT
  if (date instanceof Fecha) {
      this.setFechaMaestro(date);
  }else{
      this.setFechaMaestro(new Fecha(date));
  }


};

Calendar.prototype.showAndHide = function(){

  switch (this.lastClick) {
    case 'year':
        new _0().n(this.table).css({'display':'none'}).node;
        new _0().n(this.tableyear).css({'display':'block'}).node;
        new _0().n(this.tablemonth).css({'display':'none'}).node;
      break;
    case 'day':
    new _0().n(this.table).css({'display':'block'}).node;
    new _0().n(this.tableyear).css({'display':'none'}).node;
    new _0().n(this.tablemonth).css({'display':'none'}).node;
      break;
    case 'month':
        new _0().n(this.table).css({'display':'none'}).node;
        new _0().n(this.tableyear).css({'display':'none'}).node;
        new _0().n(this.tablemonth).css({'display':'block'}).node;
      break;
    case '':
    new _0().n(this.table).css({'display':'block'}).node;
    new _0().n(this.tableyear).css({'display':'none'}).node;
    new _0().n(this.tablemonth).css({'display':'none'}).node;
      break;
    default:
    new _0().n(this.table).css({'display':'block'}).node;
    new _0().n(this.tableyear).css({'display':'none'}).node;
    new _0().n(this.tablemonth).css({'display':'none'}).node;
  }
}
Calendar.prototype.setFechaMaestro = function(date){
  this.actual.hoy               = (new Fecha()).setHours(0,0,0,0);
  this.actual.fecha             = date;
  this.actual.mes               = this.actual.fecha.getMonth();
  this.actual.anio              = this.actual.fecha.getFullYear();
  this.actual.diaMes            = this.actual.fecha.getDate();
  this.actual.diaSemana         = this.actual.fecha.getDay();
  this.actual.diaUltimo         = new Fecha(this.actual.anio,this.actual.fecha.getMonth() + 1,0);
  this.actual.diaUltimoNumero   = this.actual.diaUltimo.getDate();
  this.actual.diaPrimero        = new Fecha(this.actual.anio,this.actual.fecha.getMonth(),1);
  this.actual.diaPrimeroNumero  = this.actual.diaPrimero.getDate();
  this.actual.dia1Semana1       = this.actual.diaPrimero.getDay();
  this.actual.diaNombre         = this.getNombreDia(this.actual.diaSemana);
  this.actual.mesNombre         = this.getNombreMes(this.actual.mes);
  this.primerDiaSemana          = 1;//1 == Lunes;
  this.arregloDelMes            = [];
  this.list                     = {};
  this.list.mes                 = [];
  this.event_in_month           = [];

  this.getAllMonth();

}
Calendar.prototype.setFecha = function(date){
  this.actual.fecha = date;
}
Calendar.prototype.getNombreDia = function(n){
  this.setInicioSemana;
  return ['Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'][n];
}
Calendar.prototype.getNombreDiaMin = function(n){
  this.setInicioSemana;
  return ['Lu','Ma','Mi','Ju','Vi','Sa','Do'][n];
}
Calendar.prototype.getNombreMes = function(n){
  return ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre',][n];
}
Calendar.prototype.getNombreMesMin = function(n){
  return ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic',][n];
}
Calendar.prototype.crearMesConDias = function (date) {
  var diaMes = 1-this.actual.dia1Semana1;
  var diasEnCalendarioVisual = 1;
  var maximoDiasEnCalendarioVisual = 35;
  //Iterar sobre el mas anterior
  for (var i = 0; i < this.actual.dia1Semana1; i++) {
    var dia = {
      isMesActual : false,
      contador : diasEnCalendarioVisual,
      diaMes : "",
      date : "",
      isHoy : false
    };
    this.arregloDelMes.push(dia);
    diasEnCalendarioVisual++;
  }
  //Iterar sobre el mes actual
  for (var i = this.actual.diaPrimeroNumero; i <= this.actual.diaUltimoNumero; i++) {

    var diaVisual = this.fntoStr(diasEnCalendarioVisual);
    var diaContadorDelMesActual = this.fntoStr(i);
    var fechaCurrent = new Fecha(this.actual.anio,this.actual.mes,diaContadorDelMesActual,0,0,0,0);
    var dia = {
      isMesActual : true,
      contador : diasEnCalendarioVisual,
      diaMes : diaContadorDelMesActual,
      date : fechaCurrent,
      isHoy : ((new Fecha()).setHours(0,0,0,0) == fechaCurrent.getTime()) ? true : false,
			diaDefaultCalendar : this.actual.diaMes
    };
    this.arregloDelMes.push(dia);
    diasEnCalendarioVisual++;
  }
  //Iterar sobre el mes siguiente
  for (var i = diasEnCalendarioVisual; i <= maximoDiasEnCalendarioVisual; i++) {
    var dia = {
      isMesActual : false,
      contador : diasEnCalendarioVisual,
      diaMes : "",
      date : "",
      isHoy : false
    };
    this.arregloDelMes.push(dia);
    diasEnCalendarioVisual++
  }
  this.crearTagDelMes();
};


Calendar.prototype.createStyle = function(){
  var cssTxt = document.createTextNode("#"+this.id+"{width: 100%;height: auto;font-family:arial;}"+
                                       "#"+this.id+" .calendar-container-table{top: 0px;position: absolute;display: block;vertical-align: top;width: 170px;padding-left: 0;left: 0px;}"+
                                       "#"+this.id+" .calendar-container-horario{display: block;padding-left: 180px;width: 100%;}"+
                                       "#"+this.id+" .calendar-container-horario table{width: 100%;}"+
                                       "#"+this.id+" .calendar-container-horario table > tr{padding: 10px;display: block;}"+
                                       "#"+this.id+" .calendar-container-horario table tr.hora-completa{background: hsl(0, 0%, 95%);}"+
                                       "#"+this.id+" .calendar-container-horario table tr.hora-media{}"+
                                       "#"+this.id+" .calendar-container-horario table tr.red{background:red;}"+
                                       "#"+this.id+" .calendar-container-horario table tr.green{background:green;}"+
                                       "#"+this.id+" td.mes-actual:hover{background:grey;}"+
                                       "#"+this.id+" td.calendar-hoy{color: hsl(187, 100%, 42%);}"+
                                       "#"+this.id+" td.mes-distinto{background: #cccccc;}"+
                                       "#"+this.id+" td.dia-evento{background:orange;position:relative;}"+
                                       "#"+this.id+" td.dia-evento span{display: block;transition: all 0.2s ease-in-out;pointer-events:none;opacity:0;position:absolute;width: 100%;top: -80%;border: solid 2px hsl(200, 18%, 26%);left: 0;right: 0;border-radius: 12px;text-align: center;}"+
                                       "#"+this.id+" td.dia-evento:hover span{transition: all 0.3s ease-in-out;opacity:100;background: inherit;width: 100%;top: -120%;}"+
                                       "#"+this.id+" td.dia-evento span:hover{background:hsl(200, 18%, 26%);color:#FFFFFF;}"+
                                       "#"+this.id+" td.dia-selected{outline: hsl(199, 98%, 48%) solid 1px;}"+
                                       "#"+this.id+" table.table-month{font-size:16px;}"+
                                       "#"+this.id+" table.table-month tr{}"+
                                       "#"+this.id+" table.table-month tr td{padding: 10px;}"+
                                       "#"+this.id+" table.table-month tr td.actual-month{font-weight: 800;}"+
                                       "#"+this.id+" table.table-year{font-size:16px;}"+
                                       "#"+this.id+" table.table-year tr{}"+
                                       "#"+this.id+" table.table-year tr td{padding: 10px;}"+
                                       "#"+this.id+" table.table-year tr td.actual-month{font-weight: 800;}"+
                                       ""
                                      );
  var styleCss = document.createElement('STYLE');
      styleCss.appendChild(cssTxt);
      this.wrapper.appendChild(styleCss);
}
Calendar.prototype.deleteChild = function(obj) {
    while (obj.firstChild) {
        obj.removeChild(obj.firstChild);
    }
    return obj;
};
Calendar.prototype.colorize = function(n){
  var a = 255 - n*10 < 1 ? 0 : 255 - n*10;
  var b = a < 1 ? 255 - n*10 : 0;
  var r =  "rgb(255, "+a+", "+b+")";
  return r;
}
Calendar.prototype.filter_month = function(_results){
  //this.table.style.display = 'none';
  this.deleteChild(this.tablemonth);
  var tr_head_y_month = document.createElement('TR');
  var txt_y_month = document.createTextNode(this.actual.anio);
  var td_y_month= document.createElement('TH');
      td_y_month.colSpan = 3;
      td_y_month.appendChild(txt_y_month);
      tr_head_y_month.appendChild(td_y_month);
      tr_head_y_month.addEventListener('click',this.td_y_fn_click.bind(this),false);
  this.tablemonth.appendChild(tr_head_y_month);
  var mes = 0;
  for (var i = 0; i < 4; i++) {
    var tr = document.createElement('tr');
    for (var j = 0; j < 3; j++) {
      var _m = this.getNombreMesMin(mes);
      var td_mes = document.createElement('td');
          td_mes.appendChild(document.createTextNode(_m));
          td_mes.addEventListener('click',this.fn_create_calendar.bind(this),false);
          td_mes.style.cursor = 'pointer';
          td_mes.dataset.month = mes;
      if (this.actual.mes == mes) {
        td_mes.className = 'actual-month';
      }else{

      }
      var self = this;
      _results[0].forEach(function(_mes){
        if (_mes.month-1 == mes) {
          td_mes.style.background = self.colorize(_mes.total);
        }
      });

      tr.appendChild(td_mes);
      mes++;
    }

    this.tablemonth.appendChild(tr);
    this.elementSelected = 0;
  }
  this.lastClick = 'month';
  this.showAndHide();
}

Calendar.prototype.fn_create_calendar = function(event){

  var fecha = new Fecha();

  fecha.setYear(this.actual.anio);
  fecha.setMonth(event.srcElement.dataset.month);
  this.lastClick = 'day';
  this.showAndHide();
  this.removerLosHijos(this.table);
  this.create(fecha);
}
Calendar.prototype.td_y_fn_click = function(event){

  if (this.isWorking) {
    return true;
  }
  this.isWorking = true;

  this.deleteChild(this.tableyear);
  var data = '';
  var year = this.actual.anio < 0 ? this.actual.anio : this.actual.anio -7;
  var year_original = this.actual.anio
  var year_end = this.actual.anio + 8;

  var yearCreate  = function(_data){

    for (var i = 0; i < 5; i++) {
      var y_tr = document.createElement('tr');
      for (var j = 0; j < 3; j++) {
        var y_text = document.createTextNode(year);
        var y_td = document.createElement('td');
            y_td.dataset.year = year;
            y_td.style.cursor = 'pointer';
            for (var k = 0; k < _data[0].length; k++) {
              var _year = _data[0][k].year;
              if (_year == year) {
                y_td.style.background = this.colorize(_data[0][k].total);
              }
            }
            y_td.addEventListener('click',this.td_m_fn_click.bind(this),false);
        y_td.appendChild(y_text);
        y_tr.appendChild(y_td);
        year++;
      }
      this.tableyear.appendChild(y_tr);
    }
    this.lastClick = 'year';
    this.showAndHide();
    this.isWorking = false;
  }
  var url = 'http://localhost:8000/json/event/filter?year_start=' + year + '&year_end=' + year_end;
  Ajax.request({url:url,json:true})
  .done(yearCreate.bind(this)).fail(function(data){
    //msg.value = "No se puede crear evento";
    return;
  });
}
Calendar.prototype.td_m_fn_click = function(event){
  //en caso de presionar un año, se setea el nuevo año en el calendario
  var self = this;
  if (event.srcElement.dataset.year) {
    var fecha = new Fecha();
    fecha.setYear(event.srcElement.dataset.year);
    this.create(fecha);
  }

  //this.container_table
  //MESCREATE http://localhost:8000/json/event/filter?year=2017
  var data = '';
  var url = 'http://localhost:8000/json/event/filter?year=' + this.actual.anio;
  Ajax.request({url:url,json:true})
  .done(this.filter_month.bind(this)).fail(function(data){
    //msg.value = "No se puede crear evento";
    return;
  });
  self.lastClick = 'month';
}
Calendar.prototype.fn_show_day = function(event){
  var self = this;
  var fechaSeleccionada = new Fecha(this.actual.fecha).setDate(parseInt(event.srcElement.dataset['day']));
  var a = new Fecha(new Fecha(fechaSeleccionada).setHours(0,0,0,0));

  Ajax.request({
    url:base_url + '/json/event/list?year='+a.getFullYear()+'&month='+(a.getMonth() < 10 ? '0'+(a.getMonth()+1) : a.getMonth()+1)+'&day='+a.getDate(),
    json:true,
  })
  .done(function(data){
    Dia.init({
      data : data,
      date : new Date(fechaSeleccionada),
      start : '00:00',
      end : '24:00',
    });

    self.elementSelected = event.srcElement.dataset.day;
    self.crearTagDelMes();
  }).fail(function(data){
    //msg.value = "No se puede crear evento";
    return;
  });

  self.lastClick = 'day';
  self.showAndHide();
}
Calendar.prototype.crearTagDelMes = function(){

    this.container_table.appendChild(this.table);
    this.container_table.appendChild(this.tablemonth);
    this.container_table.appendChild(this.tableyear);

  var self = this;

        this.table.className = "calendar-container";
    var cont = 0;

    var elm = [];
    var tr_head_y= document.createElement('TR');

      var txt_y = document.createTextNode(this.actual.anio);
      var td_y= document.createElement('TH');
          td_y.colSpan = 2;
          td_y.addEventListener('click',this.td_y_fn_click.bind(this),false);
          td_y.appendChild(txt_y);
          tr_head_y.appendChild(td_y);

      var txt_m = document.createTextNode(this.getNombreMes(this.actual.mes));
      var td_m= document.createElement('TH');
          td_m.addEventListener('click',this.td_m_fn_click.bind(this),false);
          td_m.colSpan = 5;
          td_m.dataset.month = this.actual.mes;
          td_m.appendChild(txt_m);
          tr_head_y.appendChild(td_m);

    elm.push(tr_head_y)

    var tr_head= document.createElement('TR');
    for (var i = 0; i < 7; i++) {
      var txt = document.createTextNode(this.getNombreDiaMin(i));
      var td= document.createElement('TH');
          td.appendChild(txt);
          tr_head.appendChild(td);
    }
    elm.push(tr_head)
    for (var i = 0; i < 5; i++) {
      var tr= document.createElement('TR');
      for (var j = 0; j < 7; j++) {
        //console.log();
        var txt = document.createTextNode(this.arregloDelMes[cont].diaMes);
        var td= document.createElement('TD');
            td.appendChild(txt);
            td.dataset.day = this.arregloDelMes[cont].diaMes;

						if (this.arregloDelMes[cont].isMesActual) {

              td.style.cursor = "pointer";
              td.addEventListener('click',this.fn_show_day.bind(this),false);

              if (this.arregloDelMes[cont].isHoy) {
                td.className = td.className + " mes-actual calendar-hoy";
              }else{
                td.className = td.className + " mes-actual";
              }
              var self = this;
              this.event_in_month[0].forEach(function(data){
                var a = data.day;
                var b = self.arregloDelMes[cont].diaMes;
                if (parseInt(data.day) == parseInt(self.arregloDelMes[cont].diaMes) ) {
                  td.className = td.className + " dia-evento";
                  var text = document.createTextNode(data.total);
                  var span = document.createElement('span');
                      span.appendChild(text);
                      td.appendChild(span);
                  td.style.background = self.colorize(data.total);
                }
              });
              if (parseInt(self.arregloDelMes[cont].diaMes) == parseInt(self.elementSelected)) {
                td.className = td.className + " dia-selected";
              }
            }else{
              td.className = td.className + " mes-distinto";
            }
            tr.appendChild(td);
        cont++;
      }

      elm.push(tr)
    }
    this.removerLosHijos(this.table);
    var table = this.table;

      elm.forEach(function(data){
        table.appendChild(data);
      });


}
Calendar.prototype.removerLosHijos = function(nodo){
  var myNode = nodo;
    while (myNode.firstChild) {
        myNode.removeChild(myNode.firstChild);
    }
  return nodo;
}
Calendar.prototype.horaEnVivo = function(){
  setInterval(function () {
    setTimeout(function () {
      console.clear();
    }, 1);
    setTimeout(function () {
      console.log(new Fecha());
    }, 1);
  }, 1000);
}

// //fntoStr == formateo numero a string : los convierte en String
// //formatea numeros sin cero como 1 y los deja 01
Calendar.prototype.fntoStr = function(n){
  return ((n+"").length==1)?"0"+n:""+n;
}

var a = new Calendar("calendario");
      // var fecha = new Fecha();
      // var mes = fecha.getMonth()+1;
      // var fechaInit = (mes < 10 ? '0' + mes : mes) +
      // '/'+(fecha.getDate() < 10 ? '0' + fecha.getDate() : fecha.getDate()) +
      // '/'+(fecha.getFullYear() < 10 ? '0' + fecha.getFullYear() : fecha.getFullYear());
     a.create(new Date());

})();
