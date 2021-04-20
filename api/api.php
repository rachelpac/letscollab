<?php
session_start();

// instantiate session and database object to access within api
require 'db.php';
$db = new dbObj;
require 'ses.php';
$_SESSION['se'] = new sessObj;

// $_SESSION['se']->setRequestHeader();

// The API only allows certain requests to be made
// It will check if the request is allowed by checking the request in the if statements
// If the request is not allowed it results in a 501 error and dies 

// if ((isset($_GET['getData'])) && ($_SESSION['se']->CheckRefer())) {
    if ($_GET['getData'] == 'login') {
        // function checks to see if the user is logged in before each request and returns true or false 
        // if authentication is required for the request it will result in a 401 
        // if a session already exists it will result in a 409
        if ($_SESSION['se']->IsLoggedIn()) {
            $useraction = 'Failed Login';
            $db->LogUserRequest($useraction);
            http_response_code(409);
        } else {
            if ((!isset($_POST['luname'])) || (!isset($_POST['lpword']))) {
                $useraction = 'Failed Login';
                $db->LogUserRequest($useraction);
                http_response_code(400);
                session_unset();
            } else {
                $username = $db->inputFilter($_POST['luname']);
                $password = $db->inputFilter($_POST['lpword']);
                $userexists = $db->checkLogin($username);
                if ($userexists != false) {
                    if (password_verify($password, $userexists['Password'])) {
                        $useraction = 'User Login';
                        $db->LogUserRequest($useraction);
                        http_response_code(200);
                        $_SESSION['loggedin'] = true;
                        $_SESSION["loginID"] = $userexists['LoginID'];
                        $_SESSION["username"] = $userexists['Username'];
                        $_SESSION["userID"] = $userexists['UserID'];
                        $_SESSION["locationID"] = $userexists['LocationID'];
                        $result = Array('userid' => $userexists['UserID'], 'locid' => $userexists['LocationID'],
                            'username' => $userexists['Username']);
                    } else {
                        $useraction = 'Failed Login';
                        $db->LogUserRequest($useraction);
                        http_response_code(403);
                        session_unset();
                    }
                } else {
                    $useraction = 'Failed Login';
                    $db->LogUserRequest($useraction);
                    http_response_code(401);
                    session_unset();
                }
            }
        }
    } // end login

    if ($_GET['getData'] == 'logout') {
        if ($_SESSION['se']->IsLoggedIn()) {
            $useraction = 'User Logout';
            $db->LogUserRequest($useraction);
            http_response_code(200);
            session_unset();
        } else {
            $useraction = 'Failed Logout';
            $db->LogUserRequest($useraction);
            http_response_code(409);
        }
    } // end logout

     if ($_GET['getData'] == 'adduseracc') {
        if ($_SESSION['se']->IsLoggedIn()) { 
            $useraction = 'Failed Register Account';
            $db->LogUserRequest($useraction);
            http_response_code(409);
        } else {
            if ($_SESSION['se']->IsRequestOkIP()) {
                if ((empty($_POST['uname'])) || (empty($_POST['pword'])) || (empty($_POST['email'])) || (empty($_POST['profilepic'])) || (empty($_POST['ighandle'])) || (empty($_POST['workurl'])) || ((empty($_POST['checkadduseracc'])) && (empty($_POST['checkaddlocationacc'])))) {
                    $useraction = 'Failed Register Account';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((($db->checkLength($_POST['uname'], 30, 5)) == false) || (($db->checkLength($_POST['pword'], 255, 8)) == false) || (($db->checkLength($_POST['email'], 50, 5)) == false) || (($db->checkLength($_POST['ighandle'], 30, 1)) == false) || (($db->checkLength($_POST['workurl'], 255, 1)) == false)) {
                    http_response_code(400);
                } else if ($db->checkEmail($_POST['email']) == false) {
                    http_response_code(400);
                }                
                else {
                    $username = $db->inputFilter($_POST['uname']);
                    $password = $db->inputFilter($_POST['pword']);
                    $email = $db->inputFilter($_POST['email']);
                    $profilepic = $db->inputFilter($_POST['profilepic']);
                    $ighandle = $db->inputFilter($_POST['ighandle']);
                    $workurl = $db->inputFilter($_POST['workurl']);
                    $hpassword = password_hash($password, PASSWORD_DEFAULT);
                }
                if (isset($_POST['checkadduseracc'])) {
                    if ((empty($_POST['fname'])) || (empty($_POST['lname'])) || (empty($_POST['bio']))) {
                        $useraction = 'Failed Register Account';
                        $db->LogUserRequest($useraction);
                        http_response_code(400);
                    } else if ((($db->checkLength($_POST['fname'], 255, 2)) == false) || (($db->checkLength($_POST['lname'], 255, 2)) == false)) {
                        http_response_code(400);
                    }

                        
                     else {
                        $firstname = $db->inputFilter($_POST['fname']);
                        $lastname = $db->inputFilter($_POST['lname']);
                        $bio = $db->inputFilter($_POST['bio']);
                        $userexists = $db->checkUserReg($username);
                        if ($userexists == false) {
                            $insertlogin = $db->addLogin($username, $hpassword);
                            $loginID = $insertlogin;
                            $db->addUserAccount($firstname, $lastname, $email, $bio, $profilepic, $ighandle, $workurl, $loginID);
                            $useraction = 'Register Account';
                            $db->LogUserRequest($useraction);
                            http_response_code(201);
                        } else {
                            $useraction = 'Failed Register Account';
                            $db->LogUserRequest($useraction);
                            http_response_code(406);
                        }
                    }
                }
                if (isset($_POST['checkaddlocationacc'])) {
                    if ((empty($_POST['locname'])) || (empty($_POST['locaddress'])) || (empty($_POST['loccity'])) || (empty($_POST['locstate'])) || (empty($_POST['locpostcode'])) || (empty($_POST['locdescript']))) {
                        $useraction = 'Failed Register Account';
                        $db->LogUserRequest($useraction);
                        http_response_code(400);
                    } else if ((($db->checkLength($_POST['locname'], 255, 2)) == false) || (($db->checkLength($_POST['locaddress'], 255, 2)) == false) || (($db->checkLength($_POST['loccity'], 255, 2)) == false) || (($db->checkLength($_POST['locstate'], 3, 2)) == false) || (($db->checkLength($_POST['locpostcode'], 4, 4)) == false)) {
                        http_response_code(400);
                    } else if ($db->checkPostCode($_POST['locpostcode']) == false) {
                    http_response_code(400);
                    }  else if ($db->checkState($_POST['locstate']) == false) {
                        http_response_code(400);
                    } else {
                        $name = $db->inputFilter($_POST['locname']);
                        $address = $db->inputFilter($_POST['locaddress']);
                        $city = $db->inputFilter($_POST['loccity']);
                        $state = $db->inputFilter($_POST['locstate']);
                        $postcode = $db->inputFilter($_POST['locpostcode']);
                        $description = $db->inputFilter($_POST['locdescript']);
                        $userexists = $db->checkUserReg($username);
                        if ($userexists == false) {
                            $insertlogin = $db->addLogin($username, $hpassword);
                            $loginID = $insertlogin;
                            $db->addLocationAccount($name, $address, $city, $state, $postcode, $email, $description, $profilepic, $ighandle, $workurl, $loginID);
                            $useraction = 'Register Account';
                            $db->LogUserRequest($useraction);
                            http_response_code(201);
                        } else {
                            $useraction = 'Failed Register Account';
                            $db->LogUserRequest($useraction);
                            http_response_code(406);
                        }
                    }
                }                
            } else {
                http_response_code(412);
            }
        } 

    } // end adduseracc

    if ($_GET['getData'] == 'addcollab') {
        if ($_SESSION['se']->IsUserLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
                if ((!isset($_POST['ctitle'])) || (!isset($_POST['cdescript'])) || (!isset($_POST['cdate'])) || (!isset($_POST['ctime'])) || (!isset($_POST['ownerrole']))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checkaddlocation'])) && (!isset($_POST['locationuname']))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checksearchlocation'])) && ((!isset($_POST['lcity'])) || (!isset($_POST['lbookingfee'])) || (!isset($_POST['ldescript'])))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checkaddmember'])) && ((!isset($_POST['tmuname'])) || (!isset($_POST['tmrole'])))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checksearchmember'])) && ((!isset($_POST['tmsearchrole'])) || (!isset($_POST['tmbookingfee'])) || (!isset($_POST['tmdescript'])))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else {
                    $title = $db->inputFilter($_POST['ctitle']);
                    $description = $db->inputFilter($_POST['cdescript']);
                    $date = $db->inputFilter($_POST['cdate']);
                    $time = $db->inputFilter($_POST['ctime']);
                    $datetime = $date . " " . $time;
                    $datetime = date('Y-m-d H:i:s', strtotime($datetime));
                    $ownerrole = $db->inputFilter($_POST['ownerrole']);
                    $userID = $_SESSION["userID"];

                    if (isset($_POST['checkaddlocation'])) {
                        $locationusername = $db->inputFilter($_POST['locationuname']);
                        $locationexists = $db->checkLocation($locationusername);
                    }

                    if (isset($_POST['checkaddmember'])) {
                        $tmusername = $db->inputFilter($_POST['tmuname']);
                        $tmrole = $db->inputFilter($_POST['tmrole']);
                        $userexists = $db->checkUser($tmusername);
                    }

                    if (isset($_POST['checksearchlocation'])) {
                        $locationcity = $db->inputFilter($_POST['lcity']);
                        $locationbookingfee = $db->inputFilter($_POST['lbookingfee']);
                        $locationdescript = $db->inputFilter($_POST['ldescript']);
                    }

                    if (isset($_POST['checksearchmember'])) {
                        $tmsearchrole = $db->inputFilter($_POST['tmsearchrole']);
                        $tmbookingfee = $db->inputFilter($_POST['tmbookingfee']);
                        $tmdescription = $db->inputFilter($_POST['tmdescript']);
                    }
                }

                if (((isset($_POST['checkaddlocation'])) && ($locationexists == false)) || ((isset($_POST['checkaddmember'])) && ($userexists == false))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(404);
                } else {
                    $insertcollab = $db->addCollab($title, $description, $datetime, $userID);
                    $collaborationID = $insertcollab;
                    $db->addTeamMember($ownerrole, $userID, $collaborationID);

                    if (isset($_POST['checkaddlocation'])) {
                        $locationID = $locationexists;
                        $db->addLocation($locationID, $collaborationID);
                    }
                    if (isset($_POST['checksearchlocation'])) {
                        $db->addLocationSearch($locationcity, $locationbookingfee, $locationdescript, $collaborationID);
                    }
                    if (isset($_POST['checkaddmember'])) {
                        $userID = $userexists;
                        $db->addTeamMember($tmrole, $userID, $collaborationID);
                    }
                    if (isset($_POST['checksearchmember'])) {
                        $db->addTeamMemberSearch($tmsearchrole, $tmbookingfee, $tmdescription, $collaborationID);
                    }
                    $useraction = 'Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(201);
                }
            } else {
                http_response_code(412);
            }

        } else {
            $useraction = 'Failed Submit Collaboration';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    } // end addcolab

    if ($_GET['getData'] == 'displaycollabs') {
        if ($_SESSION['se']->IsLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
                $useraction = 'Browse Collaborations';
                $db->LogUserRequest($useraction);
                $result = $db->displayCollabs();
                http_response_code(200);
            } else {
                http_response_code(412);
            }
        } else {
            if ($_SESSION['se']->IsRequestOkIP()) {
                $useraction = 'Browse Collaborations';
                $db->LogUserRequest($useraction);
                $result = $db->displayCollabs();
                http_response_code(200);
            } else {
                http_response_code(412);
            }
        }
    }

    if ($_GET['getData'] == 'displayuserprofile') {
        if ($_SESSION['se']->IsUserLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
                $userID = $_SESSION["userID"];
                $result = $db->displayUserProfile($userID);
                $useraction = 'Load Profile';
                $db->LogUserRequest($useraction);
                http_response_code(200);
            } else {
                http_response_code(412);
            }
        } else {
            $useraction = 'Failed Load Profile';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'displaylocprofile') {
        if ($_SESSION['se']->IsLocationLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
            $locationID = $_SESSION["locationID"];
            $result = $db->displayLocationProfile($locationID);
            $useraction = 'Load Profile';
            $db->LogUserRequest($useraction);
            http_response_code(200);
        } else {
            http_response_code(412);
        }
    } else {
        $useraction = 'Failed Load Profile';
        $db->LogUserRequest($useraction);
        http_response_code(401);
    }
    
    }

    if ($_GET['getData'] == 'addlocrequest') {
        if ($_SESSION['se']->IsLocationLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
                if (!isset($_POST['locreqsearchid'])) {
                    $useraction = 'Failed Submit Location Request';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else {
                    $locsearchID = $_POST['locreqsearchid'];
                    $locationID = $_SESSION["locationID"];
                    $locationrequestsent = $db->checkLocRequestUser($locationID, $locsearchID);
                    if ($locationrequestsent == false) {
                        $db->addLocationRequest($locationID, $locsearchID);
                        $useraction = 'Submit Location Request';
                        $db->LogUserRequest($useraction);
                        http_response_code(201);
                    } else {
                        $useraction = 'Failed Submit Location Request';
                        $db->LogUserRequest($useraction);
                        http_response_code(406);
                    }
                }
            } else {
                http_response_code(412);
            }
        } else {
            $useraction = 'Failed Submit Location Request';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'addteamrequest') {
        if ($_SESSION['se']->IsUserLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
        if (!isset($_POST['teamreqsearchid'])) {
            $useraction = 'Failed Submit Team Member Request';
            $db->LogUserRequest($useraction);
            http_response_code(400);
        } else {
            $tmsearchID = $_POST['teamreqsearchid']; 
            $userID = $_SESSION["userID"]; 
            $tmrequestsent = $db->checkTeamRequestUser($userID, $tmsearchID);
                if ($tmrequestsent == false) {
                    $db->addTeamMemberRequest($tmsearchID, $userID);
                    $useraction = 'Submit Team Member Request';
                    $db->LogUserRequest($useraction);
                    http_response_code(201);
                } else {
                    $useraction = 'Failed Submit Team Member Request';
                    $db->LogUserRequest($useraction);
                    http_response_code(406);
                }                  
        }         
            }  else {
                http_response_code(412);
            }
        } else {
                $useraction = 'Failed Submit Team Member Request';
                $db->LogUserRequest($useraction);
                http_response_code(401);
            }
    }

    if ($_GET['getData'] == 'displayusercollabs') {
        if ($_SESSION['se']->IsUserLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
            $userID = $_SESSION["userID"];
            http_response_code(200);
            $result = $db->displayUserCollabs($userID);
            $useraction = 'Load User Collaborations';
            $db->LogUserRequest($useraction);
            } else {
                http_response_code(412);
            }
        } else {
            $useraction = 'Failed Load User Collaborations';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'displaycollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = $db->displayCollab($collaborationID);
        $useraction = 'Load User Collaboration Details';
        $db->LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displayteam') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = $db->displayTeam($collaborationID);
        $useraction = 'Load Collaboration Team';
        $db->LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displaylocation') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = $db->displayLocation($collaborationID);
        $useraction = 'Load Collaboration Location';
        $db->LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displayusercollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = $db->displayUserCollab($collaborationID);
        $useraction = 'Load User Collaboration Details';
        $db->LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displaylocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = $db->displayLocationRequests($collaborationID);
        $useraction = 'Load Collaboration Location Requests';
        $db->LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displayteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = $db->displayTeamMemberRequests($collaborationID);
        $useraction = 'Load Collaboration Team Requests';
        $db->LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'approvelocrequest') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locationID = $data->lid;
        $collaborationID = $data->cid;
        $locrequestID = $data->lrid;
        $locsearchID = $data->lsid;
        $db->addLocation($locationID, $collaborationID);
        $db->approveLocationRequest($locrequestID);
        $db->denyLocationRequests($locsearchID, $locrequestID);
        $db->completeLocationSearch($locsearchID);
        $useraction = 'Approve Collaboration Location Requests';
        $db->LogUserRequest($useraction);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'approveteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $role = $data->tmrole;
        $userID = $data->uid;
        $collaborationID = $data->cid;
        $tmrequestID = $data->tmrid;
        $tmsearchID = $data->tmsid;
        $db->addTeamMember($role, $userID, $collaborationID);
        $db->approveTeamMemberRequest($tmrequestID);
        $db->denyTeamMemberRequests($tmsearchID, $tmrequestID);
        $db->completeTeamMemberSearch($tmsearchID);
        $useraction = 'Approve Collaboration Team Requests';
        $db->LogUserRequest($useraction);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'denylocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locrequestID = $data->lrid;
        $db->denyLocationRequest($locrequestID);
        $useraction = 'Deny Collaboration Location Requests';
        $db->LogUserRequest($useraction);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'denyteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $tmrequestID = $data->tmrid;
        $db->denyTeamMemberRequest($tmrequestID);
        $useraction = 'Deny Collaboration Team Requests';
        $db->LogUserRequest($useraction);
        http_response_code(201);
    }



    if ($_GET['getData'] == 'displayuserlocrequests') {
        if ($_SESSION['se']->IsLocationLoggedIn()) {
            $locationID = $_SESSION["locationID"];
            http_response_code(200);
            $result = $db->displayUserLocationRequests($locationID);
            $useraction = 'Load User Location Requests';
            $db->LogUserRequest($useraction);
        } else {
            $useraction = 'Failed Load User Location Requests';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'displayuserrequests') {
        if ($_SESSION['se']->IsUserLoggedIn()) {
            $userID = $_SESSION["userID"];
            http_response_code(200);
            $result = $db->displayUserRequests($userID);
            $useraction = 'Load User Team Requests';
            $db->LogUserRequest($useraction);
        } else {
            $useraction = 'Failed Load User Team Requests';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    } 

    /// REACT CHANGES 

    if ($_GET['getData'] == 'reactaddlocrequest') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if ($_SESSION['se']->IsLocationLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
                if ($data->lrsid == '') {
                    $useraction = 'Failed Submit Location Request';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else {
                    $locsearchID = $data->lrsid;
                    $locationID = $_SESSION["locationID"];
                    $locationrequestsent = $db->checkLocRequestUser($locationID, $locsearchID);
                    if ($locationrequestsent == false) {
                        $db->addLocationRequest($locationID, $locsearchID);
                        $useraction = 'Submit Location Request';
                        $db->LogUserRequest($useraction);
                        http_response_code(201);
                    } else {
                        $useraction = 'Failed Submit Location Request';
                        $db->LogUserRequest($useraction);
                        http_response_code(406);
                    }
                }
            } else {
                http_response_code(412);
            }
        } else {
            $useraction = 'Failed Submit Location Request';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'reactaddteamrequest') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if ($_SESSION['se']->IsUserLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
        if ($data->tmrsid == '') {
            $useraction = 'Failed Submit Team Member Request';
            $db->LogUserRequest($useraction);
            http_response_code(400);
        } else {
            $tmsearchID = $data->tmrsid;
            $userID = $_SESSION["userID"]; 
            $tmrequestsent = $db->checkTeamRequestUser($userID, $tmsearchID);
                if ($tmrequestsent == false) {
                    $db->addTeamMemberRequest($tmsearchID, $userID);
                    $useraction = 'Submit Team Member Request';
                    $db->LogUserRequest($useraction);
                    http_response_code(201);
                } else {
                    $useraction = 'Failed Submit Team Member Request';
                    $db->LogUserRequest($useraction);
                    http_response_code(406);
                }                  
        }         
            }  else {
                http_response_code(412);
            }
        } else {
                $useraction = 'Failed Submit Team Member Request';
                $db->LogUserRequest($useraction);
                http_response_code(401);
            }
    }


    if ($_GET['getData'] == 'reactlogin') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if ($_SESSION['se']->IsLoggedIn()) {
            $useraction = 'Failed Login';
            $db->LogUserRequest($useraction);
            http_response_code(409);
        } else {
            if (($data->luname == '') || ($data->lpword == '')) {
                $useraction = 'Failed Login';
                $db->LogUserRequest($useraction);
                http_response_code(400);
                session_unset();
            } else {
                $username = $data->luname;
                $password = $data->lpword;
                $userexists = $db->checkLogin($username);
                if ($userexists != false) {
                    if (password_verify($password, $userexists['Password'])) {
                        $useraction = 'User Login';
                        $db->LogUserRequest($useraction);
                        http_response_code(200);
                        $_SESSION['loggedin'] = true;
                        $_SESSION["loginID"] = $userexists['LoginID'];
                        $_SESSION["username"] = $userexists['Username'];
                        $_SESSION["userID"] = $userexists['UserID'];
                        $_SESSION["locationID"] = $userexists['LocationID'];
                        $result = Array('userid' => $userexists['UserID'], 'locid' => $userexists['LocationID'],
                            'username' => $userexists['Username']);
                    } else {
                        $useraction = 'Failed Login';
                        $db->LogUserRequest($useraction);
                        http_response_code(403);
                        session_unset();
                    }
                } else {
                    $useraction = 'Failed Login';
                    $db->LogUserRequest($useraction);
                    http_response_code(401);
                    session_unset();
                }
            }
        }

    }

    if ($_GET['getData'] == 'reactaddcollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        if ($_SESSION['se']->IsUserLoggedIn()) {
            if ($_SESSION['se']->IsRequestOkUser()) {
                if (($data->ctitle == '') || ($data->cdescript == '') || ($data->cdate == '') || ($data->ctime == '') || ($data->ownerrole == '')) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if (($data->hiddenaddloc == false) && ($data->locationuname == '')) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if (($data->hiddensearchloc == false) && (($data->lcity == '') || ($data->lbookingfee == '') || ($data->ldescript == ''))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if (($data->hiddenaddmember == false) && (($data->tmuname == '') || ($data->tmrole == ''))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else if (($data->hiddensearchmember == false) && (($data->tmsearchrole == '') || ($data->tmbookingfee == '') || ($data->tmdescript == ''))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(400);
                } else {
                    $title = $db->inputFilter($data->ctitle);
                    $description = $db->inputFilter($data->cdescript);
                    $date = $db->inputFilter($data->cdate);
                    $time = $db->inputFilter($data->ctime);
                    $datetime = $date . " " . $time;
                    $datetime = date('Y-m-d H:i:s', strtotime($datetime));
                    $ownerrole = $db->inputFilter($data->ownerrole);
                    $userID = $_SESSION["userID"];

                    if ($data->hiddenaddloc == false) {
                        $locationusername = $db->inputFilter($data->locationuname);
                        $locationexists = $db->checkLocation($locationusername);
                    }

                    if ($data->hiddenaddmember == false) {
                        $tmusername = $db->inputFilter($data->tmuname);
                        $tmrole = $db->inputFilter($data->tmrole);
                        $userexists = $db->checkUser($tmusername);
                    }

                    if ($data->hiddensearchloc == false) {
                        $locationcity = $db->inputFilter($data->lcity);
                        $locationbookingfee = $db->inputFilter($data->lbookingfee);
                        $locationdescript = $db->inputFilter($data->ldescript);
                    }

                    if ($data->hiddensearchmember == false) {
                        $tmsearchrole = $db->inputFilter($data->tmsearchrole);
                        $tmbookingfee = $db->inputFilter($data->tmbookingfee);
                        $tmdescription = $db->inputFilter($data->tmdescript);
                    }
                }

                if ((($data->hiddenaddloc == false) && ($locationexists == false)) || (($data->hiddenaddmember == false) && ($userexists == false))) {
                    $useraction = 'Failed Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(404);
                } else {
                    $insertcollab = $db->addCollab($title, $description, $datetime, $userID);
                    $collaborationID = $insertcollab;
                    $db->addTeamMember($ownerrole, $userID, $collaborationID);

                    if ($data->hiddenaddloc == false) {
                        $locationID = $locationexists;
                        $db->addLocation($locationID, $collaborationID);
                    }
                    if ($data->hiddensearchloc == false) {
                        $db->addLocationSearch($locationcity, $locationbookingfee, $locationdescript, $collaborationID);
                    }
                    if ($data->hiddenaddmember == false) {
                        $userID = $userexists;
                        $db->addTeamMember($tmrole, $userID, $collaborationID);
                    }
                    if ($data->hiddensearchmember == false) {
                        $db->addTeamMemberSearch($tmsearchrole, $tmbookingfee, $tmdescription, $collaborationID);
                    }
                    $useraction = 'Submit Collaboration';
                    $db->LogUserRequest($useraction);
                    http_response_code(201);
                }
            } else {
                http_response_code(412);
            }

        } else {
            $useraction = 'Failed Submit Collaboration';
            $db->LogUserRequest($useraction);
            http_response_code(401);
        }
    } // end addcolab

    if ($_GET['getData'] == 'nulluser') {
        http_response_code(401);
    }

if ($_GET['getData'] == 'testdata') {
         $json = file_get_contents('php://input');
         $data = json_decode($json);
         $state = $data->state;
         $result = $db->checkState($state);
    }


// } else {
//     http_response_code(501);
//     die;
// }

if (isset($result)) {
    echo json_encode($result);
}
