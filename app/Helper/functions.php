<?php

function getMillisecond() {
    list($s1, $s2) = explode(' ', microtime());
    return (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
}


function get_microtime_format($time)
{
    if(strlen($time)==13)
    {
        $sec=$time%1000;
        $usec=($time-$sec)/1000;
    }
    else
    {
        $usec=$time;
        $sec="000";
    }

    $date = date("YmdHis.x",$usec);
    return str_replace('.x', $sec, $date);
}


if (!function_exists('get_client_ip')) {
    /**
     * 获取客户端IP地址
     * @param int $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
     * @param bool $adv 是否进行高级模式获取（有可能被伪装）
     * @return mixed
     */
    function get_client_ip()
    {
        $unknown = 'unknown';
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR'] && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], $unknown)) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], $unknown)) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        /*
        处理多层代理的情况
        或者使用正则方式：$ip = preg_match("/[\d\.]{7,15}/", $ip, $matches) ? $matches[0] : $unknown;
        */
        if (false !== strpos($ip, ',')) $ip = reset(explode(',', $ip));
        return $ip;
    }
}

function curl_get($url,$header = [])
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    if (stripos($url, "https://") !== FALSE) {
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
    }
    $output = curl_exec($ch);
    curl_close($ch);
    return $output;
}

function curl_post($url="" ,$requestData=array()){

    $curl = curl_init();

    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

    //普通数据
    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($requestData));
    $res = curl_exec($curl);

    //$info = curl_getinfo($ch);
    curl_close($curl);
    return $res;
}


function xmlToArray($xml)
{
    $xml = simplexml_load_string($xml);
    $res = json_decode(json_encode($xml,true),true);
    return $res;
}

function success($data = array())
{

    if(!$data)
    {
        $data = new ArrayObject();
    }

    $returnData = ['data'=>['code'=>200,'msg'=>'success','data'=>$data]];
    
    return responseJson($returnData);
}

function error($code,$msg="",$data = array())
{
    $error_show = [
        0 => '游戏进行着，请稍后再试',
        1 => '发现错误，请联系客服'
    ];
    $error = [
        10001 => $error_show[1],//'平台配置不存在',
        10002 => $error_show[0],//'请求平台信息失败',
        // 10003 => $error_show[1],//'游戏平台余额不足',
        10004 => $error_show[1],//'请求参数错误'
        10005=>'该用户已经存在上级',
    ];

    if(isset($error[$code]))
    {
        $msg = $error[$code];
    }
     
    // return response()->json(['data'=>['code'=>$error[$code],'msg'=>$msg,'data'=>$data]]);
    // return response()->json(['data'=>['code'=>$code,'msg'=>$msg,'data'=>$data]]);
    
    $returnData = ['data'=>['code'=>$code,'msg'=>$msg,'data'=>$data]];
    
    return responseJson($returnData);

}


function responseJson($returnData)
{ 
    $app_status = config('lock.app_lock');

    if($app_status)
    {
        $returnData = apps_lock($returnData);
    }

    return response()->json($returnData);
}

function apps_lock($return)
{ 
    $iv_suffix = substr(md5(mt_rand()), 0, 6);
    $returnData = [
        'suffix' => $iv_suffix,
        'data' => apps_encrypt($return, $iv_suffix)
    ];
    return $returnData;
}

function apps_encrypt($data, $iv_suffix)
{
    $app_asc_key = config('lock.app_asc_key');
    $app_asc_iv  = config('lock.app_asc_iv'); 
    
    $encrypted = json_encode($data);
    $encrypted = openssl_encrypt($encrypted, 'aes-256-cbc', $app_asc_key, OPENSSL_RAW_DATA, $app_asc_iv . $iv_suffix);
    $encrypted = base64_encode($encrypted);

    return $encrypted;
}

function apps_decrypt($encrypted, $iv_suffix)
{
    $app_asc_key = config('lock.app_asc_key');
    $app_asc_iv  = config('lock.app_asc_iv'); 
 
    $encrypted = base64_decode($encrypted);
    $decrypted = openssl_decrypt($encrypted, 'aes-256-cbc', $app_asc_key, OPENSSL_RAW_DATA, $app_asc_iv . $iv_suffix);

    return json_decode($decrypted, true);
}

function checkSign($input)
{  
    $signKey = config('lock.app_id');

    $params  = $input; 
    unset($params['encode_sign']); 
    ksort($params);  //sort by key

    $paramsTxt = implode('&', array_map(
        function ($v, $k) { return sprintf("%s=%s", $k, $v); },
        $params,
        array_keys($params)
    ));
     
    $sign = md5($paramsTxt .'&'. $signKey);

    if (strtolower($sign) === strtolower($input['encode_sign'])) return true;
    else return false;
}

function getYuan($price)
{
    return number_format($price/100,'2','.','');
}

