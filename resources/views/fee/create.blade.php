@extends('layouts.app')

@section('content')
<div class="container custom-bg-1">
    <div class="row justify-content-start">
        @include('layouts.left-menu')
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-10 col-xl-10 col-xxl-10">
            <div class="row pt-2">
                <div class="col ps-4">
                    <h1 class="display-6 mb-3"><i class="bi bi-file-plus"></i> Create Fee</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Create Fee</li>
                        </ol>
                    </nav>
                    @include('session-messages')
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <div class="p-3 border bg-light shadow-sm">
                                <form action="{{route('fee.create')}}" method="POST">
                                    @csrf
                                    <input type="hidden" name="session_id" value="{{$current_school_session_id}}">
                                    <div class="mt-2">
                                        <p>Fee name<sup><i class="bi bi-asterisk text-primary"></i></sup></p>
                                        <input type="text" class="form-control" name="fee_name" placeholder="Application fee, Medical fee, Mid term fee, Final, ..." aria-label="Application fee, Medical fee, Mid term fee, Final, ...">
                                    </div>
                                    <div class="mt-2">
                                        <label for="inputStarts" class="form-label">Amount<sup><i class="bi bi-asterisk text-primary"></i></sup></label>
                                        <input type="text" class="form-control" name="fee_amount" placeholder="N0.00">
                                    </div>
                                    <div class="mt-2">
                                        <label for="inputEnds" class="form-label">Status<sup><i class="bi bi-asterisk text-primary"></i></sup></label>
                                        <select class="form-select" name="fee_status">
                                            <option value="1">Active</option>
                                            <option value="2">Not Active</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="mt-3 btn btn-sm btn-outline-primary"><i class="bi bi-check2"></i> Create</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('layouts.footer')
        </div>
    </div>
</div>
@endsection