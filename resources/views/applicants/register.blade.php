@extends('layouts.applicant')

@section('content')
<div class="container-fluid">
    <div class="row pt-5">
        <div class="d-flex justify-content-center">
            <div class="col-md-4 card pt-5 pb-5 px-2" style="width: 350px;">
                <div class="mb-3 text-center">
                    <img src="{{ asset('favicon_io/android-chrome-512x512.png') }}" style="width: 100px;" />
                </div>
                <form id="matric-verification-form">
                    <div class="mb-3 text-center">
                        <h3>Post-UTME Login</h3>
                    </div>
                    <div id="spinner" class="d-flex justify-content-center mb-1 hidden">
                        <div class="spinner-border text-warning" role="status">
                            <span class="sr-only"></span>
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="matric_number" placeholder="UTME Number" required>
                        <label for="matric_number">Enter your UTME Number here.</label>
                    </div>
                    <span id="invalid-feedback" class="invalid-feedback text-center">Please enter your matric number</span>
                    <button type="button" id="checkMatricNumber" class="btn btn-primary-custom col-12">Login Now</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="errorModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel">SMARTSCHOOL PORTAL Message</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Invalid Access! UTME Number not found
                Be informed that you must have completed your change of institution to Smartschool on JAMB Portal before you can gain access here. Thanks
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
@endsection