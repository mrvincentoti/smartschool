<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssignedFee extends Model
{
    use HasFactory;

    protected $fillable = [
        'fee_id',
        'class_id',
        'session_id',
    ];

    public function fee()
    {
        return $this->belongsTo(Fee::class, 'fee_id');
    }

    public function classes()
    {
        return $this->belongsTo(SchoolClass::class, 'class_id');
    }
}
