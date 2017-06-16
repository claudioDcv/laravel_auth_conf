//document.body.style.display = "none";
//document.body.style.background = "#000";
var Day = function(id){
  this.vinculateId = id;

  this.modal = new Modal();
  this.count = 0;

  this.main = document.getElementById(this.vinculateId);
  this.lineTime = document.createElement('div');
  this.lineTime.style.position = 'absolute';
  this.lineTime.style.height = '2px';
  this.lineTime.style.display = 'none';
  this.lineTime.style.width = '100%';
  this.lineTime.style.background = 'red';
  this.service = {
    main: 'event',
  };

  this.readyClock();

  this.create([]);

}

Day.prototype.readyClock = function(){
  var day = 60 * 60 * 24;
  var self = this;
  var firstIteration = false;
  setInterval(function () {
    var dateStart = new Date();
    var dateCount = new Date();
        dateStart.setHours(0,0,0,0);
    var dateEnd = new Date();
        dateEnd.setHours(23,59,59,59);
        var second = parseInt((dateCount - dateStart)/1000);
        var secondEnd = parseInt((dateEnd - dateStart)/1000);
    self.lineTime.style.top =((second*100)/secondEnd) + '%';
    if (!firstIteration) {
      self.lineTime.style.display = 'block';
    }
  }, 1000);
}

