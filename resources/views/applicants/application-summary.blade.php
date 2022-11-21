@extends('layouts.app')

@section('content')
<div class="container mb-5" style="border: 1px solid #ccc; background: #fff;">
    <div class="row justify-content-start">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12">
            <div class="row pt-2">
                <div class="col ps-4">
                    <h1 class="display-6 mb-3 d-none d-sm-block">
                        <i class="bi bi-person-lines-fill"></i> Application Summary
                    </h1>
                    <p style="color: red;"><b>Please, note that your application will only be considered after paying your application fee</b></p>
                    <div class="mb-4">
                        <div class="row">
                            <div class="col-sm-4 col-md-3">
                                <div class="card bg-light">
                                    <div class="px-5 pt-2">
                                        @if (isset($student->photo))
                                        <img src="{{asset('/storage'.$student->photo)}}" class="rounded-3 card-img-top" alt="Profile photo">
                                        @else
                                        <img src="{{asset('imgs/profile.png')}}" class="rounded-3 card-img-top" alt="Profile photo" style="width:100px;">
                                        @endif
                                    </div>
                                    <div class="card-body d-none d-sm-block">
                                        <h5 class="card-title">Vincent Oti</h5>
                                        <p class="card-text">#ID: 2022-1-1-0</p>
                                    </div>
                                    <ul class="list-group list-group-flush d-none d-sm-block">
                                        <li class="list-group-item">Gender: Male</li>
                                        <li class="list-group-item">Phone: 09087898767</li>
                                        {{-- <li class="list-group-item"><a href="#">View Marks &amp; Results</a></li> --}}
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-8 col-md-9">
                                <div class="p-3 mb-3 border rounded bg-white">
                                    <h6>Student Information</h6>
                                    <table class="table table-responsive mt-3">
                                        <tbody>
                                            <tr>
                                                <th scope="row">First Name:</th>
                                                <td>Vincent</td>
                                                <th>Last Name:</th>
                                                <td>Oti</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email:</th>
                                                <td>vinny@smartschool.dev.com</td>
                                                <th>Birthday:</th>
                                                <td>2022-04-21</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Nationality:</th>
                                                <td>Nigerian</td>
                                                <th>Religion:</th>
                                                <td>Christianity</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Address:</th>
                                                <td>Rocky Villa Eneje</td>
                                                <th>Address2:</th>
                                                <td>3 Gwani street</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">City:</th>
                                                <td>Abuja</td>
                                                <th>Zip:</th>
                                                <td>9000123</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Blood Type:</th>
                                                <td>0+</td>
                                                <th>Phone:</th>
                                                <td>08978767656</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender:</th>
                                                <td colspan="3">Male</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="p-3 mb-3 border rounded bg-white">
                                    <h6>Parents' Information</h6>
                                    <table class="table table-responsive mt-3">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Father's Name:</th>
                                                <td>Vincent Oti</td>
                                                <th>Mother's Name:</th>
                                                <td>Amen Shie</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Father's Phone:</th>
                                                <td>08987678767</td>
                                                <th>Mother's Phone:</th>
                                                <td>09087876765</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Address:</th>
                                                <td colspan="3">3 Gwani street, zone 4, Abuja</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="p-3 mb-3 border rounded bg-white">
                                    <h6>Academic Information</h6>
                                    <table class="table table-responsive mt-3">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Faculty:</th>
                                                <td>Science</td>
                                                <th>Board Reg. No.:</th>
                                                <td>12345678</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Department:</th>
                                                <td colspan="3">Computer Science</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="p-3 mb-3 border rounded bg-white">
                                    <button type="button" id="showPayModal" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmPay">Pay Application Fee</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @include('layouts.footer')
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="confirmPay" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="confirmPayLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmPayLabel">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="{{ route('applicant.pay') }}">
                    @csrf()
                    <div class="modal-body">
                        You are about to pay a non-refundable application fee of <b><span class="badge" style="background-color: red; font-size: 18px;">N15,000.00</span></b>. Click the "Understood" button to submit your application.
                        <div class="mb-3">
                            <input type="hidden" class="form-control" value="{{ $userid }}" name="userid">
                            <input type="hidden" class="form-control" value="{{ $email }}" name="email">
                            <input type="hidden" class="form-control" value="{{ $amount }}" name="amount">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Understood</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @endsection