var Fecha = Clonador(Date);
Fecha.prototype.imprime = function(){
  return (this.getHours() < 10 ?
            '0' + this.getHours()
            : this.getHours()) + ":" + (this.getMinutes() < 10 ?
              '0' + this.getMinutes()
              : this.getMinutes())
}
