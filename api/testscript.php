<?php

// TESTS RAN ON POSTMAN USING CURL CODE BELOW

// test 1 - retrieve colllabs

// $url = "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaycollabs";
// $postdata = ""
// response 200 OK 

// test 2 - login with empty fields 

// $url = "http://localhost:8888/letscollab/letscollab/api/api.php?getData=login";
// $postdata = array(luname => "", lpword => "");
// response 400 Bad Request

// test 3 - login with a user that is not registered 

// $url = "http://localhost:8888/letscollab/letscollab/api/api.php?getData=login";
// $postdata = array(luname => "userdoesnotexist", lpword => "randompass");
// response 401 Authorization Required

// test 4 - login with the wrong password 

// $url = "http://localhost:8888/letscollab/letscollab/api/api.php?getData=login";
// $postdata = array(luname => "userexists", lpword => "wrongpass");
// response 403 Forbidden 

// test 5 - login with the correct password 

// $url = "http://localhost:8888/letscollab/letscollab/api/api.php?getData=login";
// $postdata = array(luname => "userexists", lpword => "Userexistspass1!");
// response 200 OK 

// test 6 - login while already logged in

// $url = "http://localhost:8888/letscollab/letscollab/api/api.php?getData=login";
// $postdata = array(luname => "userexists", lpword => "Userexistspass1!");
// response 409 Conflict 

// test 7 - logout while logged in

// $url = ""http://localhost:8888/letscollab/letscollab/api/api.php?getData=logout";
// $postdata = "");
// response 200 OK  

// test 8 - logout while logged out

// $url = ""http://localhost:8888/letscollab/letscollab/api/api.php?getData=logout";
// $postdata = "");
// response 409 Conflict 







$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_PORT => "8888",
  CURLOPT_URL => $url,
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => $postdata,
  CURLOPT_HTTPHEADER => array(
    "cache-control: no-cache",
    "content-type: multipart/form-data"
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}

?>