Day.prototype.dateToHours = function(date){

  if (!date) {
    return '';
  }
  var b = date.split(' ')
  b = b[1].split(':')
  return b[0] + ':' + b[1]
}
Day.prototype.create = function(_data){
self = this;

var model = [].concat(_data)

var date_a = new Date().getTime();
function compare(a,b) {
  if (a.a < b.a)
    return -1;
  if (a.a > b.a)
    return 1;
  return 0;
}

function minTommss(minutes){
 var sign = minutes < 0 ? "-" : "";
 var min = Math.floor(Math.abs(minutes));
 var sec = Math.floor((Math.abs(minutes) * 60) % 60);
 return sign + (min < 10 ? "0" : "") + min + ":" + (sec < 10 ? "0" : "") + sec;
}

function timeToDecimal(t) {
    var arr = t.split(':');
    return parseFloat(parseInt(arr[0], 10) + '.' + parseInt((arr[1]/6)*10, 10));
}

function p_random(){
  var words = ['apple', 'beer', 'cake', 'potato', 'orange','onion','pinaple','water','soda'],
    div = document.getElementById('foo');
  var r = '';
  for(i = 0; i < 5; i++) {
      r += ' ' + words[Math.floor(Math.random() * words.length)];
  }
  return r;
}

var event = {
  id : 'new-day',
  start : 'a',
  end : 'b',
  title : 'title'
}



//remap event
model.map(function(data){

  var _start = self.dateToHours(data.start);
  var _end = self.dateToHours(data.end);

  data.start = _start;
  data.end = _end;
  data.a = timeToDecimal(_start);
  data.b = timeToDecimal(_end);
  data.title = data[event.title]

  return data;
})

//Optional method *Asegura un orden mas preciso*
// model.sort(function (a, b) {
//     var aSize = a.a;
//     var bSize = b.a;
//     var aLow = a.b;
//     var bLow = b.b;
//
//     if(aSize == bSize)
//     {
//         return (aLow < bLow) ? -1 : (aLow > bLow) ? 1 : 0;
//     }
//     else
//     {
//         return (aSize < bSize) ? -1 : 1;
//     }
// });

//console.table(a);

var model_group = [];
var sub_group = [];

for (var i = 0; i < model.length; i++) {
  var _a = model[i]
  sub_group = [];
  for (var j = i; j < model.length; j++) {
    var _b = model[j]
    if (_a.a === _b.a && typeof _b.a !== "undefined") {
        sub_group.push(model[j])
        model[j] = '';
    }else{
      model.splice(j,0)
    }
  }
  if (sub_group.length > 0) {
      model_group.push(sub_group)
  }

}

var a_general = [];
var x = 0;
while (model_group.length > 0) {
  var inside_array = [{a:-1,b:-1}];

  for (var i = 0; i < model_group.length; i++) {
    for (var j = 0; j < model_group[i].length; j++) {
      var _e = model_group[i][j]
      if (inside_array[inside_array.length-1].b < _e.a) {
        inside_array.push(_e);
        model_group[i].splice(j,1)
      }

    }

  }
  a_general.push(inside_array);
  if (a_general[x][0].a == -1) {
    a_general[x].splice(0,1)
  }
  if (a_general[x].length < 1) {
    a_general.splice(x,1);
  }
  for (var i = 0; i < model_group.length; i++) {
    var _e = model_group[i]
    if (_e.length < 1) {
      model_group.splice(i,1);
    }
  }
  x++;
}
//write in html
var main = new _0().id(this.vinculateId).deleteChild().css('margin-left','172px')
.css('height', '720px').css('position','relative');

    var cont_event_calendar = new _0().i('div').css('position','absolute').css('left','45px');

  var cont_hour =  new _0().i('div').css('float','left').css('width','100%')

  for (var i = 0; i < 25; i++) {
      var hour =  new _0().i('div').css('outline','hsl(0, 0%, 79%) solid 1px')
                      .css('height','30px').css('width','100%')
                      .css('padding','4px 14px').text(i);
        cont_hour.add(hour.node);
  }
  console.log(this.lineTime);
    main.node.appendChild(cont_hour.node);

    //add line time count
    main.node.appendChild(this.lineTime);

  for (var i = 0; i < a_general.length; i++) {
    var cont = a_general[i]
    var container = new _0().i('div')
        .css({'float':'left','width':'150px','font-size':'12px','z-index':'1'});

    for (var j = 0; j < cont.length; j++) {
      var marginTop = 0;
      var first = false;
      if (typeof a_general[i][j-1] === "undefined") {
        first = true;
      }
      if (first) {
        marginTop = (a_general[i][j].a)*30
      }else{
        var m = a_general[i][j].a - a_general[i][j-1].b
        marginTop = m*30;
      }
      var event = a_general[i][j]
      var size = event.b - event.a;

          var t_event = new _0().i('div')
              .css('margin-top',marginTop+'px')
              .css('boxShadow','inset 0px 0px 1px #607D8B').css('height',size*30+'px')
              .css('overflow','hidden').css('padding','6px')
              .css('position', 'relative')
              .css('background','rgba(0, 0, 0, 0.11)');

          var hour_text = new _0().i('span').text(event.start + '-' + event.end)
              .cssClass('badge badge-pill badge-default');

          var content_text = new _0().i('h6').text(event.title);

          var t_p = new _0().i('p').text(event.description);

          var t_a = new _0().i('button').text('e');
          t_a.node.className = 'event-link';
          t_a.node.dataset.eventId = event.id;
          t_a.node.addEventListener('click', this.getEvent.bind(this), false);


          t_event.add(hour_text.node).add(content_text.node).add(t_p.node).node;
          t_event.add(t_a.node);
          container.add(t_event.node);

        }
        cont_event_calendar.add(container.node);
  }
main.add(cont_event_calendar.node)

}
Day.prototype.getEvent = function(e){
  var self = this;
  Ajax.request({
    url:base_url + '/event/' + e.target.dataset.eventId,
    json:true,
  })
  .done(function(data){
    data.start = self.dateToHours(data.start);
    data.end = self.dateToHours(data.end);
    self.modal.open(data);
  });
}
Day.prototype.init = function(opt){
  this.create(opt.data)
}

