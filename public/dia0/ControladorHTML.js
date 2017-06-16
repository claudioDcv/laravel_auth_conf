var ControladorHTML = function(dia){

  this.dia = dia;
  this.text = {
    btn_cancel : 'Cancelar',
    btn_add : 'Agregar',
    btn_add_event: 'Agregar Evento',
    btn_edit_event: 'Editar Evento'
  }
  this.contenedor = document.createElement('div');
  //this.title = document.createTextNode('Claudio heramientas');
  //this.contenedor.appendChild(this.title);
  this.default = {};
  this.default.title = "t";

  dia.dia.appendChild(this.contenedor);
  this.vetanaNuevoEvento();
  this.modalEditInit('hide');
  this.modalDeleteInit('hide');
}

ControladorHTML.prototype.addChild = function (obj,child) {
  if (child instanceof Array) {
    for (var i = 0; i < child.length; i++) {
      obj.appendChild(child[i]);
    }
  }else{
    obj.appendChild(child);
  }
  return obj;
}

ControladorHTML.prototype.addData = function(elm,name,value){

  if (name instanceof Array) {
    name.forEach(function(data){
      elm.dataset[data[0]] = data[1];
    })
    return elm;
  }
  return elm.dataset[name] = value;
}

ControladorHTML.prototype.vetanaNuevoEvento = function (arguments) {

  var openBtn = new SL('button','agregar-evento',this.text.btn_add_event).elm;
  var head = new SL('div','dia dia-nuevo-evento-head  dia-defecto-head',this.text.btn_add_event).elm;
  var body = new SL('div','dia dia-nuevo-evento-body dia-defecto-body').elm;
  var msg = new SL('input,msg','mensaje').elm;
      msg.readOnly = true;
  var title = new SL('input,title','title','Una actividad creada desde afuera').elm;
  var inicio = new SL('select','fecha',"09:00").elm;
  var termino = new SL('select','fecha',"09:59").elm;
  var container = new SL('div','dia-hide dia dia-nuevo-evento-container dia-defecto-container').elm;
  var footer = new SL('div','dia dia-nuevo-evento-footer  dia-defecto-footer').elm;
  var ventana = new SL('div','dia dia-nuevo-evento-ventana dia-defecto-ventana').elm;
  var ok = new SL('button','dia-btn-ok',this.text.btn_add).elm;
  var nok = new SL('button','dia-btn-nok',this.text.btn_cancel).elm;

  this.init = inicio;
  this.end = termino;

  this.addChild(body,[msg,title,inicio,termino]);
  this.addChild(footer,[ok,nok])
  this.addChild(ventana,[head,body,footer]);
  this.addChild(container,ventana);

  var _fnInicio = function(){
    if (this.init.value) {
      //console.log(this.dia);
      var fecha = new Fecha(this.dia.fechaInicial);

      var anio = fecha.getFullYear();
      var dia = fecha.getDate();
      var mes = fecha.getMonth() < 9 ? "0"+(fecha.getMonth()+1):fecha.getMonth()+1;

      var fullAnio = mes +"/"+ dia +"/"+ anio;

      var i = fullAnio + " " + inicio.value + ":00";
      let _inicio = new Fecha(i);
      _inicio = _inicio.getTime();

      var bloques = this.dia.getBloque();
      // var bloqueDesde_Inicio = bloques.filter(function(data){
      //   return data.start >= _inicio;
      // });

      var bloqueDesde_Inicio = [];
      for (var i = 0; i < bloques.length; i++) {

        var b = bloques[i];
        if (b.start >= _inicio) {

          if (b instanceof Evento) {
            break;
          }
          bloqueDesde_Inicio.push(b);
        }
      }

      var _inicioSalida = [];

      //LLenar select fin

      this.end = this.dia.deleteChild(this.end);
      for (var i = 0; i < bloqueDesde_Inicio.length; i++) {

        if (bloqueDesde_Inicio[i] instanceof Evento) {
          break;
        }
        _inicioSalida.push(bloqueDesde_Inicio[i]);

        var hora = (new Fecha(bloqueDesde_Inicio[i].start).getHours()+"");
        var minuto = (new Fecha(bloqueDesde_Inicio[i].start).getMinutes()+"");


        //Texto de salida
        var textoSalida = (new Fecha(bloqueDesde_Inicio[i].start).setMinutes(new Fecha(bloqueDesde_Inicio[i].start).getMinutes()+15));
        var __hora = (new Fecha(textoSalida).getHours()+"");
        var __minuto = (new Fecha(textoSalida).getMinutes()+"");
        __hora = (__hora.length < 2 ? "0" + __hora : __hora);
        __minuto = (__minuto.length < 2 ? "0" + __minuto : __minuto);


        hora = (hora.length < 2 ? "0" + hora : hora);
        minuto = (minuto.length < 2 ? "0" + minuto : minuto);

        dat = hora + ":" + (parseInt(minuto)+14);

        var option = document.createElement('OPTION');
        option.value = dat;
        var text = document.createTextNode(__hora + ":" + __minuto);
        option.appendChild(text);
        this.end.appendChild(option);
      }
      //console.log(_inicio,bloques,bloqueDesde_Inicio,_inicioSalida);
    }

  };
  inicio.addEventListener('change',_fnInicio.bind(this),false);
  //BOTONES
  function fn_add(){

    if (!(inicio.value )) {
      msg.value = "Seleccione Fecha Inicio";
      return;
    }
    var fecha = new Fecha(this.dia.fechaInicial);
    var self = this;
    var anio = fecha.getFullYear();
    var dia = fecha.getDate() < 10 ? "0"+(fecha.getDate()):fecha.getDate()
    var mes = fecha.getMonth() < 10 ? "0"+(fecha.getMonth()+1):fecha.getMonth()+1;

    var fullAnio = mes +"/"+ dia +"/"+ anio;

    var obj = {
      start : anio + '-' + mes + '-' + dia + ' ' + inicio.value + ':00',
      end : anio + '-' + mes + '-' + dia + ' ' + termino.value + ':00',
      title : title.value,
      description : '',
      status_id : 2,
    };

    if (!(/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0]{2}$/.test(obj.start) &&
        /^[0-9]{4}\-[0-9]{2}\-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0]{2}$/.test(obj.end))
    ) {
      msg.value = "Seleccione Fechas x";
      return;
    }
    var url = base_url + '/json/event';
    Ajax.request({url:url,json:true,method:'POST',data : obj,headers : {"X-CSRF-TOKEN": csrf_field}
    }).done(function(data){

    }).fail(function(data){
      var value = "No se puede crear evento";
      return;
    });

    var i = fullAnio + " " + inicio.value + ":00";
    var t = fullAnio + " " + termino.value + ":00";

    var a = new Fecha(this.dia.fechaInicial);
    var data =  {
      year:a.getFullYear(),
      month:(a.getMonth()+1 < 10 ? '0'+(a.getMonth()+1) : a.getMonth()+1),
      day:a.getDate()
    };
    var self = this;
    var control = this.dia.agregarHorario(i,t,{title : title.value});
    Ajax.request({url:'/json/event/list',data:data,json:true})
    .done(function(data){
      this.dia = new Dia(data,self.dia.fechaInicial,self.dia.calendarioLibrary);
      var b = new Fecha(self.dia.fechaInicial);
      self.dia.calendarioLibrary.create(b );

    }).fail(function(data){
      //msg.value = "No se puede crear evento";
      return;
    });
    if (control) {
      container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';
    }else{
      msg.value = "No se puede crear evento";
    }

  }
  function fn_close(){
    msg.value = "";
    container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';
  }
  function fn_open(){
    container.className = 'dia-show dia dia-nuevo-evento-container dia-defecto-container';
  }
  //function inicio_change(){
  //  mask(inicio, '00:00', event);
  //}
  //inicio.addEventListener('change',inicio_change.bind(this),false);
  //inicio.addEventListener('paste',inicio_change.bind(this),false);
  //inicio.addEventListener('keyup',inicio_change.bind(this),false);

  function termino_change(){
    //mask(termino, '00/00/0000 00:00:00', event);
    mask(termino, '00:00', event);
  }
  //termino.addEventListener('change',termino_change.bind(this),false);
  //termino.addEventListener('paste',termino_change.bind(this),false);
  termino.addEventListener('keyup',termino_change.bind(this),false);
  openBtn.addEventListener('click',fn_open.bind(this),false);
  ok.addEventListener('click',fn_add.bind(this),false);
  nok.addEventListener('click',fn_close.bind(this),false);

  this.addChild(this.contenedor,[container,openBtn]);

}

