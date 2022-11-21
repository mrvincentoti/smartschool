<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\SchoolSession;
use App\Interfaces\SemesterInterface;
use App\Interfaces\SchoolSessionInterface;
use App\Interfaces\FeeInterface;
use App\Http\Requests\FeeSaveRequest;
use App\Http\Requests\AssignedFeeRequest;
use App\Interfaces\SchoolClassInterface;
use App\Http\Requests\AssignStudentFeeRequest;


class FeeController extends Controller
{
    use SchoolSession;

    protected $schoolClassRepository;
    protected $semesterRepository;
    protected $schoolSessionRepository;
    protected $feeRepository;

    public function __construct(
        SchoolSessionInterface $schoolSessionRepository,
        SemesterInterface $semesterRepository,
        FeeInterface $feeRepository,
        SchoolClassInterface $schoolClassRepository
    ) {
        $this->schoolSessionRepository = $schoolSessionRepository;
        $this->semesterRepository = $semesterRepository;
        $this->feeRepository = $feeRepository;
        $this->schoolClassRepository = $schoolClassRepository;
    }

    public function index()
    {
        $current_school_session_id = $this->getSchoolCurrentSession();
        $fees = $this->feeRepository->getAll($current_school_session_id);
        $data = [
            'fees' => $fees,
        ];
        return view('fee.index', $data);
    }

    public function create()
    {
        $current_school_session_id = $this->getSchoolCurrentSession();
        $semesters = $this->semesterRepository->getAll($current_school_session_id);

        $data = [
            'current_school_session_id' => $current_school_session_id,
            'semesters'                 => $semesters,
        ];
        return view('fee.create', $data);
    }

    public function store(FeeSaveRequest $request)
    {
        try {
            $this->feeRepository->create($request->validated());
            return back()->with('status', 'Fee creation was successful!');
        } catch (\Exception $e) {
            return back()->withError($e->getMessage());
        }
    }

    public function assign()
    {
        $current_school_session_id = $this->getSchoolCurrentSession();
        $fees = $this->feeRepository->getAll($current_school_session_id);

        $school_classes = $this->schoolClassRepository->getAllBySession($current_school_session_id);
        $data = [
            'fees' => $fees,
            'classes' => $school_classes,
            'current_school_session_id' => $current_school_session_id
        ];
        return view('fee.assign', $data);
    }

    public function assignfee(AssignedFeeRequest $request)
    {
        try {
            $this->feeRepository->assign($request->validated());
            return back()->with('status', 'Fee assignment was successful!');
        } catch (\Exception $e) {
            return back()->withError('Fee already assigned to the selected class');
        }
    }

    public function assignstudent(AssignStudentFeeRequest $request)
    {
        try {
            $this->feeRepository->assignStudent($request->validated());
            return back()->with('status', 'Fee assignment was successful!');
        } catch (\Exception $e) {
            return back()->withError($e->getMessage());
        }
    }

    public function feeclasses(Request $request)
    {
        $feeClasses = $this->feeRepository->getClassAssingToFee($request->query('fee_id'));
        $students = $this->feeRepository->getStudentAssignToFee($request->query('fee_id'));
        $data = [
            'feeclasses' => $feeClasses,
            'students' => $students
        ];
        return view('fee.class', $data);
    }

    public function edit(Request $request)
    {
        $current_school_session_id = $this->getSchoolCurrentSession();
        $fee = $this->feeRepository->getFee($request->query('fee_id'));
        $data = [
            'current_school_session_id' => $current_school_session_id,
            'fee' => $fee
        ];
        return view('fee.edit', $data);
    }

    public function update(Request $request)
    {
        try {
            $feeRepository = $this->feeRepository->update($request);
            return back()->with('status', 'Fee update was successful!');
        } catch (\Exception $e) {
            return back()->withError($e->getMessage());
        }
    }

    public function removeclassfromfee(Request $request)
    {
        try {
            $this->feeRepository->remove($request->query('class_id'));
            return back()->with('status', 'Fee removed successful!');
        } catch (\Exception $e) {
            return back()->withError($e->getMessage());
        }
    }

    public function removestudentfromfee(Request $request)
    {
        try {
            $this->feeRepository->removeStudentFee($request->query('student_id'));
            return back()->with('status', 'Fee removed successfully!');
        } catch (\Exception $e) {
            return back()->withError($e->getMessage());
        }
    }
}
