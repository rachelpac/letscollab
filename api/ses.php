<?php
class sessObj {

/* function setRequestHeader(){

if(isset($_SERVER["HTTP_ORIGIN"]))
{
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
}
else
{
    header("Access-Control-Allow-Origin: *");
}

header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 600");

if($_SERVER["REQUEST_METHOD"] == "OPTIONS")
{
    if (isset($_SERVER["HTTP_ACCESS_CONTROL_REQUEST_METHOD"]))
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT"); 

    if (isset($_SERVER["HTTP_ACCESS_CONTROL_REQUEST_HEADERS"]))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    exit(0);
}
} */

function CheckCurrentRequest($lastrequest, $currentrequest)
{
    // creates a new date time object from the database time stamps 
    $currentrequest = new DateTime($currentrequest);
    $lastrequest = new DateTime($lastrequest);
    $timesincelastrequest = $currentrequest->diff($lastrequest);

    // data diff object calculates the difference in years, months, days, hours, minutes aand seconds of the two date objects 
    $yeardiff = $timesincelastrequest->y;
    $monthdiff = $timesincelastrequest->m;
    $daydiff = $timesincelastrequest->d;
    $hourdiff = $timesincelastrequest->h;
    $mindiff = $timesincelastrequest->i;
    $secdiff = $timesincelastrequest->s;

    // checks that that the two date objects are only one second apart 
    if (($yeardiff == 0) && ($monthdiff == 0) && ($daydiff == 0) && ($hourdiff == 0) && ($mindiff == 0) && ($secdiff < 1)) {
        return false;
    } else {
        return true;
    }

}

function CheckRequestCount($requestsmade)
{
    $maxrequests = 1000;
    $requestsleft = $maxrequests - $requestsmade;
    if ($requestsleft > 0) {
        return true;
    } else {
        return false;
    }

}

function CheckRefer() {
$valideferdomain = 'localhost';
$domain =  $_SERVER['HTTP_REFERER'];
$domainref = parse_url($domain, PHP_URL_HOST);
if ($domainref == $valideferdomain) {
    return true;
} else {
    return false;
    }
}

function IsLoggedIn() {
    if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true)) {
        return true;
    } else {
        return false;
    }
}

function IsUserLoggedIn() {
    if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["userID"]))) {
        return true;
    } else {
        return false;
    }
}

function IsLocationLoggedIn() {
    if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["locationID"]))) {
        return true;
    } else {
        return false;
    }
}

function IsRequestOkIP() {
    global $db;
    $requestsmade = $db->GetIPRequestCount();
    $iscountrok = $_SESSION['se']->CheckRequestCount($requestsmade);
    $lastrequest = $db->GetLastIPRequest();
    $currentrequest = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
    $istimeok = $_SESSION['se']->CheckCurrentRequest($lastrequest, $currentrequest);

    if($iscountrok == false || $istimeok == false) {
        return false;
    } else {
        return true;
    }
}

function IsRequestOkUser() {
    global $db;
    $requestsmade = $db->GetUserRequestCount($_SESSION["loginID"]);
    $iscountrok = $_SESSION['se']->CheckRequestCount($requestsmade);
    $lastrequest =  $db->GetLastUserRequest($_SESSION["loginID"]);
    $currentrequest = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
    $istimeok = $_SESSION['se']->CheckCurrentRequest($lastrequest, $currentrequest);
    if($iscountrok == false || $istimeok == false) {
        return false;
    } else {
        return true;
    }
}
}

?>