ControladorHTML.prototype.modalEditInit = function(toggle){
  this.modalEdit = {};

  var head = new SL('div','dia dia-edit-evento-head  dia-defecto-head',this.text.btn_edit_event).elm;
  var body = new SL('div','dia dia-edit-evento-body dia-defecto-body').elm;
  var msg = new SL('input,msg','mensaje').elm;
      msg.readOnly = true;
  this.modalEdit.title = new SL('input,title','title').elm;
  this.modalEdit.id = new SL('input,id','id',0).elm;
  this.modalEdit.id.type = "hidden";

  this.modalEdit.start = new SL('input,start','start').elm;
  this.modalEdit.end = new SL('input,end','end').elm;

  // var inicio = new SL('input,inicio','fecha',"09:00").elm;
  // var termino = new SL('input,termino','fecha',"09:59").elm;
  this.modalEdit.container = new SL('div','dia-'+toggle+' dia dia-nuevo-evento-container dia-defecto-container').elm;
  var footer = new SL('div','dia dia-edit-evento-footer  dia-defecto-footer').elm;
  var ventana = new SL('div','dia dia-edit-evento-ventana dia-defecto-ventana').elm;
  this.modalEdit.ok = new SL('button','dia-btn-ok',this.text.btn_add).elm;
  this.modalEdit.nok = new SL('button','dia-btn-nok',this.text.btn_cancel).elm;

  this.addChild(body,[msg,this.modalEdit.title,this.modalEdit.start,this.modalEdit.end]);
  this.addChild(footer,[this.modalEdit.ok,this.modalEdit.nok])
  this.addChild(ventana,[head,body,footer]);
  this.addChild(this.modalEdit.container,ventana);
  this.addChild(ventana,this.modalEdit.id)

  this.addChild(this.contenedor,[this.modalEdit.container]);

}

