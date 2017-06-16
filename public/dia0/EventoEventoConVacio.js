
var Evento = function(id,start,end,bloques,data){
  this.evento = true;
  this.id = id;
  this.start = start;
  this.end = end;
  this.data = data;
  this.bloques = bloques;
}
var EventoCont = function(id,start,end,bloques,data){
  this.evento = true;
  this.id = id;
  this.start = start;
  this.end = end;
  this.data = data;
  this.bloques = bloques;
}
var Vacio = function(id,bloques,start,end){
  this.evento = false;
  this.id = id;
  this.start = start;
  this.end = end;
  this.bloques = bloques;
}