var Modal = function(){
  this.elm = {};
  // new _0().id(this.vinculateId).deleteChild().css('margin-left','172px')
  this.containerModal = new _0().i('div')
    .css('display','none')
    .cssClass('modal-editor body-modal-close');
  this.boxModal = new _0().i('div');
  this.containerModal.node.appendChild(this.boxModal.node);
  this.bodyModal = new _0().i('div');

  this.containerModal.node.addEventListener('click', this.eventBtnClose.bind(this), false);

  this.btnClose = new _0().i('button').text('Cerrar');
  this.btnClose.node.className = 'body-modal-close';
  this.btnClose.node.addEventListener('click', this.eventBtnClose.bind(this), false);
  this.boxModal.node.appendChild(this.bodyModal.node);

  this.btnEdit = new _0().i('button').text('Editar');
  this.btnEdit.node.className = 'body-modal-edit';
  this.btnEdit.node.addEventListener('click', this.eventBtnEdit.bind(this), false);

  this.footer = new _0().i('div').cssClass('modal-editor-footer');

  this.footer.node.appendChild(this.btnEdit.node);
  this.footer.node.appendChild(this.btnClose.node);
  this.boxModal.node.appendChild(this.footer.node);

  document.body.appendChild(this.containerModal.node);

}
Modal.prototype.eventBtnEdit = function(e){
  this.bodyModal.deleteChild();
  var elm = this.elm;

  this.content =`
<label>Titulo</label><input value="${elm.title}"/>
<label>Descripción</label><input value="${elm.description}"/>
<label>Inicio</label><input value="${elm.start}"/>
<label>Fin</label><input value="${elm.end}"/>
`;
    this.bodyModal.node.innerHTML += this.content;
}

Modal.prototype.eventBtnClose = function(e){
  console.log(e);
  if (e.target.className.indexOf('body-modal-close') === -1) {
      e.preventDefault();
      return;
  }

  this.containerModal.node.style.display = 'none';
}
Modal.prototype.open = function(elm){
  this.bodyModal.deleteChild();
  console.log(elm);
  this.elm = elm;

  this.content =`
<h2>${elm.title}</h2>
<small>${elm.description}</small>
<label>${elm.start}</label>
<label>${elm.end}</label>
`;
    this.bodyModal.node.innerHTML += this.content;


  this.containerModal.node.style.display = 'block';
}
Modal.prototype.close = function(){

}

window.Dia = new Day('new-day');
//orderMajor

