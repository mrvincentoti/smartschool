<?php

namespace App\Repositories;

use App\Interfaces\FeeInterface;
use App\Models\Fee;
use App\Models\AssignedFee;
use App\Models\AssignStudentFee;

class FeeRepository implements FeeInterface
{
    public function create($request)
    {
        try {
            Fee::create($request);
        } catch (\Exception $e) {
            throw new \Exception('Failed to create fee. ' . $e->getMessage());
        }
    }

    public function getAll($session_id)
    {
        return Fee::where('session_id', $session_id)->get();
    }

    public function assign($request)
    {
        try {
            AssignedFee::create($request);
        } catch (\Exception $e) {
            throw new \Exception('Failed to assign fee. ' . $e->getMessage());
        }
    }

    public function assignStudent($request)
    {
        try {
            AssignStudentFee::create($request);
        } catch (\Exception $e) {
            throw new \Exception('Failed to assign fee. ' . $e->getMessage());
        }
    }

    public function getClassAssingToFee($fee_id)
    {
        try {
            return AssignedFee::with(['classes', 'fee'])
                ->where('fee_id', $fee_id)
                ->get();
        } catch (\Exception $e) {
            throw new \Exception('Failed to get assign fee. ' . $e->getMessage());
        }
    }

    public function getStudentAssignToFee($fee_id)
    {
        try {
            return AssignStudentFee::with(['student', 'fee'])
                ->where('fee_id', $fee_id)
                ->get();
        } catch (\Exception $e) {
            throw new \Exception('Failed to get assign fee. ' . $e->getMessage());
        }
    }

    public function getFee($id)
    {
        return Fee::where('id', $id)->get()->first();
    }

    public function update($request)
    {
        try {
            Fee::where('id', $request->fee_id)->update([
                'fee_name'   => $request->fee_name,
                'fee_amount'    => $request->fee_amount,
                'fee_status'   => $request->fee_status
            ]);
        } catch (\Exception $e) {
            throw new \Exception('Failed to update fee. ' . $e->getMessage());
        }
    }

    public function remove($class_id)
    {
        try {
            AssignedFee::where('class_id', $class_id)->delete();
        } catch (\Exception $e) {
            throw new \Exception('Failed to remove fee. ' . $e->getMessage());
        }
    }

    public function removeStudentFee($student_id)
    {
        try {
            AssignStudentFee::where('student_id', $student_id)->delete();
        } catch (\Exception $e) {
            throw new \Exception('Failed to remove fee. ' . $e->getMessage());
        }
    }
}
