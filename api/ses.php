<?php

session_start();
include 'db.php';

if ($_GET['getSession'] == 'login') {

    if ((!isset($_POST['luname'])) || (!isset($_POST['lpword']))) {
        http_response_code(400);
    } else {
        $username = $_POST['luname'];
        $password = $_POST['lpword'];
        $userexists = checkLogin($username);
        if ($userexists != false) {
            if(password_verify($password, $userexists['Password'])) {
            http_response_code(200);
            $_SESSION["loginID"] = $userexists['LoginID'];
            $_SESSION["username"] = $userexists['Username'];
            $_SESSION["userID"] = $userexists['UserID'];
            $_SESSION["locationID"] = $userexists['LocationID'];
            echo json_encode(Array('userid'=>$userexists['UserID'], 'locid'=>$userexists['LocationID'],
            'username'=>$userexists['Username']));   
        } else {
            unset($_SESSION["loginID"]);
            unset($_SESSION["username"]);
            unset($_SESSION["usertype"]);
            http_response_code(403);
        }
        } else {
        http_response_code(401);           
        }
    }
}

if ($_GET['getSession'] == 'logout') {
    http_response_code(200);
    unset($_SESSION["loginID"]);
    unset($_SESSION["username"]);
}


?>