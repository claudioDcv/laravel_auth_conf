@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                  Panel de Control
                  @role('admin')
                       | Hola Admin
                  @endrole
                </div>

                <div class="panel-body">
                    @role('admin')
                    <a href="{{ route('scheduler') }}">Programador</a>
                    @endrole
                    <div id="event-calendar">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{{ asset('js/vue.min.js') }}"></script>
<script src="{{ asset('js/Ajax.js') }}"></script>
<script src="{{ asset('js/xdate.js') }}"></script>
<script src="{{ asset('js/Model.js') }}"></script>
<script src="{{ asset('js/event-calendar.js') }}"></script>
<script src="{{ asset('js/main.js') }}"></script>
@endsection
