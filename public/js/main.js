document.addEventListener("DOMContentLoaded", function(event) {

var CalendarEvent = function(){
  this.eventCalendar = document.getElementById('event-calendar');
  this.events = [];
  this.date = {};
}
//Utils
CalendarEvent.prototype.getTime = function(date){
  return new Date(date).getTime();
}

//HTML WORKERS
CalendarEvent.prototype.createEvent = function(i,arr){
  var obj =  this.events[i];
  var eventTag = document.createElement('div');
  var idTag = document.createElement('span');

  var objText = {
    id : document.createTextNode(obj.id),
    start : document.createTextNode(obj.start),
    end : document.createTextNode(obj.end),
  };

  idTag.appendChild(objText.id);
  eventTag.appendChild(idTag);
  eventTag.appendChild(objText.start);
  eventTag.appendChild(objText.end);
  this.eventCalendar.appendChild(eventTag);
}
CalendarEvent.prototype.createDayEvent = function(){
  for (var obj in this.events) {
    if (this.events.hasOwnProperty(obj)) {
      this.createEvent(obj,this.events);
    }
  }
}

//JSON DATA WORKER
CalendarEvent.prototype.setEvent = function(obj){
  return {
    id: obj.event_id,
    start: this.getTime(obj.start_date),
    end: this.getTime(obj.end_date),
  };
}

//Service XHR
CalendarEvent.prototype.getEvents = function(opt){
  //Set date
  this.setDate(opt);

  function mapEvent(obj){
    return this.setEvent(obj);
  }
  function process(response){
    var a = {};

    for (var v in response) {
      if (response.hasOwnProperty(v)) {
        var d = new Date(response[v].start_date);
        //d.setTime(1432851021000);
        //d.toDateString(); // outputs to "Thu May 28 2015"
        //d.toGMTString();
        //d.toLocaleString()
        console.log(response[v].start_date);
        console.log(d.getTime());
        console.log(d.toLocaleString());
        console.log(d.toISOString());
        a[d.toLocaleString()] = response[v];
      }
    }
    console.log(a);
    console.log(this.date.currentInit);

    var calendarOrderEvent = [];
    var cacheDate = new Date(this.date.currentInit);
    for (var i = 0; i < 97; i++) {
      var date = cacheDate;

          date = date.toISOString();
          date = date.split('.')[0];
          var b = new Date(date)
          date = b.toLocaleString();

      if (a[date]) {
        calendarOrderEvent[date] = a[date];
      }else{
        calendarOrderEvent[date] = null;
      }

      cacheDate = new Date(cacheDate.getTime()+900000);
    }
    console.log(calendarOrderEvent);


    this.events = response.map(mapEvent.bind(this));
    this.createDayEvent();
  }

  Service().getEvent(this.phpDateFormatRange('day'))
    .done(process.bind(this))
    .fail(function(response){
    console.error(response);
  });
}


// Date Method
CalendarEvent.prototype.date = {
  today : new Date().toUTCString(),
  todayInit : new Date().setHours(0,0,0,0,0),
  todayEnd : new Date().setHours(23,59,59,59),
}

CalendarEvent.prototype.setDate = function(opt){
  var date = opt.date.split('-');
  this.date.current = new Date(opt.date).toUTCString();
  this.date.currentInit = new Date(this.date.current).setUTCHours(0,0,0,0,0);
  this.date.currentEnd = new Date(this.date.current).setUTCHours(23,59,59,59);
}

CalendarEvent.prototype.phpDateFormatRange = function(type){
  if (type === 'day') {
    var i = new Date(this.date.currentInit);
    var iMonth = i.getUTCMonth()+1 < 10 ? '0' + (i.getUTCMonth()+1) : (i.getUTCMonth()+1);
    var iDay = i.getUTCDate() < 10 ? '0' + (i.getUTCDate()) : (i.getUTCDate());
    var iDate = i.getUTCFullYear() + '-' + iMonth + '-' + iDay;

    var e = new Date(this.date.currentEnd);
    var eMonth = e.getUTCMonth()+1 < 10 ? '0' + (e.getUTCMonth()+1) : (e.getUTCMonth()+1);
    var eDay = e.getUTCDate() < 10 ? '0' + (e.getUTCDate()) : (e.getUTCDate());
    var eDate = e.getUTCFullYear() + '-' + eMonth + '-' + eDay;

    return {
      start : iDate + ' 00:00:00',
      end : eDate + ' 23:59:59',
    }
  }
}

var ev = new CalendarEvent();
console.log(ev);

ev.getEvents({
  date : '2017-05-19',
});




});
