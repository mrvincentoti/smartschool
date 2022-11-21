@extends('layouts.app')

@section('content')
<div class="container custom-bg-1">
    <div class="row justify-content-start">
        @include('layouts.left-menu')
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-10 col-xl-10 col-xxl-10">
            <div class="row pt-2">
                <div class="col ps-4">
                    <h1 class="display-6 mb-3">
                        <i class="bi bi-file-text"></i> Fees
                    </h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Fee</li>
                        </ol>
                    </nav>
                    <div class="mb-4 mt-4">
                        <div class="bg-white mt-4 p-3 border shadow-sm">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Fee Name</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Created at</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($fees as $fee)
                                    <tr>
                                        <td>{{$fee->fee_name}}</td>
                                        <td>&#8358;{{number_format($fee->fee_amount,2)}}</td>
                                        <td>{{$fee->created_at}}</td>
                                        <td>
                                            @php if($fee->fee_status == 1){ @endphp
                                            <span class="badge rounded-pill border" style="background-color: #0678c8;">Active</span>
                                            @php }else{ @endphp
                                            <span class="badge rounded-pill border" style="background-color: #c82806;">Not Active</span>
                                            @php } @endphp
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="{{route('fee.edit.show', ['fee_id' => $fee->id])}}" role="button" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i>Edit</a>
                                                <a href="{{route('fee.class.show', ['fee_id' => $fee->id])}}" role="button" class="btn btn-sm btn-outline-primary"><i class="bi bi-eye"></i> Assigned Classes/Students</a>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            @include('layouts.footer')
        </div>
    </div>
</div>
@endsection