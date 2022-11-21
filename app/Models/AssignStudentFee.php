<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssignStudentFee extends Model
{
    use HasFactory;

    protected $fillable = [
        'fee_id',
        'class_id',
        'session_id',
        'student_id',
    ];

    public function fee()
    {
        return $this->belongsTo(Fee::class, 'fee_id');
    }

    public function student()
    {
        return $this->belongsTo(User::class, 'student_id');
    }
}
