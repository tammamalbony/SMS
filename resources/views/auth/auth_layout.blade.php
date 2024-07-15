<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
@php
    $rtlLanguages = !empty($generalSettings['rtl_languages']) ? $generalSettings['rtl_languages'] : [];

    $isRtl = ((in_array(mb_strtoupper(app()->getLocale()), $rtlLanguages)) or (!empty($generalSettings['rtl_layout']) and $generalSettings['rtl_layout'] == 1));
@endphp

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>{{ $pageTitle ?? '' }}</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- General CSS File -->
    <link rel="stylesheet" href="{{   asset('/assets/admin/vendor/bootstrap/bootstrap.min.css') }}"/>
    <link rel="stylesheet" href="{{   asset('/assets/vendors/fontawesome/css/all.min.css') }}"/>
    <link rel="stylesheet" href="{{   asset('/assets/admin/vendor/daterangepicker/daterangepicker.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/admin/css/style.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/admin/css/components.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/css/custom.css') }}">
    @if($isRtl)
        <link rel="stylesheet" href="{{   asset('/assets/admin/css/rtl.css') }}">
        <link rel="stylesheet" href="{{   asset('/assets/default/css/rtl-custom.css') }}">
    @endif
    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/toast/jquery.toast.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/admin/css/custom.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/css/shared.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/css/shared2.css') }}">
</head>
<body class="@if($isRtl) rtl @endif">

<div id="app">
    @php
        $getPageBackgroundSettings = getPageBackgroundSettings();
    @endphp

    <section class="section  bg-card">
        <div class="d-flex flex-wrap align-items-stretch">
            <div class="col-lg-4 col-md-6 col-12 order-lg-1 min-vh-100 order-2 bg-white">

                @yield('content')

            </div>

            <div class="col-lg-8 col-12 order-lg-2 order-1 min-vh-100 background-walk-y position-relative overlay-gradient-bottom" data-background="{{ $getPageBackgroundSettings['admin_login'] ?? '' }}">
            <div class="absolute-bottom-left index-2">
          
          </div>
            </div>

        </div>
    </section>
</div>
<!-- General JS Scripts -->
<script src="{{ asset('/assets/admin/vendor/jquery/jquery-3.3.1.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/poper/popper.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/bootstrap/bootstrap.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/nicescroll/jquery.nicescroll.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/moment/moment.min.js') }}"></script>
<script src="{{ asset('/assets/admin/js/stisla.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/daterangepicker/daterangepicker.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/toast/jquery.toast.min.js') }}"></script>

<script>
    (function () {
        "use strict";

        window.csrfToken = $('meta[name="csrf-token"]');
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        window.adminPanelPrefix = '{{ getAdminPanelUrl() }}';

        @if(session()->has('toast'))
        $.toast({
            heading: '{{ session()->get('toast')['title'] ?? '' }}',
            text: '{{ session()->get('toast')['msg'] ?? '' }}',
            bgColor: '@if(session()->get('toast')['status'] == 'success') #43d477 @else #f63c3c @endif',
            textColor: 'white',
            hideAfter: 10000,
            position: 'bottom-right',
            icon: '{{ session()->get('toast')['status'] }}'
        });
        @endif
    })(jQuery);
</script>

<!-- Template JS File -->
<script src="{{ asset('/assets/admin/js/scripts.js') }}"></script>
<script src="{{ asset('/assets/admin/js/custom.js') }}"></script>

</body>
</html>
