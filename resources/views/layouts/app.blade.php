<html lang="{{ app()->getLocale() }}">

@php
  
    // $rtlLanguages = !empty($generalSettings['rtl_languages']) ? $generalSettings['rtl_languages'] : [];
    $authUser = Auth::user();
    $isRtl = true ;
    // $isRtl = ((in_array(mb_strtoupper(app()->getLocale()), $rtlLanguages)) or (!empty($generalSettings['rtl_layout']) and $generalSettings['rtl_layout'] == 1));
@endphp
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>{{ $pageTitle ?? '' }} </title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- General CSS File -->
    <link rel="stylesheet" href="{{   asset('/assets/admin/vendor/bootstrap/bootstrap.min.css') }}"/>
    <link rel="stylesheet" href="{{   asset('/assets/vendors/fontawesome/css/all.min.css') }}"/>
    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/toast/jquery.toast.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/css/custom.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/css/shared.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/css/shared2.css') }}">

    @stack('libraries_top')

    <link rel="stylesheet" href="{{   asset('/assets/admin/css/style.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/admin/css/custom.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/admin/css/components.css') }}">
    @if($isRtl)
        <link rel="stylesheet" href="{{   asset('/assets/admin/css/rtl.css') }}">
    @endif
    <link rel="stylesheet" href="{{   asset('/assets/admin/vendor/daterangepicker/daterangepicker.min.css') }}">

    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/sweetalert2/dist/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/daterangepicker/daterangepicker.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/bootstrap-timepicker/bootstrap-timepicker.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/select2/select2.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/default/vendors/bootstrap-tagsinput/bootstrap-tagsinput.min.css') }}">
    <link rel="stylesheet" href="{{   asset('/assets/vendors/summernote/summernote-bs4.min.css') }}">
   

    @stack('styles_top')
    @stack('scripts_top')

    <style>
        {!! !empty(getCustomCssAndJs('css')) ? getCustomCssAndJs('css') : '' !!}

        {!! getThemeColorsSettings(true) !!}
    </style>
</head>
<body class="@if($isRtl) rtl @endif">

<div id="app" class="@if ($isRtl) rtl @endif">
    <div class="main-wrapper">
        @include('includes.navbar')

        @include('partials.sidebar')


        <div class="main-content">

            @yield('content')

        </div>
    </div>

    <div class="modal fade" id="fileViewModal" tabindex="-1" aria-labelledby="fileViewModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <img src="" class="w-100" height="350px" alt="">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ trans('public.close') }}</button>
                </div>
            </div>
        </div>
    </div>

</div>

{{-- AI Contents --}}
{{-- @if(!empty(getAiContentsSettingsName("status")) and !empty(getAiContentsSettingsName("active_for_admin_panel")))
    @include('includes.aiContent.generator')
@endif --}}


<!-- General JS Scripts -->
<script src="{{ asset('/assets/admin/vendor/jquery/jquery-3.3.1.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/poper/popper.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/bootstrap/bootstrap.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/nicescroll/jquery.nicescroll.min.js') }}"></script>
<script src="{{ asset('/assets/admin/vendor/moment/moment.min.js') }}"></script>
<script src="{{ asset('/assets/admin/js/stisla.js') }}"></script>
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

<script src="{{ asset('/assets/admin/vendor/daterangepicker/daterangepicker.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/select2/select2.min.js') }}"></script>

<script src="{{ asset('/vendor/laravel-filemanager/js/stand-alone-button.js') }}"></script>
<!-- Template JS File -->
<script src="{{ asset('/assets/admin/js/scripts.js') }}"></script>

@stack('styles_bottom')
@stack('scripts_bottom')

<script>
    var deleteAlertTitle = '{{ trans('public.are_you_sure') }}';
    var deleteAlertHint = '{{ trans('public.deleteAlertHint') }}';
    var deleteAlertConfirm = '{{ trans('public.deleteAlertConfirm') }}';
    var deleteAlertCancel = '{{ trans('public.cancel') }}';
    var deleteAlertSuccess = '{{ trans('public.success') }}';
    var deleteAlertFail = '{{ trans('public.fail') }}';
    var deleteAlertFailHint = '{{ trans('public.deleteAlertFailHint') }}';
    var deleteAlertSuccessHint = '{{ trans('public.deleteAlertSuccessHint') }}';
    var forbiddenRequestToastTitleLang = '{{ trans('public.forbidden_request_toast_lang') }}';
    var forbiddenRequestToastMsgLang = '{{ trans('public.forbidden_request_toast_msg_lang') }}';
    var generatedContentLang = '{{ trans('update.generated_content') }}';
    var copyLang = '{{ trans('public.copy') }}';
    var doneLang = '{{ trans('public.done') }}';
</script>

<script src="{{ asset('/assets/admin/js/custom.js') }}"></script>
<script src="{{ asset('/assets/default/js/admin/services.js') }}"></script>


<script src="{{ asset('/assets/default/js/panel/ai-content-generator.min.js') }}"></script>

<script src="{{ asset('/assets/default/vendors/sweetalert2/dist/sweetalert2.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/feather-icons/dist/feather.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/select2/select2.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/moment.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/daterangepicker/daterangepicker.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/bootstrap-timepicker/bootstrap-timepicker.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/bootstrap-tagsinput/bootstrap-tagsinput.min.js') }}"></script>
<script src="{{ asset('/assets/vendors/summernote/summernote-bs4.min.js') }}"></script>
<script src="{{ asset('/assets/default/vendors/sortable/jquery-ui.min.js') }}"></script>
<script src="{{ asset('/assets/default/js/admin/quiz.min.js') }}"></script>
<script src="{{ asset('/assets/admin/js/webinar.min.js') }}"></script>

<script>
    {!! !empty(getCustomCssAndJs('js')) ? getCustomCssAndJs('js') : '' !!}
</script>
</body>
</html>
