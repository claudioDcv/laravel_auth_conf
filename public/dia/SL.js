//Selector Landia js

/*
var sl = new SL('p');
sl.append([['p','dia-btn','claudio'],['p','','claudio']]);
sl.addIn(document.getElementById('calendario'));
*/

var SL = function(obj,cssClass,text){

  this.elm;
  if (obj.indexOf('input,') != -1) {
    var _obj = obj.split(',');
    obj = _obj[0];
    this.elm = document.createElement(obj);
    this.elm.name = _obj[1];
    if (text) {
      this.elm.value = text;
    }
  }else{
    this.elm = document.createElement(obj);
    if (text) {
      this.elm.appendChild(document.createTextNode(text));
    }
  }

    if(cssClass){this.elm.className = cssClass};

  return this;
}

SL.prototype.append = function (child) {
  if (child instanceof Array) {
    for (var i = 0; i < child.length; i++) {

      if (typeof child[i][0] === "string") {
          var _obj = document.createElement(child[i][0]);
          if (child[i][2]) {
              _obj.appendChild(document.createTextNode(child[i][2]));
          }
          if (child[i][1]) {
              _obj.className = child[i][1];
          }

          this.elm.appendChild(_obj);
      }else{
          this.elm.appendChild(child[i]);
      }

    }
  }else{
    this.elm.appendChild(child);
  }
  return this;
}
SL.prototype.addIn = function (obj) {
  obj.appendChild(this.elm);
  return this;
}
