<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ asset('admin/css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('common/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cms/css/style.css') }}">
    <script src="{{ asset('common/js/jquery.min.js') }}"></script>
    <style>
    </style>
</head>
<body>
    <div id="app">
        @include('cms.layouts.nav')
        @yield('content')
    </div>
    @include('cms.layouts.footer')
</body>
</html>
