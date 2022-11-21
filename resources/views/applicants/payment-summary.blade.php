@extends('layouts.app')

@section('content')
<div class="container mb-5" style="border: 1px solid #ccc; background: #fff;">
    <div class="row justify-content-start">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12">
            <div class="row pt-2">
                <div class="col ps-4">
                    <h1 class="display-6 mb-3 d-none d-sm-block text-center">
                        <i class="bi bi-person-lines-fill"></i> Payment details
                    </h1>
                    @include('session-messages')
                    <div class="mb-4">
                        <div class="px-5 pt-2 text-center">
                            <img src="{{asset('imgs/success.png')}}" class="rounded-3 card-img-top" alt="Profile photo" style="width:100px;">
                            <br />
                            <p>You have successfully submitted your application. You will be contacted shortly</p>
                        </div>
                    </div>
                </div>
                @include('layouts.footer')
            </div>
        </div>
    </div>
    @endsection