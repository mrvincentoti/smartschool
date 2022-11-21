<?php

namespace App\Http\Controllers;

use App\Models\Applicant;
use App\Http\Requests\StoreApplicantRequest;
use App\Http\Requests\UpdateApplicantRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Unicodeveloper\Paystack\Facades\Paystack;
use Illuminate\Support\Facades\Redirect;

class ApplicantController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        dd('am here');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreApplicantRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreApplicantRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Applicant  $applicant
     * @return \Illuminate\Http\Response
     */
    public function show(Applicant $applicant)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Applicant  $applicant
     * @return \Illuminate\Http\Response
     */
    public function edit(Applicant $applicant)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateApplicantRequest  $request
     * @param  \App\Models\Applicant  $applicant
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateApplicantRequest $request, Applicant $applicant)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Applicant  $applicant
     * @return \Illuminate\Http\Response
     */
    public function destroy(Applicant $applicant)
    {
        //
    }

    public function registerApplicantGet()
    {
        $pageName = 'login';
        return view('applicants.register', compact('pageName'));
    }

    public function checkMatricNumber(Request $request)
    {
        if ($request->matric_number == '123456') {
            $matno = Crypt::encryptString($request->matric_number);
            return response()->json(array('code' => 200, 'msg' => $request->matric_number, 'matricNumber' => $matno), 200);
        } else {
            return response()->json(array('code' => 404, 'msg' => 'Jamb number not found in our database'), 200);
        }
    }

    public function registrationFormGet($id)
    {
        $decryptedId = Crypt::decryptString($id);
        return view('applicants.registration-form');
    }

    public function registerApplicantPost(Request $request)
    {
        //dd("e chock");
        try {
            return redirect()->route('applicant.application-summary', ['id' => 1]);
        } catch (\Exception $e) {
            return back()->withError($e->getMessage());
        }
    }

    public function applicationSummaryGet($id)
    {
        $userid = $id;
        $email = 'vinny@smartschool.dev.com';
        $amount = '15000';
        return view('applicants.application-summary', compact(['userid', 'email', 'amount']));
    }

    public function redirectToGateway(Request $request)
    {
        $reference = Paystack::genTranxRef();
        $order_id = strtotime("now");
        $new_amount = $this->checkAndConvertAmount($request->amount);

        $metaData = json_encode(
            $array = [
                'userid' => $request->userid,
                'cost' => $request->amount,
                'discount' => $request->pdis,
                'transactionid' => $reference,
            ]
        );

        $request->request->add(['callback_url' => env('APP_URL') . '/applicant/payment/callback']);
        $request->request->add(['amount' => $new_amount]);
        $request->request->add(['orderID' => $order_id]);
        $request->request->add(['reference' => $reference]);
        $request->request->add(['metadata' => $metaData]);
        try {
            return Paystack::getAuthorizationUrl()->redirectNow();
        } catch (\Exception $e) {
            return Redirect::back()->withMessage(['msg' => 'The paystack token has expired. Please refresh the page and try again.', 'type' => 'error']);
        }
    }

    public function handleGatewayCallback()
    {
        $paymentDetails = Paystack::getPaymentData();

        //dd($paymentDetails);
        return redirect()->route('applicant.payment-summary', ['id' => 1])->withMessage(['msg' => 'Payment successful', 'type' => 'success']);;
        // Now you have the payment details,
        // you can store the authorization_code in your db to allow for recurrent subscriptions
        // you can then redirect or do whatever you want
    }

    public function paymentSummaryGet($id)
    {
        return view('applicants.payment-summary');
    }

    public function checkAndConvertAmount($amount)
    {
        $final_amount = 0;
        if ($amount >= 2500) {
            $charges = (1.5 / 100) * $amount + 100;
            if ($charges > 2000) {
                $charges = 2000;
            }
            $final_amount = $amount + $charges;
        } else {
            $charges = (1.5 / 100) * $amount;
            $final_amount = $amount + $charges;
        }
        return (float)$final_amount * 100;
    }
}
