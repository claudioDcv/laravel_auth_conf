<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Home') }}</title>

    <!-- Styles -->
    <!-- <link rel="stylesheet" href="{{ asset('dhtmlxScheduler_v4.4.0/codebase/dhtmlxscheduler.css') }}" type="text/css"> -->
    <link rel="stylesheet" href="{{ asset('font-awesome-4.7.0 2/css/font-awesome.min.css') }}">
    <link href="{{ asset('bootstrap-3.3.7-dist/css/bootstrap.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('datetimepicker/css/bootstrap-datetimepicker.css') }}">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!-- Branding Image -->
                    <a class="navbar-brand" href="{{ url('/') }}">
                        {{ config('app.name', 'Home') }}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav">
                      @role('admin')
                      <li><a href="{{ route('event.create') }}">Programador</a></li>
                      <li><a href="{{ route('register') }}">Nuevo Usuario</a></li>
                      @endrole
                      <li><a href="{{ route('event.index') }}">Programación</a></li>
                      @role('admin|reservation')
                      <li><a href="{{ route('users') }}">Lista de Usuarios</a></li>
                      @endrole
                      @role('client')
                      <li><a href="{{ route('my-hh') }}">Mis Horarios/Cliente</a></li>
                      @endrole
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
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
                </div>
            </div>
        </nav>

        @yield('content')
    </div>

    <!-- Scripts -->
    <script type='text/javascript' src="{{ asset('date.js') }}"></script>
    <script type='text/javascript' src="{{ asset('jquery-2.0.0.js') }}"></script><!-- jquery-week-calendar-master/libs/jquery-1.4.4.min.js-->
    <script src="{{ asset('function.js') }}" charset="utf-8"></script>
    <script type='text/javascript' src="{{ asset('jquery-ui-1.12.1 2/jquery-ui.js') }}"></script><!-- jquery-week-calendar-master/libs/jquery-ui-1.8.11.custom.min.js-->
    <script src="{{ asset('library/moment-with-locales.js') }}" charset="utf-8"></script>
    <script src="{{ asset('datetimepicker/js/bootstrap-datetimepicker.min.js') }}" charset="utf-8"></script>
    <script src="{{ asset('bootstrap-3.3.7-dist/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('main.js') }}" charset="utf-8"></script>
    <!-- <script src="{{ asset('dhtmlxScheduler_v4.4.0/codebase/dhtmlxscheduler.js') }}" type="text/javascript"></script> -->
    @yield('scripts')
</body>
</html>
