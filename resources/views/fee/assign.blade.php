@extends('layouts.app')

@section('content')
<script src="{{ asset('js/masonry.pkgd.min.js') }}"></script>
<style type="text/css">
    .select2-container .select2-selection--single {
        height: 34px !important;
    }

    .select2-container--default .select2-selection--single {
        border: 1px solid #ccc !important;
        border-radius: 0px !important;
    }
</style>
<div class="container custom-bg-1">
    <div class="row justify-content-start">
        @include('layouts.left-menu')
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-10 col-xl-10 col-xxl-10">
            <div class="row pt-2">
                <div class="col ps-4">
                    <h1 class="display-6 mb-3">
                        <i class="bi bi-tools"></i> Assign Fee
                    </h1>

                    @include('session-messages')

                    <div class="mb-4">
                        <div class="row" data-masonry='{"percentPosition": true }'>
                            <div class="col-md-4 mb-4">
                                <div class="p-3 border bg-light shadow-sm">
                                    <h6>Assign to Class</h6>
                                    <form action="{{route('fee.assign.create')}}" method="POST">
                                        @csrf
                                        <input type="hidden" name="session_id" value="{{ $current_school_session_id }}">
                                        <div class="mb-3">
                                            <p class="mt-2">Fee Type:<sup><i class="bi bi-asterisk text-primary"></i></sup></p>
                                            <select class="form-select form-select-sm" name="fee_id" aria-label=".form-select-sm" required>
                                                @isset($fees)
                                                <option>Select Fee</option>
                                                @foreach ($fees as $fee)
                                                <option value="{{$fee->id}}">{{$fee->fee_name}}</option>
                                                @endforeach
                                                @endisset
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <p>Select Class:<sup><i class="bi bi-asterisk text-primary"></i></sup></p>
                                            <select class="form-select select2" aria-label="Class" name="class_id" required>
                                                @isset($classes)
                                                <option>Select Class</option>
                                                @foreach ($classes as $school_class)
                                                <option value="{{$school_class->id}}">{{$school_class->class_name}}</option>
                                                @endforeach
                                                @endisset
                                            </select>
                                        </div>
                                        <button class="btn btn-sm btn-outline-primary" type="submit"><i class="bi bi-check2"></i> Assign</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-4 mb-4">
                                <div class="p-3 border bg-light shadow-sm">
                                    <h6>Assign to Student</h6>
                                    <form action="{{route('fee.assign.student')}}" method="POST">
                                        @csrf
                                        <input type="hidden" name="session_id" value="{{ $current_school_session_id }}">
                                        <div class="mb-3">
                                            <p class="mt-2">Select Fee:<sup><i class="bi bi-asterisk text-primary"></i></sup></p>
                                            <select class="form-select form-select-sm" name="fee_id" aria-label=".form-select-sm" required>
                                                @isset($fees)
                                                <option>Select Fee</option>
                                                @foreach ($fees as $fee)
                                                <option value="{{$fee->id}}">{{$fee->fee_name}}</option>
                                                @endforeach
                                                @endisset
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <p>Select Class:<sup><i class="bi bi-asterisk text-primary"></i></sup></p>
                                            <select onchange="getStudentInClass(this);" class="form-select select2" aria-label="Class" required>
                                                @isset($classes)
                                                <option>Select Class</option>
                                                @foreach ($classes as $school_class)
                                                <option value="{{$school_class->id}}">{{$school_class->class_name}}</option>
                                                @endforeach
                                                @endisset
                                            </select>
                                        </div>
                                        <div>
                                            <p>Assign to student:<sup><i class="bi bi-asterisk text-primary"></i></sup></p>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm" id="student-in-class" name="student_id" required>

                                            </select>
                                        </div>
                                        <button type="submit" class="mt-3 btn btn-sm btn-outline-primary"><i class="bi bi-check2"></i> Assign</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('layouts.footer')
        </div>
    </div>
</div>
<script>
    function getStudentInClass(obj) {
        var class_id = obj.options[obj.selectedIndex].value;
        var url = "{{route('get.student.in.class.by.classid')}}?class_id=" + class_id
        fetch(url)
            .then((resp) => resp.json())
            .then(function(data) {
                var studentSelect = document.getElementById('student-in-class');
                studentSelect.options.length = 0;
                data.students.unshift({
                    'student': {
                        'id': 0,
                        'first_name': 'Please select a student',
                        'last_name': '',
                    }
                });

                data.students.forEach(function(student, key) {
                    studentSelect[key] = new Option(student.student.first_name + ' ' + student.student.last_name, student.student.id);
                });
            })
            .catch(function(error) {
                console.log(error);
            });
    }
</script>
<script>
    $('.select2').select2();
</script>
@endsection