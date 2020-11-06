<?php
include 'ses.php';
if (isset($_GET['getData'])) {

    if ($_GET['getData'] == 'adduseracc') {
        if (!isset($_SESSION['loggedin'])) {
            $lastrequest = GetLastIPRequest();
            $currentrequest = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
            $isrequestok = checkCurrentRequest($lastrequest, $currentrequest);
            if ($isrequestok == false) {
                http_response_code(412);
            } else {
                if ((!isset($_POST['uname'])) || (!isset($_POST['pword'])) || (!isset($_POST['email'])) || (!isset($_POST['profilepic'])) || (!isset($_POST['ighandle'])) || (!isset($_POST['workurl'])) || ((!isset($_POST['checkadduseracc'])) && (!isset($_POST['checkaddlocationacc'])))) {
                    $useraction = 'Failed Register Account';
                    LogUserRequest($useraction);
                    http_response_code(400);
                } else {
                    $username = $_POST['uname'];
                    $password = $_POST['pword'];
                    $email = $_POST['email'];
                    $profilepic = $_POST['profilepic'];
                    $ighandle = $_POST['ighandle'];
                    $workurl = $_POST['workurl'];
                    $hpassword = password_hash($password, PASSWORD_DEFAULT);
                }
                if (isset($_POST['checkadduseracc'])) {
                    if ((!isset($_POST['fname'])) || (!isset($_POST['lname'])) || (!isset($_POST['bio']))) {
                        $useraction = 'Failed Register Account';
                        LogUserRequest($useraction);
                        http_response_code(400);
                    } else {
                        $firstname = $_POST['fname'];
                        $lastname = $_POST['lname'];
                        $bio = $_POST['bio'];
                        $userexists = checkUserReg($username);
                        if ($userexists == false) {
                            $insertlogin = addLogin($username, $hpassword);
                            $loginID = $insertlogin;
                            addUserAccount($firstname, $lastname, $email, $bio, $profilepic, $ighandle, $workurl, $loginID);
                            $useraction = 'Register Account';
                            LogUserRequest($useraction);
                            http_response_code(201);
                        } else {
                            $useraction = 'Failed Register Account';
                            LogUserRequest($useraction);
                            http_response_code(406);
                        }
                    }
                }
                if (isset($_POST['checkaddlocationacc'])) {
                    if ((!isset($_POST['locname'])) || (!isset($_POST['locaddress'])) || (!isset($_POST['loccity'])) || (!isset($_POST['locstate'])) || (!isset($_POST['locpostcode'])) || (!isset($_POST['locdescript']))) {
                        $useraction = 'Failed Register Account';
                        LogUserRequest($useraction);
                        http_response_code(400);
                    } else {
                        $name = $_POST['locname'];
                        $address = $_POST['locaddress'];
                        $city = $_POST['loccity'];
                        $state = $_POST['locstate'];
                        $postcode = $_POST['locpostcode'];
                        $description = $_POST['locdescript'];
                        if ($userexists == false) {
                            $insertlogin = addLogin($username, $hpassword);
                            $loginID = $insertlogin;
                            addLocationAccount($name, $address, $city, $state, $postcode, $email, $description, $profilepic, $ighandle, $workurl, $loginID);
                            $useraction = 'Register Account';
                            LogUserRequest($useraction);
                            http_response_code(201);
                        } else {
                            $useraction = 'Failed Register Account';
                            LogUserRequest($useraction);
                            http_response_code(406);
                        }
                    }
                }
            }
        } else {
            http_response_code(409);
        }

    } // end adduseracc

    if ($_GET['getData'] == 'addcollab') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["userID"]))) {
            $lastrequest = GetLastUserRequest($_SESSION["loginID"]);
            $currentrequest = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
            $isrequestok = checkCurrentRequest($lastrequest, $currentrequest);
            if ($isrequestok == false) {
                http_response_code(412);
            } else {
                if ((!isset($_POST['ctitle'])) || (!isset($_POST['cdescript'])) || (!isset($_POST['cdate'])) || (!isset($_POST['ctime'])) || (!isset($_POST['ownerrole']))) {
                    $useraction = 'Failed Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checkaddlocation'])) && (!isset($_POST['locationuname']))) {
                    $useraction = 'Failed Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checksearchlocation'])) && ((!isset($_POST['lcity'])) || (!isset($_POST['lbookingfee'])) || (!isset($_POST['ldescript'])))) {
                    $useraction = 'Failed Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checkaddmember'])) && ((!isset($_POST['tmuname'])) || (!isset($_POST['tmrole'])))) {
                    $useraction = 'Failed Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(400);
                } else if ((isset($_POST['checksearchmember'])) && ((!isset($_POST['tmsearchrole'])) || (!isset($_POST['tmbookingfee'])) || (!isset($_POST['tmdescript'])))) {
                    $useraction = 'Failed Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(400);
                } else {
                    $title = $_POST['ctitle'];
                    $description = $_POST['cdescript'];
                    $date = $_POST['cdate'];
                    $time = $_POST['ctime'];
                    $datetime = $date . " " . $time;
                    $datetime = date('Y-m-d H:i:s', strtotime($datetime));
                    $ownerrole = $_POST['ownerrole'];
                    $userID = $_SESSION["userID"];

                    if (isset($_POST['checkaddlocation'])) {
                        $locationusername = $_POST['locationuname'];
                        $locationexists = checkLocation($locationusername);
                    }

                    if (isset($_POST['checkaddmember'])) {
                        $tmusername = $_POST['tmuname'];
                        $tmrole = $_POST['tmrole'];
                        $userexists = checkUser($tmusername);
                    }

                    if (isset($_POST['checksearchlocation'])) {
                        $locationcity = $_POST['lcity'];
                        $locationbookingfee = $_POST['lbookingfee'];
                        $locationdescript = $_POST['ldescript'];
                    }

                    if (isset($_POST['checksearchmember'])) {
                        $tmsearchrole = $_POST['tmsearchrole'];
                        $tmbookingfee = $_POST['tmbookingfee'];
                        $tmdescription = $_POST['tmdescript'];
                    }
                }

                if (((isset($_POST['checkaddlocation'])) && ($locationexists == false)) || ((isset($_POST['checkaddmember'])) && ($userexists == false))) {
                    $useraction = 'Failed Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(404);
                } else {
                    $insertcollab = addCollab($title, $description, $datetime, $userID);
                    $collaborationID = $insertcollab;
                    addTeamMember($ownerrole, $userID, $collaborationID);

                    if (isset($_POST['checkaddlocation'])) {
                        $locationID = $locationexists;
                        addLocation($locationID, $collaborationID);
                    }
                    if (isset($_POST['checksearchlocation'])) {
                        addLocationSearch($locationcity, $locationbookingfee, $locationdescript, $collaborationID);
                    }
                    if (isset($_POST['checkaddmember'])) {
                        $userID = $userexists;
                        addTeamMember($tmrole, $userID, $collaborationID);
                    }
                    if (isset($_POST['checksearchmember'])) {
                        addTeamMemberSearch($tmsearchrole, $tmbookingfee, $tmdescription, $collaborationID);
                    }
                    $useraction = 'Submit Collaboration';
                    LogUserRequest($useraction);
                    http_response_code(201);
                }
            }

        } else {
            $useraction = 'Failed Submit Collaboration';
            LogUserRequest($useraction);
            http_response_code(401);
        }
    } // end addcolab

    if ($_GET['getData'] == 'displaycollabs') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true)) {
            $lastrequest = GetLastUserRequest($_SESSION["loginID"]);
            $isrequestleft = CheckUserRequestCount();
        } else {
            $lastrequest = GetLastIPRequest();
            $requestsmade = GetIPRequestCount();
            $isrequestleft = CheckIPRequestCount($requestsmade);
        }
        $currentrequest = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
        $isrequestok = checkCurrentRequest($lastrequest, $currentrequest);
        if (($isrequestok == false) || ($isrequestleft == false)) {
            http_response_code(412);
        } else {
            http_response_code(200);
            $result = displayCollabs();
            $useraction = 'Browse Collaborations';
            LogUserRequest($useraction);
        }

    }

    if ($_GET['getData'] == 'displayuserprofile') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["userID"]))) {
            $lastrequest = GetLastUserRequest($_SESSION["loginID"]);
            $currentrequest = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
            $isrequestok = checkCurrentRequest($lastrequest, $currentrequest);
            if ($isrequestok == false) {
                http_response_code(412);
            } else {
                $userID = $_SESSION["userID"];
                $result = displayUserProfile($userID);
                $useraction = 'Load Profile';
                LogUserRequest($useraction);
                http_response_code(200);
            }

        } else {
            $useraction = 'Failed Load Profile';
            LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'displaylocprofile') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["locationID"]))) {
            $locationID = $_SESSION["locationID"];
            $result = displayLocationProfile($locationID);
            $useraction = 'Load Profile';
            LogUserRequest($useraction);
            http_response_code(200);
        } else {
            $useraction = 'Failed Load Profile';
            LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'addlocrequest') {
        if ((!isset($_POST['locrequest'])) || (!isset($_POST['locreqid']))) {
            http_response_code(400);
        } else {
            $locsearchID = $_POST['locrequest'];
            $locationID = $_POST['locreqid'];
            if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && ($_SESSION["locationID"] == $locationID)) {
                $locationrequestsent = checkLocRequestUser($locationID, $locsearchID);
                if ($locationrequestsent == false) {
                    addLocationRequest($locationID, $locsearchID);
                    $useraction = 'Submit Location Request';
                    LogUserRequest($useraction);
                    http_response_code(201);
                } else {
                    $useraction = 'Failed Submit Location Request';
                    LogUserRequest($useraction);
                    http_response_code(406);
                }
            } else {
                $useraction = 'Failed Submit Location Request';
                LogUserRequest($useraction);
                http_response_code(401);
            }
        }
    }

    if ($_GET['getData'] == 'addteamrequest') {
        if ((!isset($_POST['teamrequest'])) || (!isset($_POST['userreqid']))) {
            $useraction = 'Failed Submit Team Member Request';
            LogUserRequest($useraction);
            http_response_code(400);
        } else {
            $tmsearchID = $_POST['teamrequest'];
            $userID = $_POST['userreqid'];
            if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && ($_SESSION["userID"] == $userID)) {
                $tmrequestsent = checkTeamRequestUser($userID, $tmsearchID);
                if ($tmrequestsent == false) {
                    addTeamMemberRequest($tmsearchID, $userID);
                    $useraction = 'Submit Team Member Request';
                    LogUserRequest($useraction);
                    http_response_code(201);
                } else {
                    $useraction = 'Failed Submit Team Member Request';
                    LogUserRequest($useraction);
                    http_response_code(406);
                }
            } else {
                $useraction = 'Failed Submit Team Member Request';
                LogUserRequest($useraction);
                http_response_code(401);
            }
        }

    }

    if ($_GET['getData'] == 'displayusercollabs') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["userID"]))) {
            $userID = $_SESSION["userID"];
            $result = displayUserCollabs($userID);
            $useraction = 'Load User Collaborations';
            LogUserRequest($useraction);
        } else {
            $useraction = 'Failed Load User Collaborations';
            LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'displaycollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayCollab($collaborationID);
        $useraction = 'Load User Collaboration Details';
        LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displayteam') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayTeam($collaborationID);
        $useraction = 'Load Collaboration Team';
        LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displaylocation') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayLocation($collaborationID);
        $useraction = 'Load Collaboration Location';
        LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displayusercollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayUserCollab($collaborationID);
        $useraction = 'Load User Collaboration Details';
        LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displaylocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayLocationRequests($collaborationID);
        $useraction = 'Load Collaboration Location Requests';
        LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'displayteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayTeamMemberRequests($collaborationID);
        $useraction = 'Load Collaboration Team Requests';
        LogUserRequest($useraction);
    }

    if ($_GET['getData'] == 'approvelocrequest') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locationID = $data->lid;
        $collaborationID = $data->cid;
        $locrequestID = $data->lrid;
        $locsearchID = $data->lsid;
        addLocation($locationID, $collaborationID);
        approveLocationRequest($locrequestID);
        denyLocationRequests($locsearchID, $locrequestID);
        completeLocationSearch($locsearchID);
        $useraction = 'Approve Collaboration Location Requests';
        LogUserRequest($useraction);
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
        addTeamMember($role, $userID, $collaborationID);
        approveTeamMemberRequest($tmrequestID);
        denyTeamMemberRequests($tmsearchID, $tmrequestID);
        completeTeamMemberSearch($tmsearchID);
        $useraction = 'Approve Collaboration Team Requests';
        LogUserRequest($useraction);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'denylocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locrequestID = $data->lrid;
        denyLocationRequest($locrequestID);
        $useraction = 'Deny Collaboration Location Requests';
        LogUserRequest($useraction);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'denyteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $tmrequestID = $data->tmrid;
        denyTeamMemberRequest($tmrequestID);
        $useraction = 'Deny Collaboration Team Requests';
        LogUserRequest($useraction);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'displayuserlocrequests') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["locationID"]))) {
            $locationID = $_SESSION["locationID"];
            $result = displayUserLocationRequests($locationID);
            $useraction = 'Load User Location Requests';
            LogUserRequest($useraction);
        } else {
            $useraction = 'Failed Load User Location Requests';
            LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    if ($_GET['getData'] == 'displayuserrequests') {
        if ((isset($_SESSION['loggedin'])) && ($_SESSION['loggedin'] == true) && (isset($_SESSION["userID"]))) {
            $userID = $_SESSION["userID"];
            $result = displayUserRequests($userID);
            $useraction = 'Load User Team Requests';
            LogUserRequest($useraction);
        } else {
            $useraction = 'Failed Load User Team Requests';
            LogUserRequest($useraction);
            http_response_code(401);
        }
    }

    // if ($_GET['getData'] == 'showdata') {
    //     $valideferdomain = 'localhost';
    //     $domain =  $_SERVER['HTTP_REFERER'];
    //     $domainref = parse_url($domain, PHP_URL_HOST);
    //     $result = Array('vd'=>$valideferdomain, 'd'=>$domain, 'dr'=>$domainref);
    // }

}

if (isset($result)) {
    echo json_encode($result);
}
