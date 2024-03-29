<?php
class dbObj {
private $dbconn;
public function __construct()
{
    $dbusername = "root";
    $dbpassword = "root";
    try {
        $this->dbconn = new PDO("mysql:host=localhost;dbname=letscollab", $dbusername, $dbpassword);
        $this->dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->dbconn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addLogin($username, $password)
{
    try {
        $stmt = $this->dbconn->prepare("INSERT INTO Login(Username, Password)
        VALUES (:uname, :upass)");
        $stmt->bindValue(':uname', $username);
        $stmt->bindValue(':upass', $password);
        $stmt->execute();

        $loginID = $this->dbconn->lastInsertId();
        return $loginID;

    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addUserAccount($firstname, $lastname, $email, $bio, $profilepic, $ighandle, $portfoliourl, $loginID)
{

    try {
        
        $stmt = $this->dbconn->prepare("INSERT INTO User(FirstName, LastName, Email, Bio, ProfilePicture, InstagramHandle, PortfolioURl, LoginID)
        VALUES (:fname, :lname, :email, :bio, :ppic, :ig, :url, :lID)");
        $stmt->bindValue(':fname', $firstname);
        $stmt->bindValue(':lname', $lastname);
        $stmt->bindValue(':email', $email);
        $stmt->bindValue(':bio', $bio);
        $stmt->bindValue(':ppic', $profilepic);
        $stmt->bindValue(':ig', $ighandle);
        $stmt->bindValue(':url', $portfoliourl);
        $stmt->bindValue(':lID', $loginID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function addLocationAccount($name, $address, $city, $state, $postcode, $email, $description, $profilepic, $ighandle, $websiteurl, $loginID)
{

    try {
        
        $stmt = $this->dbconn->prepare("INSERT INTO Location(Name, Address, City, State, PostCode, Email, Description, ProfilePicture, InstagramHandle, WebsiteURl, LoginID)
        VALUES (:name, :add, :cty, :state, :pcode, :email, :descript, :ppic, :ig, :url, :lID)");
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':add', $address);
        $stmt->bindValue(':cty', $city);
        $stmt->bindValue(':state', $state);
        $stmt->bindValue(':pcode', $postcode);
        $stmt->bindValue(':email', $email);
        $stmt->bindValue(':descript', $description);
        $stmt->bindValue(':ppic', $profilepic);
        $stmt->bindValue(':ig', $ighandle);
        $stmt->bindValue(':url', $websiteurl);
        $stmt->bindValue(':lID', $loginID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayUserProfile($userID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT * FROM User WHERE UserID = :uID');
        $stmt->bindValue(':uID', $userID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function displayLocationProfile($locationID)
{

    try {
        
        $stmt = $this->dbconn->prepare('SELECT * FROM Location WHERE LocationID = :lID');
        $stmt->bindValue(':lID', $locationID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayCollab($collaborationID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT Collaboration.CollaborationID, Collaboration.Title, Collaboration.Description, Collaboration.Date, LocationSearch.LocationSearchID, LocationSearch.LocationBookingFee, LocationSearch.City, LocationSearch.LocationDescription, TeamMemberSearch.TeamMemberSearchID, TeamMemberSearch.Role, TeamMemberSearch.TeamMemberBookingFee, TeamMemberSearch.TeamMemberDescription FROM ((Collaboration LEFT JOIN TeamMemberSearch ON Collaboration.CollaborationID = TeamMemberSearch.CollaborationID)LEFT JOIN LocationSearch ON Collaboration.CollaborationID = LocationSearch.CollaborationID) WHERE Collaboration.CollaborationID = :cID');
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function displayCollabs()
{
    try {
        $stmt = $this->dbconn->prepare("SELECT Collaboration.CollaborationID, Collaboration.Title, Collaboration.Description, LocationSearch.LocationSearchID, LocationSearch.LocationBookingFee, LocationSearch.City, TeamMemberSearch.TeamMemberSearchID, TeamMemberSearch.Role, TeamMemberSearch.TeamMemberBookingFee FROM ((Collaboration LEFT JOIN TeamMemberSearch ON Collaboration.CollaborationID = TeamMemberSearch.CollaborationID)LEFT JOIN LocationSearch ON Collaboration.CollaborationID = LocationSearch.CollaborationID) WHERE LocationSearch.SearchStatus = 'In Progress' OR TeamMemberSearch.SearchStatus = 'In Progress'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addCollab($title, $description, $datetime, $userID)
{

    try {
        
        $locationID = null;
        $status = 'Open';
        $stmt = $this->dbconn->prepare("INSERT INTO Collaboration(Title, Description, Date, Status, LocationID, UserID)
        VALUES (:ttle, :dscrpt, :date, :stat, :lID, :uID)");
        $stmt->bindValue(':ttle', $title);
        $stmt->bindValue(':dscrpt', $description);
        $stmt->bindValue(':date', $datetime);
        $stmt->bindValue(':stat', $status);
        $stmt->bindValue(':lID', $locationID);
        $stmt->bindValue(':uID', $userID);
        $stmt->execute();
        $collaborationID = $this->dbconn->lastInsertId();
        return $collaborationID;

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function checkUserReg($username)
{
    try {
        
        $stmt = $this->dbconn->prepare("SELECT Username FROM Login WHERE Username =:user");
        $stmt->bindValue(":user", $username);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll();
            return $retVal;
        } else {
            return false;
        }

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function checkLocation($locationusername)
{
    try {
        
        $stmt = $this->dbconn->prepare("SELECT Location.LocationID FROM Location INNER JOIN Login ON Location.LoginID = Login.LoginID WHERE Login.Username =:user");
        $stmt->bindValue(":user", $locationusername);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            $locationID = $retVal["LocationID"];
            return $locationID;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function checkUser($tmusername)
{
    try {
        
        $stmt = $this->dbconn->prepare("SELECT User.UserID FROM User INNER JOIN Login ON User.LoginID = Login.LoginID WHERE Login.Username =:user");
        $stmt->bindValue(":user", $tmusername);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            $userID = $retVal["UserID"];
            return $userID;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addLocation($locationID, $collaborationID)
{
    try {
        
        $stmt = $this->dbconn->prepare("UPDATE Collaboration SET LocationID =:lID WHERE CollaborationID = :cID");
        $stmt->bindValue(':lID', $locationID);
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function addLocationSearch($locationcity, $locationbookingfee, $locationdescription, $collaborationID)
{
    try {
        
        $searchstatus = 'In Progress';
        $stmt = $this->dbconn->prepare("INSERT INTO LocationSearch(City, LocationBookingFee, LocationDescription, SearchStatus, CollaborationID)
    VALUES (:cty, :fee, :dscrpt, :sstat, :cID)");
        $stmt->bindValue(':cty', $locationcity);
        $stmt->bindValue(':fee', $locationbookingfee);
        $stmt->bindValue(':dscrpt', $locationdescription);
        $stmt->bindValue(':sstat', $searchstatus);
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function addTeamMember($role, $userID, $collaborationID)
{

    try {
        
        $stmt = $this->dbconn->prepare("INSERT INTO TeamMember(Role, UserID, CollaborationID)
        VALUES (:role, :uID, :cID)");
        $stmt->bindValue(':role', $role);
        $stmt->bindValue(':uID', $userID);
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function addTeamMemberSearch($tmsearchrole, $tmbookingfee, $tmdescription, $collaborationID)
{
    try {
        
        $searchstatus = 'In Progress';
        $stmt = $this->dbconn->prepare("INSERT INTO TeamMemberSearch(Role, TeamMemberBookingFee, TeamMemberDescription, SearchStatus, CollaborationID)
        VALUES (:role, :fee, :dscrpt, :sstat, :cID)");
        $stmt->bindValue(':role', $tmsearchrole);
        $stmt->bindValue(':fee', $tmbookingfee);
        $stmt->bindValue(':dscrpt', $tmdescription);
        $stmt->bindValue(':sstat', $searchstatus);
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }
}

function checkLocRequestUser($locationID, $locsearchID)
{
    try {
        
        $stmt = $this->dbconn->prepare("SELECT LocationID FROM LocationRequest WHERE LocationID =:lID AND LocationSearchID =:lsID");
        $stmt->bindValue(":lID", $locationID);
        $stmt->bindValue(":lsID", $locsearchID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            return true;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function checkTeamRequestUser($userID, $tmsearchID)
{
    try {
        
        $stmt = $this->dbconn->prepare("SELECT UserID FROM TeamMemberRequest WHERE UserID =:uID AND TeamMemberSearchID =:tmsID");
        $stmt->bindValue(":uID", $userID);
        $stmt->bindValue(":tmsID", $tmsearchID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            return true;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addTeamMemberRequest($tmsearchID, $userID)
{
    try {
        
        $requeststatus = 'Pending';
        $stmt = $this->dbconn->prepare("INSERT INTO TeamMemberRequest(RequestStatus, TeamMemberSearchID, UserID)
        VALUES (:rstat, :tmsID, :uID)");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':tmsID', $tmsearchID);
        $stmt->bindValue(':uID', $userID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function approveTeamMemberRequest($tmrequestID)
{
    try {
        
        $requeststatus = 'Approved';
        $stmt = $this->dbconn->prepare("UPDATE TeamMemberRequest SET RequestStatus =:rstat WHERE TeamMemberRequestID = :tmrID");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':tmrID', $tmrequestID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function denyTeamMemberRequests($tmsearchID, $tmrequestID)
{
    try {
        
        $requeststatus = 'Denied';
        $stmt = $this->dbconn->prepare("UPDATE TeamMemberRequest SET RequestStatus =:rstat WHERE TeamMemberSearchID = :tmsID AND NOT TeamMemberRequestID = :tmrID");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':tmsID', $tmsearchID);
        $stmt->bindValue(':tmrID', $tmrequestID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function completeTeamMemberSearch($tmsearchID)
{
    try {
        
        $searchstatus = 'Complete';
        $stmt = $this->dbconn->prepare("UPDATE TeamMemberSearch SET SearchStatus =:sstat WHERE TeamMemberSearchID = :tmsID");
        $stmt->bindValue(':sstat', $searchstatus);
        $stmt->bindValue(':tmsID', $tmsearchID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function denyTeamMemberRequest($tmrequestID)
{
    try {
        
        $requeststatus = 'Denied';
        $stmt = $this->dbconn->prepare("UPDATE TeamMemberRequest SET RequestStatus =:rstat WHERE TeamMemberRequestID = :tmrID");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':tmrID', $tmrequestID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addLocationRequest($locationID, $locsearchID)
{

    try {
        
        $requeststatus = 'Pending';
        $stmt = $this->dbconn->prepare("INSERT INTO LocationRequest(RequestStatus, LocationID, LocationSearchID)
        VALUES (:rstat, :lID, :lsID)");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':lID', $locationID);
        $stmt->bindValue(':lsID', $locsearchID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function approveLocationRequest($locrequestID)
{
    try {
        
        $requeststatus = 'Approved';
        $stmt = $this->dbconn->prepare("UPDATE LocationRequest SET RequestStatus =:rstat WHERE LocationRequestID =:lrID");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':lrID', $locrequestID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function denyLocationRequests($locsearchID, $locrequestID)
{
    try {
        
        $requeststatus = 'Denied';
        $stmt = $this->dbconn->prepare("UPDATE LocationRequest SET RequestStatus =:rstat WHERE LocationSearchID =:lsID AND NOT LocationRequestID =:lrID");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':lsID', $locsearchID);
        $stmt->bindValue(':lrID', $locrequestID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function completeLocationSearch($locsearchID)
{
    try {
        
        $searchstatus = 'Complete';
        $stmt = $this->dbconn->prepare("UPDATE LocationSearch SET SearchStatus =:sstat WHERE LocationSearchID =:lsID");
        $stmt->bindValue(':sstat', $searchstatus);
        $stmt->bindValue(':lsID', $locsearchID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function denyLocationRequest($locrequestID)
{
    try {
        
        $requeststatus = 'Denied';
        $stmt = $this->dbconn->prepare("UPDATE LocationRequest SET RequestStatus =:rstat WHERE LocationRequestID =:lrID");
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->bindValue(':lrID', $locrequestID);
        $stmt->execute();

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayUserCollab($collaborationID)
{

    try {
        
        $stmt = $this->dbconn->prepare('SELECT Title, Description, Date FROM Collaboration WHERE CollaborationID = :cID');
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayTeam($collaborationID)
{

    try {
        
        $stmt = $this->dbconn->prepare('SELECT TeamMember.Role, User.FirstName, User.LastName, User.UserID FROM TeamMember INNER JOIN User ON TeamMember.UserID = User.UserID WHERE TeamMember.CollaborationID = :cID');
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function displayTeamMemberRequests($collaborationID)
{

    try {
        
        $requeststatus = 'Pending';
        $stmt = $this->dbconn->prepare('SELECT User.UserID, User.FirstName, User.LastName,  TeamMemberRequest.TeamMemberRequestID, TeamMemberRequest.TeamMemberSearchID,
        TeamMemberSearch.CollaborationID, TeamMemberSearch.Role FROM ((TeamMemberRequest LEFT JOIN User On TeamMemberRequest.UserID = User.UserID) LEFT JOIN TeamMemberSearch On TeamMemberRequest.TeamMemberSearchID = TeamMemberSearch.TeamMemberSearchID) WHERE TeamMemberSearch.CollaborationID = :cID AND TeamMemberRequest.RequestStatus = :rstat');
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayLocation($collaborationID)
{

    try {
        
        $stmt = $this->dbconn->prepare('SELECT Location.Name, Location.City, Location.State FROM Location INNER JOIN Collaboration ON Location.LocationID = Collaboration.LocationID WHERE Collaboration.CollaborationID = :cID');
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayLocationRequests($collaborationID)
{
    try {
        
        $requeststatus = 'Pending';
        $stmt = $this->dbconn->prepare('SELECT Location.LocationID, Location.Name, Location.City, Location.State, LocationRequest.LocationRequestID, LocationRequest.LocationSearchID, LocationSearch.CollaborationID FROM ((LocationRequest LEFT JOIN Location On LocationRequest.LocationID = Location.LocationID) LEFT JOIN LocationSearch On LocationRequest.LocationSearchID = LocationSearch.LocationSearchID) WHERE LocationSearch.CollaborationID = :cID AND LocationRequest.RequestStatus = :rstat');
        $stmt->bindValue(':cID', $collaborationID);
        $stmt->bindValue(':rstat', $requeststatus);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayUserLocationRequests($locationID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT Collaboration.Title, LocationRequest.LocationRequestID, LocationRequest.LocationSearchID, LocationRequest.LocationID, LocationRequest.RequestStatus, LocationSearch.CollaborationID FROM ((LocationSearch LEFT JOIN Collaboration On LocationSearch.CollaborationID = Collaboration.CollaborationID) LEFT JOIN LocationRequest On LocationSearch.LocationSearchID = LocationRequest.LocationSearchID) WHERE LocationRequest.LocationID = :lID');
        $stmt->bindValue(':lID', $locationID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayUserRequests($userID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT Collaboration.Title, TeamMemberRequest.TeamMemberRequestID, TeamMemberRequest.TeamMemberSearchID, TeamMemberRequest.UserID, TeamMemberRequest.RequestStatus, TeamMemberSearch.CollaborationID FROM ((TeamMemberSearch LEFT JOIN Collaboration On TeamMemberSearch.CollaborationID = Collaboration.CollaborationID) LEFT JOIN TeamMemberRequest On TeamMemberSearch.TeamMemberSearchID = TeamMemberRequest.TeamMemberSearchID) WHERE TeamMemberRequest.UserID = :uID');
        $stmt->bindValue(':uID', $userID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function displayUserCollabs($userID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT CollaborationID, Title FROM Collaboration WHERE UserID = :uID');
        $stmt->bindValue(':uID', $userID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $retVal;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function LogUserRequest($useraction)
{
    try {
        $useraddress = $_SERVER['REMOTE_ADDR'];
        $userbrowser = $_SERVER['HTTP_USER_AGENT'];
        // $userbrowser = get_browser(null, true);
        // $userbrowser = $userbrowser['browser'];
        $requesttime = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
        if (isset($_SESSION["loginID"])) {
            $sessionID = $_SESSION["loginID"];
        } else {
            $sessionID = null;
        }
        $stmt = $this->dbconn->prepare("INSERT INTO UserRequests(UserAction, UserAddress, UserBrowser, RequestTime, UserSessionID)
    VALUES (:uact, :uadd, :ubrs, :urt, :usid)");
        $stmt->bindValue(':uact', $useraction);
        $stmt->bindValue(':uadd', $useraddress);
        $stmt->bindValue(':ubrs', $userbrowser);
        $stmt->bindValue(':urt', $requesttime);
        $stmt->bindValue(':usid', $sessionID);
        $stmt->execute();
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function checkLogin($username)
{
    try {
        
        $stmt = $this->dbconn->prepare("SELECT Login.Username, Login.Password, Login.LoginID, User.UserID, Location.LocationID FROM ((Login LEFT JOIN User ON Login.LoginID = User.LoginID) LEFT JOIN Location ON Login.LoginID = Location.LoginID) WHERE Username =:user");
        $stmt->bindValue(":user", $username);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch();
            return $retVal;
        } else {
            return false;
        }

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function GetUserRequestCount($sessionID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT COUNT(*) AS RequestCount FROM UserRequests WHERE RequestTime >= NOW() - INTERVAL 1 DAY AND UserSessionID = :usid');
        $stmt->bindValue(':usid', $sessionID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            $requestcount = $retVal["RequestCount"];
            return $requestcount;
        } else {
            return 0;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function GetIPRequestCount()
{
    try {
        $useraddress = $_SERVER['REMOTE_ADDR'];
        $stmt = $this->dbconn->prepare('SELECT COUNT(*) AS RequestCount FROM UserRequests WHERE RequestTime >= NOW() - INTERVAL 1 DAY AND UserAddress = :uadd');
        $stmt->bindValue(':uadd', $useraddress);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            $requestcount = $retVal["RequestCount"];
            return $requestcount;
        } else {
            return 0;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function GetLastIPRequest()
{
    try {
        $useraddress = $_SERVER['REMOTE_ADDR'];
        $stmt = $this->dbconn->prepare('SELECT RequestTime From UserRequests WHERE UserAddress = :uadd ORDER BY RequestTime DESC LIMIT 1');
        $stmt->bindValue(':uadd', $useraddress);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            $requesttime = $retVal["RequestTime"];
            return $requesttime;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }

}

function GetLastUserRequest($sessionID)
{
    try {
        
        $stmt = $this->dbconn->prepare('SELECT RequestTime From UserRequests WHERE UserSessionID = :usid ORDER BY RequestTime DESC LIMIT 1');
        $stmt->bindValue(':usid', $sessionID);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
            $requesttime = $retVal["RequestTime"];
            return $requesttime;
        } else {
            return false;
        }
    } catch (PDOException $ex) {
        throw $ex;
    }
}

function inputFilter($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    $data = htmlentities($data);
    return $data;
}

function checkLength($tdata, $maxlength, $minlength) {
    if (strlen($tdata) < $minlength) {
        return false;
    } else if (strlen($tdata) > $maxlength) {
        return false;
    } else {
        return true;
    }
}

function checkEmail($email) {
if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
    return true;
} else {
    return false;
}
}

function checkPostCode($postcode) {
    if (filter_var($postcode, FILTER_VALIDATE_REGEXP,array("options"=>array("regexp"=>"/^[0-9]+$/")))) {
        return true;
    } else {
        return false;
    }
}

function checkState($state) {
    if (filter_var($state, FILTER_VALIDATE_REGEXP,array("options"=>array("regexp"=>"/^[A-Z]+$/")))) {
        return true;
    } else {
        return false;
    }
}

function checkBookingFee($fee, $minfee, $maxfee) {

if (filter_var($fee, FILTER_VALIDATE_FLOAT, ["options" => ["min_range" => $minfee , "max_range"=> $maxfee]])) {
    return true;
} else {
    return false;
}
}
}
?>









