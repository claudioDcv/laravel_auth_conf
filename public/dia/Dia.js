(function(window) {
    'use strict';
/*
if (parseInt(data.day) == parseInt(self.elementSelected)) {
  debugger
  td.className = td.className + " dia-selected";
}
if (parseInt(self.arregloDelMes[cont].diaMes) == parseInt(self.elementSelected)) {
  td.className = td.className + " dia-selected";
}
*/
    var Dia = function Dia(data, fechaInicial, calendario) {
        //Formato 05/24/2016 00:00:00
        console.log(data);
        this.BLOQUES_TOTALES = 96;
        //3300px //1680px
        this.calendarioLibrary = calendario;
        this.bloqueMinimo = this.BLOQUES_TOTALES === 48 ? 30 : 15;
        this.errores = [];
        this.data = [];
        this.fecha = new Fecha(fechaInicial);
        this.fechaInicial = fechaInicial;
        this.fecha.imprime();
        this.bloqueHorario = [];
        this.bloqueHTML;

        this.idActual = 1;

        this.dia = document.getElementById('dia-calendario');
        this.wrapp = document.createElement('div');
        this.wrapp.id = "dia";

        this.dia = this.deleteChild(this.dia);

        this.dia.appendChild(this.wrapp);


        this.controladorHTML = new ControladorHTML(this);

        this.controladorHTML.modalDelete.ok.addEventListener('click', this.saveModalDelete.bind(this), false);
        this.controladorHTML.modalDelete.nok.addEventListener('click', this.closeModalEdit.bind(this), false);


        this.initActionModalEdit();
        this.setData(data);
    };
    Dia.prototype.time = function(date) {
        return new Fecha(date).getTime();
    };
    Dia.prototype.tamanioDivCont = function(id) {
        id.style.height = (this.BLOQUES_TOTALES === 48 ? 1680 : 3300) + 'px';
    };

    Dia.prototype.addChild = function(obj, child) {
        if (child instanceof Array) {
            for (var i = 0; i < child.length; i++) {
                obj.appendChild(child[i]);
            }
        } else {
            obj.appendChild(child);
        }
        return obj;
    };
    Dia.prototype.addData = function(elm, name, value) {

        if (name instanceof Array) {
            name.forEach(function(data) {
                elm.dataset[data[0]] = data[1];
            });
            return elm;
        }
        return elm.dataset[name] = value;
    };
    /**
    * @param {array}
    *
    */
    Dia.prototype.setData = function(data) {
        this.data = data;
        function dt(date){
          return new Fecha(date).getTime();
        }
        function compare(a,b){
        	if(dt(a.start)<dt(b.start))return -1;
        	if(dt(a.start)>dt(b.start))return 1;
        	return 0;
        }
        this.data.sort(compare);
        this.crearDiaCompleto();
        this._crearHorarioDelDia();
    };

    Dia.prototype.crearDiaCompleto = function() {
        //restamos media hora para que en el for se aumente
        //media hora y comience a las 00:00:00
        this.fecha.setMinutes(this.fecha.getMinutes() - this.bloqueMinimo);
        for (var i = 0; i < this.BLOQUES_TOTALES; i++) {
            this.bloqueHorario.push(this.fecha.setMinutes(this.fecha.getMinutes() + this.bloqueMinimo));
        }
    };

    /**
     * Si existe algun evento dentro del rango start end retornar false
     * si no existe algun evento retornar true quiere decir que se puede crear un
     * evento
     */
    Dia.prototype.isVacio = function(start, end) {
        var _this = this;

        var start = this.time(start);
        var end = this.time(end);
        var isVacio = true;
        //for para comprobar los blques
        this.bloqueHorario.forEach(function(bloque) {
            var _start = _this.time(bloque.start);
            var _end = _this.time(bloque.end);

            var v = bloque instanceof Vacio ? 'Vacio' : '';
            v = bloque instanceof Evento ? 'Evento' : v;
            v = bloque instanceof EventoCont ? 'EventoCont' : v;

            //comprobar si _start esta dentro de start - end
            if ((start <= _start && _start <= end || start <= _end && _end <= end) && v !== 'Vacio') {
                //entra aqui cada vez que encuentra un bloque con Evento
                isVacio = false;
            }
        });
        return isVacio;
    };
    Dia.prototype.isVacioOmitirBloqueActual = function(start, end, id) {
        var _this2 = this;

        var start = this.time(start);
        var end = this.time(end);
        var isVacio = true;
        //for para comprobar los blques
        var encontroBloqueOcupado = true;

        this.bloqueHorario.forEach(function(bloque) {
            var _start = _this2.time(bloque.start);
            var _end = _this2.time(bloque.end);

            var v = bloque instanceof Vacio ? 'Vacio' : '';
            v = bloque instanceof Evento ? 'Evento' : v;
            v = bloque instanceof EventoCont ? 'EventoCont' : v;

            //comprobar si _start esta dentro de start - end

            if ((start <= _start && _start <= end || start <= _end && _end <= end) && v !== 'Vacio') {
                //entra aqui cada vez que encuentra un bloque con Evento
                isVacio = false;
                if (bloque.id === id && encontroBloqueOcupado) {
                    isVacio = true;
                } else {
                    //si encuentra un bloque ocupado que no es el mismo bloque entra aqui
                    encontroBloqueOcupado = false;
                }
            }
        });
        return isVacio;
    };
    /**
     * evalua que start sea menor a end y que ademas sean fechas reales
     */
    Dia.prototype.isFechaCorrecta = function(start, end) {
        try {
            return this.time(start) < this.time(end) ? true : false;
        } catch (e) {
            return false;
        }
    };
    /* Metodo publico que se llama desde afuera */
    Dia.prototype.agregarHorario = function(start, end, data) {

        var start = this.time(start);
        var end = this.time(end);
        var seAgrego = false;

        if (!this.isFechaCorrecta(start, end)) {
            this.errores.push("start no puede ser mayor a end");
            return false;
        }

        //Ingresa al bloque si existe algun Evento dentro del bloque
        if (this.isVacio(start, end)) {

            var agregarDesdeEstePunto = this.calculaDesdeInicio(start);
            var evento = new Evento(this.idActual, start, end, this.calcularDiferenciaStartEnd(start, end).bloques);
                evento._id = data.id;
                evento.title = data.title;
                evento.text = data.description;

            this.idActual++;
            var datos = this.data;
            this.agregarEventoDesdeUnPunto(agregarDesdeEstePunto, evento);
            seAgrego = true;
        }
        return seAgrego;
    };

    Dia.prototype.agregarHorarioMod = function(data) {
        var self = this;
        var saveEditServerSide = function(data){



          var ev = data.evento;

          var bl = data.bloque;
                   bl.description = new Date();

          var url = base_url + '/json/event/update/' + ev.id;


          Ajax.request({url:url,json:true,data  : bl,method:'POST', headers : {"X-CSRF-TOKEN": csrf_field}})
          .done(function(data){

          }).fail(function(data){

          });
        }
        var _bl = this.controladorHTML._bloqueModalEdit.bloque;
        _bl.title = this.controladorHTML.modalEdit.title.value;
        _bl.start = this.controladorHTML.modalEdit.start.value;
        _bl.end = this.controladorHTML.modalEdit.end.value;


        saveEditServerSide(data);

        this.editEventoBloqueAntes = data.bloque.bloques;
        var start = this.time(this.controladorHTML._bloqueModalEdit.bloque.start);
        var end = this.time(this.controladorHTML._bloqueModalEdit.bloque.end);

        if (!this.isFechaCorrecta(start, end)) {
            this.errores.push("start no puede ser mayor a end");
            return false;
        }

        var seAgrego = false;
        //Ingresa al bloque si existe algun Evento dentro del bloque
        if (this.isVacioOmitirBloqueActual(start, end, data.bloque.id)) {

            var agregarDesdeEstePunto = this.calculaDesdeInicio(start);
            var evento = new Evento(data.bloque.id, start, end, this.calcularDiferenciaStartEnd(start, end).bloques);
                evento._id = self.controladorHTML._bloqueModalEdit.evento.id;
                evento.title = self.controladorHTML._bloqueModalEdit.bloque.title;
                evento.text = self.controladorHTML._bloqueModalEdit.description;

            this.agregarEventoDesdeUnPunto(agregarDesdeEstePunto, evento, true);
            seAgrego = true;
        } else {
            this.errores.push("no se puede cambiar el evento, un bloque ya esta utilizado");
        }
        return seAgrego;
    };

    Dia.prototype.agregarEventoDesdeUnPunto = function(punto, evento, oldInit) {
        var _this3 = this;

        var bloques = this.bloqueHorario;
        var _evento = Clonador(evento);
        var indice = 0;
        var self = this;

        var fecha = new Fecha(this.fechaInicial);
        var ingresoEnPrimerLoop = true;
        var fechaBloque;
        var fechaBloqueEnd;

        self.bloqueHorario.forEach(function(bloque) {

            if (self.bloqueHorario[indice].id === evento.id) {

                fechaBloque = new Fecha(fecha).setMinutes(new Fecha(fecha).getMinutes() + indice * 15);
                var f = fechaBloque;
                fechaBloqueEnd = new Fecha(f).setMinutes(new Fecha(f).getMinutes() + 14);

                self.bloqueHorario[indice] = new Vacio(i, 1, fechaBloque, fechaBloqueEnd);
            }
            indice++;
        });

        var i = 0;
        var e = 1;
        var entrar = false;
        var isPrimero = true;
        self.bloqueHorario.forEach(function(bloque) {
            var data = self.bloqueHorario[i];

            //Entra aqui para crear los eventos cont
            if (entrar && e < evento.bloques) {
                self.bloqueHorario[i] = new EventoCont(evento.id, evento.start, evento.end, evento.bloques);
                e++;
                isPrimero = false;
            }

            if (isPrimero && _this3.time(self.bloqueHorario[i].start) === _this3.time(_evento.start)) {
                self.bloqueHorario[i] = evento;
                entrar = true;
            }

            i++;
        });

        this.crearHTML();

        return true;
    };

    Dia.prototype.decimalToHours = function(numero) {
        var sign = numero < 0 ? '-' : '';
        var min = Math.floor(Math.abs(numero));
        var sec = Math.floor(Math.abs(numero) * 60 % 60);
        var stringDeRetorno = sign + (min < 10 ? 0 : "") + min + ':' + (sec < 10 ? '0' + sec : sec);

        switch (sec) {
            case 45:
                sec = 3;
                break;
            case 30:
                sec = 2;
                break;
            case 15:
                sec = 1;
                break;
            default:
                sec = 0;
        }

        var numeroDeBoques = (min > 0 ? min * 4 : 0) + sec;

        return {
            bloques: numeroDeBoques,
            text: stringDeRetorno
        };
    };

    Dia.prototype.calculaDesdeInicio = function(start) {
        this.fecha = new Fecha(this.fechaInicial);
        var bloquesDesdeInicio = 0;
        for (var i = 0; i < this.BLOQUES_TOTALES; i++) {
            //TODO get minutos cambiar de 15 a 30 segun corresponda
            this.fecha.setMinutes(this.fecha.getMinutes() + this.bloqueMinimo);

            var a = new Fecha(start);
            var b = new Fecha(this.fecha);
            if (this.time(start) === this.time(this.fecha)) {
                bloquesDesdeInicio = i + 1;
                break;
            }
        }
        return bloquesDesdeInicio;
    };

    Dia.prototype.calcularDiferenciaStartEnd = function(start, end) {
        var obj = this.decimalToHours((this.time(end) + 100000 - this.time(start)) / 3600000);
        return obj;
    };

    Dia.prototype.agregarNuevo = function(evento) {
        for (var i = 0; i < this.BLOQUES_TOTALES; i++) {
            var a = this.bloqueHorario[i];
            var evt = evento;
            if (this.time(evt.end) === a) {
                var evento = new EventoCont(this.idActual, evt.start, evt.end, this.calcularDiferenciaStartEnd(evt.start, evt.end).bloques);
                this.bloqueHorario[i] = evento;
            } else if (this.time(evt.end) > a && this.time(evt.start) < a) {
                var evento = new EventoCont(this.idActual, evt.start, evt.end, this.calcularDiferenciaStartEnd(evt.start, evt.end).bloques);
                this.bloqueHorario[i] = evento;
            } else if (this.time(evt.start) === a) {

                var evento = new Evento(this.idActual, evt.start, evt.end, this.calcularDiferenciaStartEnd(evt.start, evt.end).bloques);
                    evento._id = data.id;
                    evento.title = data.title;
                    evento.text = data.description;

                this.bloqueHorario[i] = evento;
            }
        }

        this.idActual++;

    };

    Dia.prototype._crearHorarioDelDia = function() {
        var idEventoCont = 0;
        for (var i = 0; i < this.BLOQUES_TOTALES; i++) {
            var a = this.bloqueHorario[i];

            var fechaCalculada = new Fecha(this.bloqueHorario[i]).setMinutes(new Fecha(this.bloqueHorario[i]).getMinutes() + 14);
            this.bloqueHorario[i] = new Vacio(i, 1, this.bloqueHorario[i], fechaCalculada);
            for (var j = 0; j < this.data.length; j++) {
                var evt = this.data[j];
                evt.start = this.time(evt.start);
                evt.end = this.time(evt.end);


                if (this.time(evt.end) === a) {
                    var evento = new EventoCont(idEventoCont, evt.start, evt.end, this.calcularDiferenciaStartEnd(evt.start, evt.end).bloques);
                    this.bloqueHorario[i] = evento;
                } else if (this.time(evt.end) > a && this.time(evt.start) < a) {
                    var evento = new EventoCont(idEventoCont, evt.start, evt.end, this.calcularDiferenciaStartEnd(evt.start, evt.end).bloques);
                    this.bloqueHorario[i] = evento;
                } else if (this.time(evt.start) === a) {
                  //mod para xhr laravel
                    var evento = new Evento(this.idActual, evt.start, evt.end, this.calcularDiferenciaStartEnd(evt.start, evt.end).bloques);
                        evento._id = evt.id;
                        evento.text = evt.description;
                        evento.title = evt.title;
                        evento.data = evt;

                    this.bloqueHorario[i] = evento;

                    idEventoCont = this.idActual;
                    this.idActual++;
                }
            }

        }

        this.crearHTML();
    };

    Dia.prototype.deleteChild = function(obj) {
        while (obj.firstChild) {
            obj.removeChild(obj.firstChild);
        }
        return obj;
    };

    Dia.prototype.closeModalEdit = function () {
      this.controladorHTML.modalDelete.container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';
    }
    Dia.prototype.saveModalDelete = function () {

      var deleteId = this.elementoDelete.dataset.id;
      this._clicYEliminarEvento(deleteId,this.elementoDelete,this);
    }

    Dia.prototype.clicYEliminarEvento = function(event) {
        event.stopPropagation();
        this.elementoDelete = event.target;
        this.controladorHTML.modalDelete.container.className = 'dia-show dia dia-nuevo-evento-container dia-defecto-container';

    }
    Dia.prototype._clicYEliminarEvento = function(id,elemento,self) {
        event.stopPropagation();

        var url = base_url + '/json/event/delete';
        Ajax.request({url:url,json:true,method:'POST',data : {id : id},headers : {"X-CSRF-TOKEN": csrf_field}
        }).done(function(data){
          if (data.status == 1) {
            //Metodo de busqueda recursivo
            function _buscar(_elemento) {
                if (_elemento.dataset.bloque) {
                    self.eliminarBloqueAccion(_elemento);


                    self.controladorHTML.modalDelete.container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';

                    var a = self.calendarioLibrary;
                    var b = new Fecha(self.fechaInicial);
                    var c = self.calendarioLibrary.actual.fecha;
                    self.calendarioLibrary.create(b );
                    return;
                } else {
                    //if de salida
                    if (_elemento !== null) {
                        _elemento = _elemento.parentElement;
                        //se autollama
                        _buscar(_elemento);
                    }
                }
            }
            //function que inicia la recursividad
            function buscar(_elemento) {
                _buscar(_elemento);
            }
            buscar(elemento);
          }else{
            self.controladorHTML.modalDelete.container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';
            console.log('error al eliminar');
          }
        }).fail(function(data){
          self.controladorHTML.modalDelete.container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';
          var value = "No se puede crear evento";
          return;
        });

    };

    Dia.prototype.eliminarBloqueAccion = function(elm) {
        var elm = this.deleteChild(elm);
        var isPrimero = true;
        var elmStart = parseInt(elm.dataset.start);
        for (var i = 0; i < this.bloqueHorario.length; i++) {
            var start = this.bloqueHorario[i].start;
            if (start === elmStart) {

                var finHoraVacio = new Fecha(elmStart).setMinutes(new Fecha(elmStart).getMinutes() + 14);
                this.bloqueHorario[i] = new Vacio(i, 1, elmStart, finHoraVacio);

                this.bloqueHorario[i].id = i;
                isPrimero = false;
                var horaEvento = elmStart;

                for (var j = i + 1; j < parseInt(elm.dataset.bloque) + i; j++) {
                    horaEvento = new Fecha(horaEvento).setMinutes(new Fecha(horaEvento).getMinutes() + 15);
                    finHoraVacio = new Fecha(horaEvento).setMinutes(new Fecha(horaEvento).getMinutes() + 14);
                    //El (1) quiere decir que por defecto el bloque vacio mide un solo bloque
                    this.bloqueHorario[j] = new Vacio(i, 1, horaEvento, finHoraVacio);
                    this.bloqueHorario[j].id = j;
                }
                break;
            }
        }
        this.crearHTML();
    };

    Dia.prototype.initActionModalEdit = function() {
        function closeModalEdit() {
            this.controladorHTML.modalEdit.container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';
        }
        var self = this;
        function saveModalEdit(event) {
            event.stopPropagation();
            this.controladorHTML.modalEdit.container.className = 'dia-hide dia dia-nuevo-evento-container dia-defecto-container';

    //         this.bloqueEdit.title = this.controladorHTML.modalEdit.title.value;
    //         this.bloqueEdit.start = this.time(this.controladorHTML.modalEdit.start.value);
    //         this.bloqueEdit.end = this.time(this.controladorHTML.modalEdit.end.value);
    //  // self.controladorHTML.modalEdit.title.value = evento.title;
      // self.controladorHTML.modalEdit.id.value = self.controladorHTML._bloqueModalEdit.id;
      // self.controladorHTML.modalEdit.start.value = self.controladorHTML._bloqueModalEdit.start;
      // self.controladorHTML.modalEdit.end.value = self.controladorHTML._bloqueModalEdit.end;
      //MARCA
            if (this.agregarHorarioMod(self.controladorHTML._bloqueModalEdit)) {
                this.crearHTML();
            }
        }

        this.controladorHTML.modalEdit.ok.addEventListener('click', saveModalEdit.bind(this), false);
        this.controladorHTML.modalEdit.nok.addEventListener('click', closeModalEdit.bind(this), false);
    };

    Dia.prototype.clicYEditarEvento = function(event) {
        //Abrir Modal Editar Evento
        var self = this;
        var data = event.srcElement.parentNode.childNodes[0].dataset;
        this._controladorHTML = {};
        this._controladorHTML.modalEdit = {};
        this.bloqueEdit = this.bloqueHorario[data.numero];
        /*Abrir modal e incluir info del bloque */
        function openModal(self,evento,bloque) {
            self.controladorHTML._bloqueModalEdit = {
              evento : evento,
              bloque : bloque,
            };

            var bloque = self.controladorHTML.modalEdit;
            var eventoToEdit = self.controladorHTML._bloqueModalEdit;
            bloque.container.className = 'dia-show dia dia-nuevo-evento-container dia-defecto-container';
            bloque.id.value = eventoToEdit.bloque.id;
            bloque.start.value = eventoToEdit.evento.start;
            bloque.end.value = eventoToEdit.evento.end;
            bloque.title.value = eventoToEdit.evento.title;
            //bloque.description.value = eventoToEdit.evento.description;
        }

        var id = event.srcElement.dataset.id;
        var evento = {};
        var url = base_url + '/event/' + id;
        Ajax.request({url:url,json:true,method:'GET'})
        .done(function(data){
          openModal(self,data,self.bloqueEdit);
        }).fail(function(data){

        });


    };
    Dia.prototype.returnHoraFormat = function(hh) {
        var hh = new Fecha(hh);
        var anio = hh.getFullYear();
        var dia = hh.getDate();
        var mes = hh.getMonth() < 9 ? "0" + (hh.getMonth() + 1) : hh.getMonth() + 1;
        var fullAnio = mes + '/' + dia + '/' + anio;
        var startMinute = hh.getMinutes();
        startMinute = startMinute <= 9 ? "0" + startMinute : startMinute;
        var startHour = hh.getHours();
        startHour = startHour <= 9 ? "0" + startHour : startHour;
        return fullAnio + ' ' + startHour + ':' + startMinute;
    }
    Dia.prototype.crearHTML = function() {
        /* accion que se ejecuta cuando se hace click en un bloque type Vacio*/
        var _fnVacio = function _fnVacio(event) {
            var start = event.target.dataset.start;
            //new Fecha(parseInt(start))
            event.target.innerHTML = '' + event.target.innerHTML;
        };
        var color = function(code){
          switch (code) {
            case 'cancel':
              return 'hsl(0, 73%, 77%)';
            case 'acepted':
              return 'hsl(88, 50%, 67%)';
            case 'active':
              return 'hsl(187, 71%, 82%)';
            default:
              return '';
          }
        }
        this.wrapp.innerHTML = "";
        var arregloBLoque = [];
        var sumaPorcentajes = 0;
        var i = 0;
        for (i; i < this.BLOQUES_TOTALES;) {
            var objeto = this.bloqueHorario[i];

            var bloque = new SL('div', 'evento').elm;
            if (objeto.data) {
              bloque.style.background = color(objeto.data.status.code);
            }

            var botonContenedor = new SL("div", "dia-btn-evento-contenedor").elm;
            var botonEliminar = new SL("button", 'dia-btn dia-btn-del', 'Eliminar').elm;
            var botonEditar = new SL('button', 'dia-btn dia-btn-editar', 'Editar').elm;
            var a = this.bloqueHorario[i].bloques;
            sumaPorcentajes += a;
            if (typeof a !== 'undefined') {
                var c = a;
                if (this.BLOQUES_TOTALES === 48) {
                    c = a * 2;
                }

                bloque.style.height = c * 100 / this.BLOQUES_TOTALES + '%';

                var hora = new SL('p').elm;

                if (objeto.evento) {

                    //Pintar data
                    var template = '\n' + new Fecha(objeto.start).imprime() + ' - ' + new Fecha(objeto.end).imprime() + '\n' + (objeto.title || '') + ' |\n' + (objeto.data.status.name || '') + '\n';

                    var horaTxt = document.createTextNode(template);

                    this.addChild(hora, horaTxt);
                    this.addChild(bloque, hora);

                    this.addData(botonEliminar, [
                        ['bloque', a],
                        ['numero', i],
                        ['id', objeto._id],
                        ['start', this.time(objeto.start)]
                    ]);
                    botonEliminar.addEventListener('click', this.clicYEliminarEvento.bind(this), false);

                    this.addData(botonEditar, [
                        ['bloque', a],
                        ['numero', i],
                        ['id', objeto._id],
                        ['start', this.time(objeto.start)]
                    ]);
                    botonEditar.addEventListener('click', this.clicYEditarEvento.bind(this), false);

                    this.addChild(botonContenedor, [botonEliminar, botonEditar]);
                    this.addChild(bloque, botonContenedor);

                    i += a;
                } else {
                    var horaTxt = document.createTextNode(new Fecha(objeto.start).imprime());

                    this.addChild(hora, horaTxt);
                    this.addChild(bloque, hora);

                    bloque.className = "vacio";
                    bloque.dataset.start = objeto.start;

                    bloque.addEventListener('click', _fnVacio.bind(this), false);

                    i++;
                }
                this.addChild(this.wrapp, bloque);
                this.tamanioDivCont(this.wrapp);
                arregloBLoque.push(a);
            }
        }

        this.crearSelect();
    };
    Dia.prototype.getEventos = function() {
        return this.bloqueHorario.filter(function(b) {
            return b instanceof Evento;
        });
    };
    Dia.prototype.getBloque = function() {
        return this.bloqueHorario;
    };

    Dia.prototype.getHorariosLibres = function() {
        var horarioInicial = new Fecha(this.fechaInicial);
        var salida = '';
        var horasVacias = this.bloqueHorario.filter(function(b) {
            return b instanceof Vacio;
        });

        var reObj = horasVacias.map(function(b) {
            return b.start;
        });

        return reObj;
    };

    Dia.prototype.crearSelect = function() {
        var data = this.getHorariosLibres();
        var select = this.deleteChild(this.controladorHTML.init);
        select.name = "inicio";
        select.className = "fecha";

        var option = document.createElement('OPTION');
        option.value = '';
        var text = document.createTextNode('Seleccione');
        option.appendChild(text);
        select.appendChild(option);

        data.forEach(function(dat) {
            var option = document.createElement('OPTION');

            var hora = new Fecha(dat).getHours() + "";
            var minuto = new Fecha(dat).getMinutes() + "";

            hora = hora.length < 2 ? "0" + hora : hora;
            minuto = minuto.length < 2 ? "0" + minuto : minuto;

            dat = hora + ":" + minuto;

            option.value = dat;
            var text = document.createTextNode(dat);
            option.appendChild(text);
            select.appendChild(option);
        });

        //var s = this.controladorHTML.init;
        var e = this.controladorHTML.end;

        // if (s.parentNode) {
        //     var a = s.parentNode.replaceChild(select, s);
        // }

        //var b = e.parentNode.replaceChild(select2, e);
    };

    window.Dia = Dia;
})(window);