ControladorHTML.prototype.modalDeleteInit = function(toggle){
  this.modalDelete = {};

  var head = new SL('div','dia dia-edit-evento-head  dia-defecto-head',this.text.btn_edit_event).elm;
  var body = new SL('div','dia dia-edit-evento-body dia-defecto-body').elm;
  var msg = new SL('input,msg','mensaje').elm;
      msg.readOnly = true;

  this.modalDelete.id = new SL('input,idDelete','idDelete',0).elm;
  this.modalDelete.id.type = 'hidden';

  // var inicio = new SL('input,inicio','fecha',"09:00").elm;
  // var termino = new SL('input,termino','fecha',"09:59").elm;
  this.modalDelete.container = new SL('div','dia-'+toggle+' dia dia-nuevo-evento-container dia-defecto-container').elm;
  var footer = new SL('div','dia dia-edit-evento-footer  dia-defecto-footer').elm;
  var ventana = new SL('div','dia dia-edit-evento-ventana dia-defecto-ventana').elm;
  this.modalDelete.ok = new SL('button','dia-btn-ok',this.text.btn_add).elm;
  this.modalDelete.nok = new SL('button','dia-btn-nok',this.text.btn_cancel).elm;

  this.addChild(footer,[this.modalDelete.ok,this.modalDelete.nok])
  this.addChild(ventana,[head,body,footer]);
  this.addChild(this.modalDelete.container,ventana);
  this.addChild(ventana,this.modalDelete.id)

  this.addChild(this.contenedor,[this.modalDelete.container]);

}

ControladorHTML.prototype.ModalEdicion = function (toggle) {
  this.modalEdit.container.className = 'dia-'+toggle+' dia dia-nuevo-evento-container dia-defecto-container';
};


ControladorHTML.prototype.openEdit = function () {
  this.ModalEdicion('show');
};

ControladorHTML.prototype.closeEdit = function () {
  this.ModalEdicion('hide');
};
