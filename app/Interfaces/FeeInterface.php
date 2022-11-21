<?php

namespace App\Interfaces;

interface FeeInterface
{
    public function create($request);

    public function getAll($session_id);

    public function assign($request);

    public function assignStudent($request);

    public function getClassAssingToFee($feeid);

    public function getStudentAssignToFee($feeid);

    public function getFee($feeid);

    public function update($request);

    public function remove($request);

    public function removeStudentFee($student_id);
}