/*
var a = [
  {a:1,b:3},
  {a:5,b:7},
  {a:7,b:9},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:10,b:23},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:19,b:22},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:12,b:13},
  {a:10,b:20},
  {a:1,b:2},
  {a:16,b:17},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
];

function compare(a,b) {
  if (a.a < b.a)
    return -1;
  if (a.a > b.a)
    return 1;
  return 0;
}

a.sort(compare);

console.log(a);


for (var i = 0; i < a.length; i++) {
  a[i]
}

/*
for (var i = 0; i < a.length; i++) {
  var b = a[i];//.splice(0,1);
  //console.log(b);

  for (var j = 0; j < a.length; j++) {
    var c = a[j];

    if (b <= c) {
      console.log('a['+i+']:'+c);
      //b = c;
      //a.splice(j,1);
    }
  }
  console.log('-------');
}

/*

(function(window) {
    'use strict';

var Day = function(id,opt){

  this.html = document.getElementById(id);
  this.html.className = 'day-library';
  this.day = {
    now : '',
    now_init : '',
    hour_start : '',
    hour_end : '',
  };
  this.config = {
    data : [],
    total_minutes : 1440,
    minute_size : 1,
    cell_size : 60,
    start : '00:00',
    end : '24:00',
  };
  this.internal = {
    array_data : new Array(),
  };

  this.internal.table_day = document.createElement('div');
  this.html.appendChild(this.internal.table_day);
  this.init(opt);
}
Day.prototype.init = function(opt){
  console.log(opt.data);
  var opt = opt || {};
  this.config.start = opt.start || '00:00';
  this.config.end = opt.end || '24:00';

  this.deleteChild(this.internal.table_day);
  this.setDate(opt.date);
  this.setIntervalDate(opt.date);
  this.setData(opt.data);
  this.setActualInitDay(opt.date);
  this.createArrayDay();
}
Day.prototype.setIntervalDate = function(date){
  var date = new Date(date.getTime());
  var year = date.getFullYear();
  var month = date.getMonth() + 1;
      month = month < 10 ? '0' + month : month;
  var day = date.getDate();
      day = day < 10 ? '0' + day : day;
  var start = year + '-' + month + '-' + day + ' ' + this.config.start;
  var end = year + '-' + month + '-' + day + ' ' + this.config.end;
  this.day.hour_start = new Date(start);
  this.day.hour_end = new Date(end);
}
Day.prototype.createArrayDay = function(){

  var time_s = new Date(this.day.hour_start.getTime());
  var time_e = new Date(this.day.hour_end.getTime());

  for (var i = time_s.getTime(); i < time_e.getTime();) {
    var a = {};
        a.time = new Date(time_s.getTime());
    this.internal.array_data.push(a);
    time_s.setMinutes(time_s.getMinutes()+1);

    var i = time_s.getTime();
  }
  this.createHTML();
}
Day.prototype.setActualInitDay = function(date){
  this.day.now_init = new Date(new Date(date).setHours(0,0,0,0));
}
Day.prototype.setData = function(data){
  this.config._data = data;
  this.config.data = data;
  this._datas();
}
Day.prototype.copy = function(origin){
  var arr_copy = [];
  origin.forEach(function(data){
    arr_copy.push(data);
  });
  return arr_copy;
}
Day.prototype._datas = function(){

  if (this.config._data.length == 0) {
    return;
  }

  var n = 0;
  var _arr = this.config._data;

  for (var i = 0; i < _arr.length; i++) {
    var v = _arr[i];
    v.id = i;
    v.start = new Date(v.start).getTime();
    v.end = new Date(v.end).getTime();
    v.offset = this.offsetInit(new Date(v.start).getTime());
    v.offsetEnd = this.offsetInit(new Date(v.end).getTime());
    _arr[i] = v;
  }


  var s = 'offset';
  var e = 'offsetEnd'
  var a_2 = [];
  var x = 0;
  var a = this.copy(_arr);

  for (var i = 0; i < a.length; i++) {
    var n = a[i];
    a_2[x] = [];


    for (var j = 0; j < a.length; j++) {
      var exit = false;
      if (!a) {
        exit = true;
      }
      if (!a || exit) {
      }else{
        var m = a[j];
        if (
          // (n[s] <= m[s] && n[e] >= m[s]) || 
          //
          // (n[s] <= m[e] && n[e] >= m[e])
          (n[e] < m[s])
          ) {

          a_2[x].push(a[j]);
          a[j] = false;
        }else{
        }
      }
    }
    if (a_2[x].length > 0) {
        x++;
    }
  }

  if (a_2[a_2.length-1].length == 0 ) {

    a_2.splice(a_2.length-1,1)
  }

  console.log(a_2);

  for (var i = 0; i < a_2.length; i++) {
    var _a = a_2[i];
    console.log('---------------');
    for (var j = 0; j < _a.length; j++) {
      var _c = _a[j];
      console.log(_c.offset,_c.offsetEnd);
    }
  }
//   var n = 0;
//   var _arr_dia = [];
//   var fn_arr_dia = function(v,i,_a){
//
//   };
//
//   var _arr = this.config._data.slice();
//   for (var i = 0; i < _arr.length; i++) {
//     var v = _arr[i];
//     v.id = i;
//     v.start = new Date(v.start).getTime();
//     v.end = new Date(v.end).getTime();
//     v.offset = this.offsetInit(new Date(v.start).getTime());
//     v.offsetEnd = this.offsetInit(new Date(v.end).getTime());
//     _arr[i] = v;
//   }
//
//
//   var list = _arr;
//   function groupBy( array , f )
//   {
//     var groups = {};
//     array.forEach( function( o )
//     {
//       var group = JSON.stringify( f(o) );
//       groups[group] = groups[group] || [];
//       groups[group].push( o );
//     });
//     return Object.keys(groups).map( function( group )
//     {
//       return groups[group];
//     })
//   }
//   var result = groupBy(list, function(item)
//   {
//     return [item.offset, item.offsetEnd];
//   });
//   console.log(result);
//
//
//
//
//   var Player = [
//     {
//         name: "John",
//         Events: {
//             timeList: ["7:00 AM", "9:00 AM", "12:01 PM", "2:00 PM"]
//         },
//         groups: {}
//     },
//     {
//         name: "Doe",
//         Events: {
//             timeList: ["7:00 AM", "8:00 AM", "10:00 AM", "12:01 PM"]
//         },
//         groups: {}
//     }
// ];
//
// function timeInMin(str) {
//     str = str.split(/[: ]/);
//     if (str[0] === '12') {
//         if (str[2] === 'AM') {
//             str[1] = 0;
//         }
//     } else if (str[2] === 'PM') {
//         str[0] = (+str[0]) + 12;
//     }
//     return 60 * (+str[0]) + (+str[1]);
// }
//
// function groupFactory(groups) {
//     var i = -1, last = -Infinity;
//     groups = groups || {};
//     return function addToGroup(time) {
//         var mins = timeInMin(time);
//         if (mins - last <= 2 * 60) {
//             groups[i].push(time);
//         } else {
//             ++i;
//             groups[i] = [time];
//         }
//         last = mins;
//         return groups;
//     };
// }
//
// var i, j, gf;
// for (i = 0; i < Player.length; ++i) {
//     gf = groupFactory(Player[i].groups);
//     for (j = 0; j < Player[i].Events.timeList.length; ++j) {
//         gf(Player[i].Events.timeList[j]);
//     }
// }
//
// console.log(Player);


}
Day.prototype.setDate = function(date){
  this.day.now = date;
}
Day.prototype.createHTML = function(){
  // var res = this.config.total_minutes * this.config.minute_size;
  // this.internal.table_day.style.height = res + 'px';
  this.internal.table_day.style.backgroundSize = '100% ' + this.config.cell_size + 'px';

  var a = this.day.hour_start;
  var b = this.day.hour_end;
  var c = this.diferentEndStart(a,b);//*this.config.minute_size;
  this.internal.table_day.style.height = c + 'px';
  this.internal.max_size = c;
  this.appendEvent();
};
Day.prototype.drag = function(obj){

}
Day.prototype.appendEvent = function(){

  var elements = [];
  var fn_append_event = function(_event){

    var startEvent = _event.start;
    var int_s = new Date(this.day.hour_start).getTime();
    var int_e = new Date(this.day.hour_end).getTime();
    if (startEvent >= int_s && startEvent < int_e) {
      var b = this.diferentEndStart(startEvent,_event.end)*this.config.minute_size;
      var c = this.offsetInit(startEvent)*this.config.minute_size;

      //si el tamaño de algun evento sobrepasa el tamaño del contenedor
      //se retringe el tamaño a un max_size
      var d = b + c;
      b = d > this.internal.max_size ? this.diferentEndStart(startEvent,int_e)*this.config.minute_size : b;

      var time = document.createTextNode(this.formatHour(_event.start) + ' - ' + this.formatHour(_event.end));
      var title =  document.createElement('div');
          title.className = 'event-title';
          title.appendChild(time);
      var div = document.createElement('div');
          div.appendChild(title);
          div.dataset.id = _event.id;
          div.id = 'event-' + _event.id;

      div.className = 'event';
      div.style.width = (_event.size_x*10) + '%';
      div.style.height = b + 'px';
      div.style.top = c + 'px';
      div.style.left = (_event.left*10) + '%';
      this.internal.table_day.appendChild(div);
      elements.push(div);

      var is_collision = false;
      var collisionDiv = [];
      var n = 0;
      elements.forEach(function(data){
        if (data.id != div.id) {
            is_collision = true;
            collisionDiv.push(data);
        }
      });

    }
  }

  console.log(elements);
  this.config.data.forEach(fn_append_event.bind(this));
}

Day.prototype.diferentEndStart = function (start,end) {
  return (end-start)/60000;
}
Day.prototype.offsetInit = function (start) {
  var now_init = new Date(this.day.hour_start).getTime();
  return (start-now_init)/60000;
}
Day.prototype.formatHour = function(date){
  var hour = new Date(date).getHours();
  hour = hour < 10 ? '0' + hour : hour;
  var minute = new Date(date).getMinutes();
  minute = minute < 10 ? '0' + minute : minute;
  return hour + ':' + minute;
}
Day.prototype.deleteChild = function(obj) {
        while (obj.firstChild) {
            obj.removeChild(obj.firstChild);
        }
        return obj;
    };
Day.prototype.recreate = function(date,data){
  this.deleteChild(this.internal.table_day);
  this.init(data,data);
}



var dia = new Day('dia-calendario',{
  data : [],
  date : new Date(),
  start : '00:00',
  end : '24:00',
});


window.Dia = dia;

})(window);





/*var a = [
  {a:1,b:3},
  {a:5,b:7},
  {a:7,b:9},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:10,b:23},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:19,b:22},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:12,b:13},
  {a:10,b:20},
  {a:1,b:2},
  {a:16,b:17},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
  {a:12,b:13},
  {a:1,b:2},
  {a:6,b:7},
  {a:2,b:3},
]

console.log(a.length);
var s = 'a';
var e = 'b'
var a_2 = [];
var x = 0;

for (var i = 0; i < a.length; i++) {
  var n = a[i];
  a_2[x] = [];

  for (var j = 0; j < a.length; j++) {

    var exit = false;
    if (!a) {
      exit = true;
    }
    if (!a || exit) {

    }else{
      var m = a[j];
      if (n[s] <= m[s] && n[e] >= m[e]) {

        a_2[x].push(a[j]);
        a[j] = false;

      }else{
      }
    }
  }

  if (a_2[x].length > 0) {
      x++;
  }

}

if (a_2[a_2.length-1].length == 0 ) {

  a_2.splice(a_2.length-1,1)
}
*/

