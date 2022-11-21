<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FeeSaveRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'fee_name' => 'required|string',
            'fee_amount' => 'required|integer|gt:0',
            'fee_status' => 'required|integer',
            'session_id' => 'required|integer|gt:0'
        ];
    }
}
