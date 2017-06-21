@extends('admin::index')

@section('content')
    <section class="content-header">
        <h1>
            {{ $header or trans('lang.title') }}
            <small>{{ $description or trans('lang.description') }}</small>
        </h1>

    </section>

    <section class="content">

        @include('admin::partials.error')
        @include('admin::partials.success')
        @include('admin::partials.exception')
        @include('admin::partials.toastr')

        {!! $content !!}

    </section>
@endsection