(function() {

	function ConfirmBox( element, params ) {
		this.element = element;
		this.params = params || {};
		this.params.ok = params.ok || function() {};
		this.params.cancel = params.cancel || function() {};

		this.init();
	}

	ConfirmBox.prototype = {
		init: function() {
			this.instance = null;
			this.create();
			this.layout();
			this.actions();
		},
		create: function() {
		  if( document.querySelector( "#confirm-wrapper" ) === null ) {
			var wrapper = document.createElement( "div" );
				wrapper.id = "confirm-wrapper";
			var html = "<div id='confirm-box' class='col-md-12'><h2 id='confirm-header'></h2>";
        html += '<div class="form-group"><input class="form-control" placeholder="Titulo"/><input class="form-control" placeholder="Descripción"/>';
        html += '<input class="form-control" placeholder="Inicio"/><input class="form-control" placeholder="Termino"/>';
				html += "</div><div id='confirm-buttons'><button id='confirm-ok'>Agregar</button><button type='button' id='confirm-cancel'>Cancelar</button></div>";
				html += "</div>";

				wrapper.innerHTML = html;
				document.body.appendChild( wrapper );
		  }

		  this.instance = document.querySelector( "#confirm-wrapper" );
		},
		layout: function() {
			var wrapper = this.instance;
			var winHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

			wrapper.style.height = winHeight + "px";
		},
		show: function( element ) {
			element.style.display = "block";
			element.style.opacity = 1;
		},
		hide: function( element ) {
			element.style.opacity = 0;
			setTimeout(function() {
				element.style.display = "none";
			}, 300);
		},
		actions: function() {
			var self = this;
			self.element.addEventListener( "click", function() {
				self.instance.querySelector( "#confirm-header" ).innerHTML = self.element.dataset.question;
				self.show( self.instance );
			}, false);

			self.instance.querySelector( "#confirm-ok" ).
			addEventListener( "click", function() {
				self.hide( self.instance );
				setTimeout(function() {
					self.params.ok();
				}, 300);
			}, false);


			self.instance.querySelector( "#confirm-cancel" ).
			addEventListener( "click", function() {
				self.hide( self.instance );
				setTimeout(function() {
					self.params.cancel();
				}, 1000);
			}, false);
		}
	};

	window.ConfirmBox = ConfirmBox;
})();

(function() {

	document.addEventListener( "DOMContentLoaded", function() {
		var confirm = document.querySelector( "#confirm" );
		var output = document.querySelector( "#output" );
		var confBox = new ConfirmBox( confirm, {
			ok: function() {
				output.innerHTML = "OK";
			},
			cancel: function() {
				output.innerHTML = "Cancel";
			}

		});
	});

})();
