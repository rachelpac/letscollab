<?php

session_start();
include 'db.php';

if (isset($_GET['getSession'])) {

if ($_GET['getSession'] == 'login') {
    if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true)) {
        http_response_code(409);

} else {
       if ((!isset($_POST['luname'])) || (!isset($_POST['lpword']))) {
        http_response_code(400);
        session_unset();
    } else {
        $username = $_POST['luname'];
        $password = $_POST['lpword'];
        $userexists = checkLogin($username);
        if ($userexists != false) {
            if(password_verify($password, $userexists['Password'])) {
            http_response_code(200);
            $_SESSION['loggedin'] = true;
            $_SESSION["loginID"] = $userexists['LoginID'];
            $_SESSION["username"] = $userexists['Username'];
            $_SESSION["userID"] = $userexists['UserID'];
            $_SESSION["locationID"] = $userexists['LocationID'];
            echo json_encode(Array('userid'=>$userexists['UserID'], 'locid'=>$userexists['LocationID'],
            'username'=>$userexists['Username']));   
        } else {
            http_response_code(403);
            session_unset();
        }
        } else {
        http_response_code(401);
        session_unset();          
        }
    } 
}
}

if ($_GET['getSession'] == 'logout') {
    if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true)) {
    http_response_code(200);
    session_unset();
} else {
    http_response_code(409);
}
}

}


?>