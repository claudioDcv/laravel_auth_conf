/* Principal library Ajax */
/*

Ajax({
  method: 'get',
  url: '',
  response: 'json',
}).done(function(response){

}).fail(function(response){

});


*/
var Ajax = {
    request: function(ops) {
        if(typeof ops == 'string') ops = { url: ops };
        ops.url = ops.url || '';
        ops.method = ops.method || 'get'
        ops.data = ops.data || {};

        var getParams = function(data, url) {

            if (ops.dont_convert) {
              return 'data='+encodeURIComponent(data);
            }

            if (data instanceof FormData) {
              return data;
            }

            if (ops.request === 'json') {
                var d = JSON.stringify(data);
                return d;
            }

            var arr = [], str;
            for(var name in data) {
                arr.push(name + '=' + encodeURIComponent(data[name]));
            }
            str = arr.join('&');
            if(str != '') {
                return url ? (url.indexOf('?') < 0 ? '?' + str : '&' + str) : str;
            }
            return '';
        }
        var api = {
            host: {},
            process: function(ops) {

                var self = this;
                var showError503 = false;
                var showError409 = false;
                var showError404;
                var second = 30;
                this.xhr = null;
                if(window.ActiveXObject) { this.xhr = new ActiveXObject('Microsoft.XMLHTTP'); }
                else if(window.XMLHttpRequest) { this.xhr = new XMLHttpRequest(); }
                if(this.xhr) {
                    this.xhr.timeout = second*1000;

                    this.xhr.ontimeout = function (e) {
                      // XMLHttpRequest timed out. Do something here.
                      self.xhr.abort();
                      console.info('Han pasado mas de 30 segundos sin responder el servicio: ' + self.xhr.status);
                    };

                    this.xhr.onreadystatechange = function() {
                        if (!showError503 && self.xhr.status == 503) {
                          self.errorUnavailable(self.xhr.status);
                          showError503 = true;
                        }
                        if (!showError409 && self.xhr.status == 409) {
                          self.errorConflict(self.xhr.status);
                          showError409 = true;
                        }
                        if (!showError404 && self.xhr.status == 404) {
                          // self.errorUnavailable(self.xhr.status);
                          showError404 = true;
                          console.log('Error al XHR a: ' + ops.url +', contacte con administrador');
                        }
                        if(self.xhr.readyState == 4 && ((self.xhr.status == 200  || self.xhr.status == 201 || self.xhr.status == 204)|| self.xhr.status == ops.status)) {
                            var result = self.xhr.responseText;
                            if(ops.response === 'json' && typeof JSON != 'undefined') {
                                result = result ? JSON.parse(result) : '';
                            }
                            self.doneCallback && self.doneCallback.apply(self.host, [result, self.xhr]);
                        } else if(self.xhr.readyState == 4) {

														try {
	                            self.failCallback && self.failCallback.apply(self.host, [self.xhr]);
														} catch (e) {
															if (self.xhr.status.toString().indexOf('5' == 0)) {
																console.log(e,'Error de servidor 500');
																return
															}
															console.log(e,self.xhr);
															return
														} finally {

														}

                        }
                        self.alwaysCallback && self.alwaysCallback.apply(self.host, [self.xhr]);
                    }
                }


                if(ops.method == 'get') {
                    this.xhr.open("GET", ops.url + getParams(ops.data, ops.url), true);
                } else {
                    this.xhr.open(ops.method, ops.url, true);
										//Config to Django Form
                    this.setHeaders({
                        'X-Requested-With': 'XMLHttpRequest',
                    });
                    if (!ops.dataToJson) {
                        this.setHeaders({
                            'Content-type': 'application/x-www-form-urlencoded',
                        })
                    }else{
                        this.setHeaders({
                            'Content-type': 'application/json',
                        })
                    }
										//Header to JWT

                }

                if(ops.headers && typeof ops.headers == 'object') {
                    this.setHeaders(ops.headers);
                }
                setTimeout(function() {
                      ops.method == 'get' ? self.xhr.send() : self.xhr.send(getParams(ops.data));
                }, 20);
                return this;
            },
            uploadStart : function(callback){
              this.xhr.upload.onloadstart = callback;
              return this;
            },
            uploadEnd : function(callback){
              this.xhr.upload.onloadend = callback;
              return this;
            },
            uploading : function(callback){
              this.xhr.upload.onprogress = callback;
              return this;
            },
            done: function(callback) {
                this.doneCallback = callback;
                return this;
            },
            fail: function(callback) {
                this.failCallback = callback;
                return this;
            },
            always: function(callback) {
                this.alwaysCallback = callback;
                return this;
            },
            setHeaders: function(headers) {
                for(var name in headers) {
                    this.xhr && this.xhr.setRequestHeader(name, headers[name]);
                }
            },
            unavailable : function(callback){
              this.errorUnavailable = callback;
              return this;
            },
            conflict : function(callback){
              this.errorConflict = callback;
              return this;
            }
        }
        return api.process(ops);
    }
}
