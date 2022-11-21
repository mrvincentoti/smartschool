<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fee extends Model
{
    use HasFactory;

    protected $fillable = [
        'fee_name',
        'fee_amount',
        'fee_status',
        'session_id'
    ];

    public function assignedfees()
    {
        return $this->hasMany(AssignedFee::class);
    }

    public function studentfees()
    {
        return $this->hasMany(AssignStudentFee::class);
    }
}
