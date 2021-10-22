<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Auth\AuthenticationException;
use App\Traits\ApiResponser; 
use Illuminate\Validation\ValidationException;

class Handler extends ExceptionHandler
{
    use ApiResponser;
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }
    
    protected function unauthenticated($request, AuthenticationException $exception)
    {
        return $request->expectsJson()
                    ? $this->error($exception->getMessage(),401)
                    : redirect()->guest($exception->redirectTo() ?? route('login'));
    } 

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
 
    public function render($request, Throwable $e)
    {
        if($request->is('api/*')){
            $response = [
                'message' => 'Sorry, something went wrong.'
            ];
     
            $status = 400;
    
            // If this exception is an instance of HttpException
            if ($this->isHttpException($e)) {
                // Grab the HTTP status code from the Exception
                $status = $e->getStatusCode();
            }
    
            if($e instanceof ValidationException){
                    
                $errors = [];
                foreach($e->errors() as $err)
                {
                    $errors[] = str_replace('.','',implode(',',$err));  
                } 
                return $this->error(implode(', ',$errors), 0); 
            }
            else
            {
                $json = [
                    'code' => $status,
                    'message' => "Server error, please contact administrator"
                ];
                if($status != 404)
                {
                    if (config('app.debug')) { 
                        $response = [
                            'code' => -1,
                            'data' => [ 
                                'statusCode' => $status,
                                'exception' => get_class($e),
                                'trace' => $e->getTrace(),
                                'message' => $e->getMessage(),
                            ]
                        ];
                        $json = $response;
                        unset($json['error']['trace']); 
                    }  
                    save_log($response);
                } 
                return response()->json($json, $status);
            }
        }
        else{
            return parent::render($request, $e);
        }
        
    }

}
