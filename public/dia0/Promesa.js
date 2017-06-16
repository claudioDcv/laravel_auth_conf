


function Promise(){

	var self = this;
	var thenCallback = null;
	var failCallback = null;
	var alwaysCallback = null;

	self.then = function(callback){
		thenCallback = callback;
		return self;
	};

	self.error = function(callback){
		failCallback = callback;
		return self;
	};

	self.always = function(callback){
		alwaysCallback = callback;
		return self;
	};

	self.complete = function(args){
		runCallback(alwaysCallback, args);
		runCallback(thenCallback, args);
	};

	self.fail = function(args){
		runCallback(alwaysCallback, args);
		runCallback(failCallback, args);
	}

	function runCallback(callbackToRun, args){
		if (callbackToRun && typeof callbackToRun === 'function'){
			callbackToRun(args);
		}
	}
}

var p = new Promise();

p.then(function(args){
	console.log('foo has happened ' + args);
}).error(function(args){
	console.log('error has happened');
}).always(function(args){
	console.log('something has happened, good or bad');
});

p.complete(12);
p.fail();

//
// function myFunction(){
//
// 	var p = new Promise();
// 	setTimeout(p.complete(14), 1000)
//   console.log(p);
// 	return p;
// }
//
// var promise = myFunction()
// promise.then(function(args){
// 	console.log(args);
// });
