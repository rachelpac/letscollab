<?php
include 'db.php';
if (isset($_GET['getData'])) {

    if ($_GET['getData'] == 'adduseracc') {

        if ((!isset($_POST['uname'])) || (!isset($_POST['pword'])) || (!isset($_POST['email'])) || (!isset($_POST['profilepic'])) || (!isset($_POST['ighandle'])) || (!isset($_POST['workurl'])) || ((!isset($_POST['checkadduseracc'])) && (!isset($_POST['checkaddlocationacc'])))) {
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
                    http_response_code(201);
                } else {
                    http_response_code(406);
                }
            }
        }
        if (isset($_POST['checkaddlocationacc'])) {
            if ((!isset($_POST['locname'])) || (!isset($_POST['locaddress'])) || (!isset($_POST['loccity'])) || (!isset($_POST['locstate'])) || (!isset($_POST['locpostcode'])) || (!isset($_POST['locdescript']))) {
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
                    http_response_code(201);
                } else {
                    http_response_code(406);
                }
            }
        }

    }

    if ($_GET['getData'] == 'addcollab') {
        if ((!isset($_POST['ctitle'])) || (!isset($_POST['cdescript'])) || (!isset($_POST['cdate'])) || (!isset($_POST['ctime'])) || (!isset($_POST['ownerrole'])) || (!isset($_POST['ownerid']))) {
            http_response_code(400);
        } else if ((isset($_POST['checkaddlocation'])) && (!isset($_POST['locationuname']))) {
            http_response_code(400);
        } else if ((isset($_POST['checksearchlocation'])) && ((!isset($_POST['lcity'])) || (!isset($_POST['lbookingfee'])) || (!isset($_POST['ldescript'])))) {
            http_response_code(400);
        } else if ((isset($_POST['checkaddmember'])) && ((!isset($_POST['tmuname'])) || (!isset($_POST['tmrole'])))) {
            http_response_code(400);
        } else if ((isset($_POST['checksearchmember'])) && ((!isset($_POST['tmsearchrole'])) || (!isset($_POST['tmbookingfee'])) || (!isset($_POST['tmdescript'])))) {
            http_response_code(400);
        } else {
            $title = $_POST['ctitle'];
            $description = $_POST['cdescript'];
            $date = $_POST['cdate'];
            $time = $_POST['ctime'];
            $datetime = $date . " " . $time;
            $datetime = date('Y-m-d H:i:s', strtotime($datetime));
            $ownerrole = $_POST['ownerrole'];
            $userID = $_POST['ownerid'];

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
            http_response_code(201);
        }
    }
    if ($_GET['getData'] == 'displaycollabs') {
        $result = displayCollabs();
    }

    if ($_GET['getData'] == 'displayuserprofile') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $userID = $data->userid;
        $result = displayUserProfile($userID);
    }

    if ($_GET['getData'] == 'displaylocprofile') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locationID = $data->locid;
        $result = displayLocationProfile($locationID);
    }

    if ($_GET['getData'] == 'addlocrequest') {
        if ((!isset($_POST['locrequest'])) || (!isset($_POST['locreqid']))) {
            http_response_code(400);
        } else {
            $locsearchID = $_POST['locrequest'];
            $locationID = $_POST['locreqid'];
            $locationrequestsent = checkLocRequestUser($locationID, $locsearchID);
            if (($locationrequestsent == false) && ($locationID != 'null')) {
                addLocationRequest($locationID, $locsearchID);
                http_response_code(201);
            } else {
                http_response_code(406);
            }
        }
    }

    if ($_GET['getData'] == 'addteamrequest') {
        if ((!isset($_POST['teamrequest'])) || (!isset($_POST['userreqid']))) {
            http_response_code(400);
        } else {
            $tmsearchID = $_POST['teamrequest'];
            $userID = $_POST['userreqid'];
            $tmrequestsent = checkTeamRequestUser($userID, $tmsearchID);
            if (($tmrequestsent == false) && ($userID != 'null')) {
                addTeamMemberRequest($tmsearchID, $userID);
                http_response_code(201);
            } else {
                http_response_code(406);
            }
        }

    }

    if ($_GET['getData'] == 'displayusercollabs') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $userID = $data->userid;
        $result = displayUserCollabs($userID);
    }

    if ($_GET['getData'] == 'displaycollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayCollab($collaborationID);
    }

    if ($_GET['getData'] == 'displayteam') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayTeam($collaborationID);
    }

    if ($_GET['getData'] == 'displaylocation') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayLocation($collaborationID);
    }

    if ($_GET['getData'] == 'displayusercollab') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayUserCollab($collaborationID);
    }

    if ($_GET['getData'] == 'displaylocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayLocationRequests($collaborationID);
    }

    if ($_GET['getData'] == 'displayteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $collaborationID = $data->collabid;
        $result = displayTeamMemberRequests($collaborationID);
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
        http_response_code(201);
    }

    if ($_GET['getData'] == 'denylocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locrequestID = $data->lrid;
        denyLocationRequest($locrequestID);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'denyteamrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $tmrequestID = $data->tmrid;
        denyTeamMemberRequest($tmrequestID);
        http_response_code(201);
    }

    if ($_GET['getData'] == 'displayuserlocrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $locationID = $data->locid;
        $result = displayUserLocationRequests($locationID);
    }

    if ($_GET['getData'] == 'displayuserrequests') {
        $json = file_get_contents('php://input');
        $data = json_decode($json);
        $userID = $data->userid;
        $result = displayUserRequests($userID);
    }

}

if (isset($result)) {
    echo json_encode($result);
} 
