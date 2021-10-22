<?php

namespace App\Traits;

use Carbon\Carbon;

/*
|--------------------------------------------------------------------------
| Api Responser Trait
|--------------------------------------------------------------------------
|
| This trait will be used for any response we sent to clients.
|
*/

trait ApiResponser
{
	/**
     * Return a success JSON response.
     *
     * @param  array|string  $data
     * @param  string  $message
     * @param  int|null  $code
     * @return \Illuminate\Http\JsonResponse
     */
	protected function success($data = [], string $message = 'success', int $code = 1)
	{
		$returnData = [
			'code' => $code,
			'message' => $message,
			'data'=> $data
		];
        if(empty($data))
        {
            unset($returnData['data']);
        } 
		return response()->json($returnData, 200);
	}

	/**
     * Return an error JSON response.
     *
     * @param  string  $message
     * @param  int  $code
     * @param  array|string|null  $data
     * @return \Illuminate\Http\JsonResponse
     */
	protected function error(string $message = null, int $code=0, $data = null)
	{ 
		$returnData = [
			'code' => $code,
			'message' => $message,
			'data'=> $data
		];
        if(empty($data))
        {
            unset($returnData['data']);
        }
		return response()->json($returnData, 200);
	}

}