<body>
  <div id="app">
    <nav>
      <ul>
        @role('admin')
        <li><a href="{{ route('event.create') }}">Programador</a></li>
        <li><a href="{{ route('register') }}">Nuevo Usuario</a></li>
        <li><a href="{{ route('event.index') }}">Programación</a></li>
        @endrole
        @role('admin|reservation')
        <li><a href="{{ route('users') }}">Lista de Usuarios</a></li>
        @endrole
          <!-- Authentication Links -->
          @if (Auth::guest())
              <li><a href="{{ route('login') }}">Login</a></li>
              <li><a href="{{ route('register') }}">Registrarce</a></li>
          @else
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                      {{ Auth::user()->name }} <span class="caret"></span>
                  </a>

                  <ul class="dropdown-menu" role="menu">
                      <li>
                          <a href="{{ route('logout') }}"
                              onclick="event.preventDefault();
                                       document.getElementById('logout-form').submit();">
                              Logout
                          </a>

                          <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                              {{ csrf_field() }}
                          </form>
                      </li>
                  </ul>
              </li>
          @endif
      </ul>
    </nav>

  </div>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Lato:100" rel="stylesheet" type="text/css">
  <script src="{!! asset('library/moment-with-locales.js') !!}" charset="utf-8"></script>
  <script src="{!! asset('library/tether-1.3.3/dist/js/tether.min.js') !!}" charset="utf-8"></script>
  <script src="{!! asset('library/jquery-3.1.1.min.js') !!}" charset="utf-8"></script>
  <script src="{!! asset('library/bootstrap/js/bootstrap.min.js') !!}" charset="utf-8"></script>
  <link rel="stylesheet" href="{!! asset('library/bootstrap/css/bootstrap.min.css') !!}">
  <link rel="stylesheet" href="{!! asset('library/tether-1.3.3/dist/css/tether.min.css') !!}">
<link rel="stylesheet" href="{!! asset('dia/Dia.css')!!}">
<script type="text/javascript">
  var base_url = "{!! URL::to('/') !!}";
  var csrf_field = '{{ csrf_token() }}';
</script>

<div id="new-day"></div>
<div class="" id="dia-calendario_"></div>
<div id="calendario"></div>
<div id="output"></div>
<div class="" id="btn-container">
  <button type="button" id="confirm" class="btn btn-default" data-question="Nuevo Evento" class="button">Agregar Evento</button>
</div>

<link rel="stylesheet" href="{!! asset('library/tingle-master/dist/tingle.min.css')!!}">
<script src="{!! asset('dia/XHR.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/Clonador.js')!!}" charset="utf-8"></script>

<script src="{!! asset('library/tingle-master/dist/tingle.min.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/dia_new.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/SL.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/Mascara.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/Fecha.js')!!}" charset="utf-8"></script>

<script src="{!! asset('dia/EventoEventoConVacio.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/Calendario.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/ControladorHTML.js')!!}" charset="utf-8"></script>
<script src="{!! asset('dia/main.js')!!}" charset="utf-8"></script>
<style media="screen">
#calendario .calendar-container-table {
  top: 62px;
  left: 0px;
}
#new-day{
  background: white;
  margin-top: 1px;
}

.calendar-container{
  border: solid 1px #cccccc;
  background: white;
}
body{
  background-color: #f5f8fa;
}

/* CSS Document */

h1 {
	font-size: 60px;
	text-align: center;
	color: #FFF;
}

h3 {
	font-size: 30px;
	text-align: center;
	color: #FFF;
}

h3 a {
	color: #FFF;
}

a {
	color: #FFF;
}


p {
	text-align: center;
}

nav {
  margin: 0 0 11px 0;
  background-color: #fff;
  border: #d3e0e9 solid 1px;
}

nav ul {
	padding: 0;
  margin: 0;
	list-style: none;
	position: relative;
	}

nav ul li {
	display:inline-block;
	background-color: #ffffff;
	}

nav a {
	display:block;
  padding-top: 14px;
  padding-bottom: 14px;
	font-size:14px;
	line-height: 22px;
	text-decoration:none;
  color: #777;
}

nav a:hover {
  color: #000000;
  text-decoration: none;
}

/* Hide Dropdowns by Default */
nav ul ul {
	display: none;
	position: absolute;
	top: 60px; /* the height of the main nav */
}

/* Display Dropdowns on Hover */
nav ul li:hover > ul {
	display:inherit;
}

/* Fisrt Tier Dropdown */
nav ul ul li {
	width:170px;
	float:none;
	display:list-item;
	position: relative;
}

/* Second, Third and more Tiers	*/
nav ul ul ul li {
	position: relative;
	top:-60px;
	left:170px;
}


/* Change this in order to change the Dropdown symbol */
li > a:after { content:  ' +'; }
li > a:only-child:after { content: ''; }

.dropdown-menu{
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 1000;
  padding: 5px 10px;
  margin: 0;
  font-size: 1rem;
  color: #292b2c;
  text-align: left;
  list-style: none;
  background-color: #fff;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  border: 1px solid rgba(0,0,0,.15);
  border-top: none;
}

/* CSS EVENT */
/*#new-day > div > div > div:hover{
  min-height: 100px;
  z-index: 2;
  box-shadow: 1px 1px 10px 0px rgba(0, 0, 0, 0.5)!important;
  color: #080808;
  background: white !important;
  border: solid 1px #212121;
  border-radius: 4px;
}*/
.event-link{
  position: absolute;
  top: 4px;
  right: 4px;
  background: #ffffff;
  font-size: 9px;
  width: 16px;
  text-align: center;
  height: 16px;
  line-height: 11px;
  text-decoration: none;
  border: solid 1px #3a3a3a;
  color: #1f2c31;
  border-radius: 30%;
}
.modal-editor{
  z-index: 4;
  width: 100%;
  position: fixed;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.86);
}
.modal-editor > div{
  width: 450px;
  position: absolute;
  margin: auto;
  height: 500px;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  box-shadow: 5px 7px 13px 1px #191919;
  background: rgb(255, 255, 255);
  border-radius: 5px;
  overflow: hidden;
}
.modal-editor > div input{
  display: block;
  background: white;
  padding: 5px 10px;
  width: 100%;
  border: solid 1px #868686;
  border-radius: 5px;
  margin: 0 0 10px 0;
}
.modal-editor > div > div{
  padding: 15px;
}
.modal-editor-footer{
  position: absolute;
  bottom: 0;
  padding: 15px;
  background: white;
  left: 0;
  right: 0;
  border-top: solid 1px #868686;
}
.modal-editor-footer button{
  background: white;
  border-radius: 4px;
  border: solid 1px #2196F3;
  padding: 5px 15px;
}
.modal-editor-footer button:hover{
  background: #fbfbfb;
  border: solid 1px #13558a;
  padding: 5px 15px;
  box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.25);
}
</style>
</body>
