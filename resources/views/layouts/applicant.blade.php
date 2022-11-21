<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Smartschool') }}</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Smartschool') }}</title>

    <link rel="shortcut icon" href="{{asset('favicon_io/favicon.ico')}}">
    <link rel="shortcut icon" sizes="16x16" href="{{asset('favicon_io/favicon-16x16.png')}}">
    <link rel="shortcut icon" sizes="32x32" href="{{asset('favicon_io/favicon-32x32.png')}}">
    <link rel="apple-touch-icon" href="{{asset('favicon_io/apple-touch-icon.png')}}">
    <link rel="icon" href="{{asset('favicon_io/android-chrome-192x192.png')}}" sizes="192x192">
    <link rel="icon" href="{{asset('favicon_io/android-chrome-512x512.png')}}" sizes="512x512">

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
    <!-- <script src="{{ asset('js/app.js') }}" defer></script> -->

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">


    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
</head>

<body class="@php if(isset($pageName)){ if($pageName == 'login'){ echo 'custom-bg'; } }@endphp">

    <div id="app">
        <main>
            @yield('content')
        </main>
    </div>

    <script type="text/javascript">
        $("#checkMatricNumber").click(function(e) {
            e.preventDefault();
            let _token = $('meta[name="csrf-token"]').attr('content');
            if ($('#matric_number').val() == "") {
                //alert('Some fields are empty');
                $("#matric_number").css('border', '1px solid red');
                $("#invalid-feedback").css('display', 'block');
                return false;
            }
            $("#matric_number").css('border', '1px solid #ced4da');
            $("#invalid-feedback").css('display', 'none');
            var matricNumber = $('#matric_number').val();
            $.ajax({
                url: "{{ url('/applicant/check-matric-number') }}",
                method: 'get',
                data: {
                    matric_number: $('#matric_number').val(),
                    data: '_token = <?php echo csrf_token() ?>',
                },
                beforeSend: function() {
                    $('#spinner').removeClass('hidden');
                },
                success: function(result) {
                    if (result.code == 404) {
                        $('#errorModal').modal('show');
                    } else {
                        let a = '123';
                        window.location = '/applicant/registration-form/' + result.matricNumber;
                    }
                },
                complete: function() {
                    $('#spinner').addClass('hidden');
                }
            });
        });
    </script>
</body>

</html>