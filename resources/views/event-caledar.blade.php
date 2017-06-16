<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Hola</title>
  </head>
  <body>
    <pre id="out"></pre>
    <div id="scheduler"></div>
  </body>
  <script type="text/javascript">
  var ENV = 'ENV';
  function syntaxHighlight(json) {
    if (typeof json != 'string') {
           json = JSON.stringify(json, undefined, 2);
      }
      json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
      return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
          var cls = 'number';
          if (/^"/.test(match)) {
              if (/:$/.test(match)) {
                  cls = 'key';
              } else {
                  cls = 'string';
              }
          } else if (/true|false/.test(match)) {
              cls = 'boolean';
          } else if (/null/.test(match)) {
              cls = 'null';
          }
          return '<span class="' + cls + '">' + match + '</span>';
      });
  }
  var print = function(msg){if (ENV === 'PROD') {return true;}var text =  '> ' + msg + ' | '+ new Date() + ';\n';document.getElementById('out').innerHTML += text;}
  var info = function(msg){if (ENV === 'PROD') {return true;}var text =  '> ' + msg + ' | '+ new Date() + ';\n';document.getElementById('out').innerHTML += '<span style="color:blue">' + text + '</span>';}
  var danger = function(msg){if (ENV === 'PROD') {return true;}var text =  '> ' + msg + ' | '+ new Date() + ';\n';document.getElementById('out').innerHTML += '<span style="color:red">' + text +'</div>';}
  var print_json = function(msg){if (ENV === 'PROD') {return true;}var text =  '> ' + syntaxHighlight(msg) + ' | '+ new Date() + ';\n';document.getElementById('out').innerHTML += '<span style="color:green">' + text +'</div>';}

    var events = [
      {
        name : 'pedro',
        events : [
          {
            name : 'segundo',
            desc : 'otra tarea',
            start : '13:45',
            end : '18:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '23:45',
            end : '23:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '23:45',
            end : '23:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '11:45',
            end : '20:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '20:45',
            end : '20:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '13:44',
            end : '23:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '13:44',
            end : '23:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '13:44',
            end : '23:55',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '10:44',
            end : '23:00',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '21:15',
            end : '22:15',
          },
          {
            name : 'primero',
            desc : 'desc',
            start : '00:00',
            end : '23:59',
          },
          {
            name : 'segundo',
            desc : 'otra tarea',
            start : '12:45',
            end : '18:55',
          },
        ],
      },
      {
        name : 'juan',
        events : [],
      },
      {
        name : 'diego',
        events : [],
      },
    ]

    function compare(a,b) {
      if (a.start < b.start)
        return -1;
      if (a.end > b.end)
        return 1;
      return 0;
    }

    var sizeCont = 2359/2;
    var minutesDay = 1440;
    var minuteInitDay = 0;
    var minute = 0;

    var wEvent = 30;
    var arrMostSize = 0;
    var setInitHour = 0;
    var hour = setInitHour;
    var arrDay = [];
    for (var i = minuteInitDay; i < minutesDay; i++) {

      var hh = (hour < 10 ? '0' + hour : hour);
      var mm = (minute < 10 ? '0' + minute : minute);
      var time = hh + ':' + mm;
      // print(time);
      arrDay.push({
        start:time,
        events : [],
      });

      minute++;
      hour = minute > 59 ? ++ hour : hour;
      minute = minute > 59 ? 0 : minute;

    }
    // print_json(arrDay);

    function hhToInt(txt){
      return parseInt(txt.replace(':',''),10);
    }
    for (var i = 0; i < events.length; i++) {
      var human = events[i];
      human.orderEvent = {};
      human.events.sort(compare);
      // info(human.name);
      // for (var j = 0; j < human.events.length; j++) {
      //   var event = human.events[j];
      //   human.orderEvent[event.start.replace(':','')] = event;
      //   danger(event.name);
      // }
      // print_json(human);



        human.events.forEach(function(e,key){

          for (var i = 0; i < arrDay.length; i++) {
            var momentInDay = arrDay[i];

            if (hhToInt(e.start)+1 <= hhToInt(momentInDay.start) && hhToInt(e.end) >= hhToInt(momentInDay.start)) {
              momentInDay.events.push([]);
            }
            if (e.start == momentInDay.start) {
              // human.events.splice(1,key);
              momentInDay.events.push(e);
              // console.log(e.start , momentInDay);
            }

            // console.log(hhToInt(e.start) , hhToInt(momentInDay.start) , hhToInt(e.end) , hhToInt(momentInDay.start));

          }
        })


    }

    console.log(arrDay);

    var cont = document.getElementById('scheduler');
    cont.style.height = sizeCont + 'px';
    for (var i = 0; i < arrDay.length; i++) {
      var contEventArrDay = document.createElement('div');
      if (arrDay[i].events.length > 0) {
        for (var j = 0; j < arrDay[i].events.length; j++) {
          var event = arrDay[i].events[j];
          if (event.start) {
            console.log(j);
            var text = document.createTextNode(event.start + ' - ' + event.end);
            var size = hhToInt(event.end) - hhToInt(event.start);
            var contEvent = document.createElement('div');

            contEvent.style.top = hhToInt(event.start)/2 + 'px';
            contEvent.style.left = (j*wEvent) + 'px';
            contEvent.style.width = (wEvent) + 'px';
            contEvent.style.height = size/2 + 'px';
            contEvent.className = "event";
            contEvent.appendChild(text);
            cont.appendChild(contEvent);
          }

        }
      }else{
        //empty date
        // var contEvent = document.createElement('div');
        // contEvent.className = "empty";
        // contEvent.style.height = 1/2 + 'px';
        // contEventArrDay.appendChild(contEvent);
      }
      cont.appendChild(contEventArrDay);

    }




  </script>
  <style media="screen">
    #scheduler{
      clear: both;
      background: #cc4e4e;
      width: 2000px;
      position: relative;
    }
    #scheduler > div{
      /*display: block;
      clear: both;
      background: #03A9F4;
      border-bottom: solid 1px #c3c3c3;*/
    }
    /*#scheduler > div > div{
      width: 130px;
      float: left;
    }*/
    #scheduler > div > .empty{

    }
    #scheduler > .event{
      background: #8BC34A;
      position: absolute;
      font-size: 14px;
      border: solid 1px grey;
    }
  </style>
</html>
