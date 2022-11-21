@extends('layouts.app')

@section('content')
<div class="container custom-bg-1">
    <div class="row justify-content-start">
        @include('layouts.left-menu')
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-10 col-xl-10 col-xxl-10">
            <div class="row pt-2">
                <div class="col-12 ps-4">
                    <h1 class="display-6 mb-3">
                        <i class="bi bi-file-text"></i> Fees
                    </h1>
                    @include('session-messages')
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{route('fee.list.show')}}">Fees</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Assigned fees</li>
                        </ol>
                    </nav>
                    @if(count($feeclasses) > 0)
                    <div class="mb-4 mt-4">
                        <div class="bg-white mt-4 p-3 border shadow-sm">
                            <h3>Classes</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Fee Name</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Department</th>
                                        <th scope="col">Created at</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($feeclasses as $feeclass)
                                    <tr>
                                        <td>{{ $feeclass->fee->fee_name}}</td>
                                        <td>&#8358;{{ number_format($feeclass->fee->fee_amount,2)}}</td>
                                        <td>{{ $feeclass->classes->class_name}}</td>
                                        <td>{{ $feeclass->created_at}}</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="{{ route('fee.class.remove', ['class_id' => $feeclass->classes->id]) }}" role="button" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i>Remove</a>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                @endif
                @if(count($students) > 0)
                <div class="col-12 ps-4">
                    <div class="mb-4 mt-4">
                        <div class="bg-white mt-4 p-3 border shadow-sm">
                            <h3>Students</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Fee Name</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Student</th>
                                        <th scope="col">Created at</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($students as $student)
                                    <tr>
                                        <td>{{ $student->fee->fee_name}}</td>
                                        <td>&#8358;{{ number_format($student->fee->fee_amount,2)}}</td>
                                        <td>{{ $student->student->first_name.' '.$student->student->last_name}}</td>
                                        <td>{{ $student->created_at}}</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="{{ route('fee.student.remove', ['student_id' => $student->student->id]) }}" role="button" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i>Remove</a>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                @endif
            </div>
            @include('layouts.footer')
        </div>
    </div>
</div>
@endsection