function getConfig($key=null)
{
    if($key==null)
    {
        $res = \App\Models\Config::all()->all();
        $config = array();
        foreach ($res as $k=>$v)
        {
            $config[$v->config_key] = $v->config_value;
        }
        return $config;
    }else{
        $res =  \App\Models\Config::where('config_key',$key)->select('config_value')->first();

        if($res)
        {
            return $res->config_value;
        }else{

            return null;
        }
    }

}

function selectGameObject($platformId)
{
    $platformKey = \App\Models\Platform::find($platformId)->key;

    $className = 'App\Service'.'\\'.$platformKey.'Service';

    $obj = new $className ($platformKey);

    return $obj;


}

function invited_code() {
    if (function_exists ( 'com_create_guid' )) {
        return com_create_guid ();
    } else {
        mt_srand ( ( double ) microtime () * 10000 ); //optional for php 4.2.0 and up.随便数播种，4.2.0以后不需要了。
        $charid = strtoupper ( md5 ( uniqid ( rand (), true ) ) ); //根据当前时间（微秒计）生成唯一id.
        $hyphen = chr ( 45 ); // "-"
        $uuid = '' . //chr(123)// "{"
            substr ( $charid, 0, 8 ) . $hyphen . substr ( $charid, 8, 4 ) . $hyphen . substr ( $charid, 12, 4 ) . $hyphen . substr ( $charid, 16, 4 ) . $hyphen . substr ( $charid, 20, 12 );
        //.chr(125);// "}"
        return $uuid;
    }
}

function objectCheck($data)
{
    if(empty($data))
    {
        $data = (object)[];
    }
    return $data;
}

function prx($string='', $dump = false)
{
    $fun = 'print_r';
    if($dump)$fun='var_dump';

    print_r('<pre>');
    $fun($string);
    print_r('</pre>'); 
}

function prxx($string='', $dump = false)
{
    $fun = 'print_r';
    if($dump)$fun='var_dump';

    print_r('<pre>');
    $fun($string);
    print_r('</pre>');
    exit;
}

function errorMsg($key)
{
    $messages = [
        '1000' => 'others error' , 
        '1001' => 'Invalid Parent Account',
        '1002' => 'accountNo is required(autoIncrement=0)',
        '1003' => 'Account Number already exists',
        '1004' => 'Invalid AccountNo',
        '1005' => 'Invalid Credit Account No',
        '1006' => 'Invalid Debit Account No',
        '1007' => 'Invalid InvoiceId',
        '1008' => 'Form Error',
        '1009' => "Amount Error(Total knock off amount should smaller than Amount)", 
        '1010' => 'Invalid journalId', 
        '1011' => 'Invalid Invoice No(Knockoff_Invoice): xxxxxx', 
        '1012' => "Duplicate Record found for receipt_no':xxxx' and 'extension no:'xx",
        '1013' => "Duplicate Record found for 'pv_no':xxx", 
        '1014' => 'Invalid paymentId',
        '1015' => 'Knock Off Date cannot smaller than Payment Date',
        '1016' => 'Knock Off amount cannot biger than Invoice Balance(xxxx)',
        '1017' => 'Invalid Knockoff Payment id: xxxx',
        '1018' => 'Invoice no already exists',
        '1019' => 'ERR:xxx | invalid prefix number:xxx | prefix number should between:xxx to xxx',

        '2000' => 'form validate error' , 
        '2001' => 'Credentials not match', 
        '2002' => 'Invalid apikey/secret',
        '3001' => 'token is required',
        '3002' => 'token expire',
        '3003' => 'token error',
        '-1' => 'Server error, please contact administrator',
    ];

    return $messages[$key];
}

function priceFormat($amount)
{
    $amount = number_format($amount, 2, '.', '');

    return $amount;
}

function listNumber($prefix=null)
{
    $lists = [];
    for($i=1; $i<=9999; $i++)
    {
        $number = sprintf("%04d", $i);
        if($prefix != null)
        {
            $number = "$prefix-$number";
        }
        $lists[] = $number;
    }

    return $lists;
}


function save_log($msg, $path = 'custom', $file_name = '')
{   
    if (!$file_name) $file_name = date('Y-m-d') . '.log';

    $storage_path = storage_path("logs/$path");

    if (!is_dir($storage_path)) {
        mkdir($storage_path, 0777);
    }

    $filename = "$storage_path/$file_name"; 
    
    if(!is_string($msg))
    {
        $msg = json_encode($msg);
    }
    $content = date("Y-m-d H:i:s") . " " . $msg . "\r\n \r\n";

    file_put_contents($filename, $content, FILE_APPEND);
}

function csvToArray($filename = '', $delimiter = ',')
{
    if (!file_exists($filename) || !is_readable($filename))
        return false;

    $header = null;
    $data = array();
    if (($handle = fopen($filename, 'r')) !== false)
    {
        while (($row = fgetcsv($handle, 1000, $delimiter)) !== false)
        {
            if (!$header)
                $header = $row;
            else
                $data[] = array_combine($header, $row);
        }
        fclose($handle);
    }

    return $data;
}