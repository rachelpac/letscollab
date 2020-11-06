<?php

function dbConnect()
{
    $dbusername = "root";
    $dbpassword = "root";
    try {
        $conn = new PDO("mysql:host=localhost;dbname=letscollab", $dbusername, $dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        return $conn;
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        return $error_message;
    }
}

function checkLogin($username)
{
    try {
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT Login.Username, Login.Password, Login.LoginID, User.UserID, Location.LocationID FROM ((Login LEFT JOIN User ON Login.LoginID = User.LoginID) LEFT JOIN Location ON Login.LoginID = Location.LoginID) WHERE Username =:user");
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

function checkUserReg($username)
{
    try {
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT Username FROM Login WHERE Username =:user");
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

function addLogin($username, $password)
{
    try {
        $conn = dbConnect();
        $stmt = $conn->prepare("INSERT INTO Login(Username, Password)
        VALUES (:uname, :upass)");
        $stmt->bindValue(':uname', $username);
        $stmt->bindValue(':upass', $password);
        $stmt->execute();

        $loginID = $conn->lastInsertId();
        return $loginID;

    } catch (PDOException $ex) {
        throw $ex;
    }
}

function addUserAccount($firstname, $lastname, $email, $bio, $profilepic, $ighandle, $portfoliourl, $loginID)
{

    try {
        $conn = dbConnect();
        $stmt = $conn->prepare("INSERT INTO User(FirstName, LastName, Email, Bio, ProfilePicture, InstagramHandle, PortfolioURl, LoginID)
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
        $conn = dbConnect();
        $stmt = $conn->prepare("INSERT INTO Location(Name, Address, City, State, PostCode, Email, Description, ProfilePicture, InstagramHandle, WebsiteURl, LoginID)
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT * FROM User WHERE UserID = :uID');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT * FROM Location WHERE LocationID = :lID');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT Collaboration.CollaborationID, Collaboration.Title, Collaboration.Description, Collaboration.Date, LocationSearch.LocationSearchID, LocationSearch.LocationBookingFee, LocationSearch.City, LocationSearch.LocationDescription, TeamMemberSearch.TeamMemberSearchID, TeamMemberSearch.Role, TeamMemberSearch.TeamMemberBookingFee, TeamMemberSearch.TeamMemberDescription FROM ((Collaboration LEFT JOIN TeamMemberSearch ON Collaboration.CollaborationID = TeamMemberSearch.CollaborationID)LEFT JOIN LocationSearch ON Collaboration.CollaborationID = LocationSearch.CollaborationID) WHERE Collaboration.CollaborationID = :cID');
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
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT Collaboration.CollaborationID, Collaboration.Title, Collaboration.Description, LocationSearch.LocationSearchID, LocationSearch.LocationBookingFee, LocationSearch.City, TeamMemberSearch.TeamMemberSearchID, TeamMemberSearch.Role, TeamMemberSearch.TeamMemberBookingFee FROM ((Collaboration LEFT JOIN TeamMemberSearch ON Collaboration.CollaborationID = TeamMemberSearch.CollaborationID)LEFT JOIN LocationSearch ON Collaboration.CollaborationID = LocationSearch.CollaborationID) WHERE LocationSearch.SearchStatus = 'In Progress' OR TeamMemberSearch.SearchStatus = 'In Progress'");
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
        $conn = dbConnect();
        $locationID = null;
        $status = 'Open';
        $stmt = $conn->prepare("INSERT INTO Collaboration(Title, Description, Date, Status, LocationID, UserID)
        VALUES (:ttle, :dscrpt, :date, :stat, :lID, :uID)");
        $stmt->bindValue(':ttle', $title);
        $stmt->bindValue(':dscrpt', $description);
        $stmt->bindValue(':date', $datetime);
        $stmt->bindValue(':stat', $status);
        $stmt->bindValue(':lID', $locationID);
        $stmt->bindValue(':uID', $userID);
        $stmt->execute();
        $collaborationID = $conn->lastInsertId();
        return $collaborationID;

    } catch (PDOException $ex) {
        throw $ex;
    }

}

function checkLocation($locationusername)
{
    try {
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT Location.LocationID FROM Location INNER JOIN Login ON Location.LoginID = Login.LoginID WHERE Login.Username =:user");
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
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT User.UserID FROM User INNER JOIN Login ON User.LoginID = Login.LoginID WHERE Login.Username =:user");
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
        $conn = dbConnect();
        $stmt = $conn->prepare("UPDATE Collaboration SET LocationID =:lID WHERE CollaborationID = :cID");
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
        $conn = dbConnect();
        $searchstatus = 'In Progress';
        $stmt = $conn->prepare("INSERT INTO LocationSearch(City, LocationBookingFee, LocationDescription, SearchStatus, CollaborationID)
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
        $conn = dbConnect();
        $stmt = $conn->prepare("INSERT INTO TeamMember(Role, UserID, CollaborationID)
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
        $conn = dbConnect();
        $searchstatus = 'In Progress';
        $stmt = $conn->prepare("INSERT INTO TeamMemberSearch(Role, TeamMemberBookingFee, TeamMemberDescription, SearchStatus, CollaborationID)
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
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT LocationID FROM LocationRequest WHERE LocationID =:lID AND LocationSearchID =:lsID");
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
        $conn = dbConnect();
        $stmt = $conn->prepare("SELECT UserID FROM TeamMemberRequest WHERE UserID =:uID AND TeamMemberSearchID =:tmsID");
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
        $conn = dbConnect();
        $requeststatus = 'Pending';
        $stmt = $conn->prepare("INSERT INTO TeamMemberRequest(RequestStatus, TeamMemberSearchID, UserID)
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
        $conn = dbConnect();
        $requeststatus = 'Approved';
        $stmt = $conn->prepare("UPDATE TeamMemberRequest SET RequestStatus =:rstat WHERE TeamMemberRequestID = :tmrID");
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
        $conn = dbConnect();
        $requeststatus = 'Denied';
        $stmt = $conn->prepare("UPDATE TeamMemberRequest SET RequestStatus =:rstat WHERE TeamMemberSearchID = :tmsID AND NOT TeamMemberRequestID = :tmrID");
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
        $conn = dbConnect();
        $searchstatus = 'Complete';
        $stmt = $conn->prepare("UPDATE TeamMemberSearch SET SearchStatus =:sstat WHERE TeamMemberSearchID = :tmsID");
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
        $conn = dbConnect();
        $requeststatus = 'Denied';
        $stmt = $conn->prepare("UPDATE TeamMemberRequest SET RequestStatus =:rstat WHERE TeamMemberRequestID = :tmrID");
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
        $conn = dbConnect();
        $requeststatus = 'Pending';
        $stmt = $conn->prepare("INSERT INTO LocationRequest(RequestStatus, LocationID, LocationSearchID)
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
        $conn = dbConnect();
        $requeststatus = 'Approved';
        $stmt = $conn->prepare("UPDATE LocationRequest SET RequestStatus =:rstat WHERE LocationRequestID =:lrID");
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
        $conn = dbConnect();
        $requeststatus = 'Denied';
        $stmt = $conn->prepare("UPDATE LocationRequest SET RequestStatus =:rstat WHERE LocationSearchID =:lsID AND NOT LocationRequestID =:lrID");
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
        $conn = dbConnect();
        $searchstatus = 'Complete';
        $stmt = $conn->prepare("UPDATE LocationSearch SET SearchStatus =:sstat WHERE LocationSearchID =:lsID");
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
        $conn = dbConnect();
        $requeststatus = 'Denied';
        $stmt = $conn->prepare("UPDATE LocationRequest SET RequestStatus =:rstat WHERE LocationRequestID =:lrID");
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT Title, Description, Date FROM Collaboration WHERE CollaborationID = :cID');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT TeamMember.Role, User.FirstName, User.LastName FROM TeamMember INNER JOIN User ON TeamMember.UserID = User.UserID WHERE TeamMember.CollaborationID = :cID');
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
        $conn = dbConnect();
        $requeststatus = 'Pending';
        $stmt = $conn->prepare('SELECT User.UserID, User.FirstName, User.LastName,  TeamMemberRequest.TeamMemberRequestID, TeamMemberRequest.TeamMemberSearchID,
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT Location.Name, Location.City, Location.State FROM Location INNER JOIN Collaboration ON Location.LocationID = Collaboration.LocationID WHERE Collaboration.CollaborationID = :cID');
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
        $conn = dbConnect();
        $requeststatus = 'Pending';
        $stmt = $conn->prepare('SELECT Location.LocationID, Location.Name, Location.City, Location.State, LocationRequest.LocationRequestID, LocationRequest.LocationSearchID, LocationSearch.CollaborationID FROM ((LocationRequest LEFT JOIN Location On LocationRequest.LocationID = Location.LocationID) LEFT JOIN LocationSearch On LocationRequest.LocationSearchID = LocationSearch.LocationSearchID) WHERE LocationSearch.CollaborationID = :cID AND LocationRequest.RequestStatus = :rstat');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT Collaboration.Title, LocationRequest.LocationRequestID, LocationRequest.LocationSearchID, LocationRequest.LocationID, LocationRequest.RequestStatus, LocationSearch.CollaborationID FROM ((LocationSearch LEFT JOIN Collaboration On LocationSearch.CollaborationID = Collaboration.CollaborationID) LEFT JOIN LocationRequest On LocationSearch.LocationSearchID = LocationRequest.LocationSearchID) WHERE LocationRequest.LocationID = :lID');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT Collaboration.Title, TeamMemberRequest.TeamMemberRequestID, TeamMemberRequest.TeamMemberSearchID, TeamMemberRequest.UserID, TeamMemberRequest.RequestStatus, TeamMemberSearch.CollaborationID FROM ((TeamMemberSearch LEFT JOIN Collaboration On TeamMemberSearch.CollaborationID = Collaboration.CollaborationID) LEFT JOIN TeamMemberRequest On TeamMemberSearch.TeamMemberSearchID = TeamMemberRequest.TeamMemberSearchID) WHERE TeamMemberRequest.UserID = :uID');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT CollaborationID, Title FROM Collaboration WHERE UserID = :uID');
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
        $conn = dbConnect();
        $useraddress = $_SERVER['REMOTE_ADDR'];
        $userbrowser = get_browser(null, true);
        $userbrowser = $userbrowser['browser'];
        $requesttime = date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']);
        if (isset($_SESSION["loginID"])) {
            $sessionID = $_SESSION["loginID"];
            $_SESSION["requestcounter"]++;
        } else {
            $sessionID = null;
        }
        $stmt = $conn->prepare("INSERT INTO UserRequests(UserAction, UserAddress, UserBrowser, RequestTime, UserSessionID)
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

function GetLastIPRequest()
{
    try {
        $conn = dbConnect();
        $useraddress = $_SERVER['REMOTE_ADDR'];
        $stmt = $conn->prepare('SELECT RequestTime From UserRequests WHERE UserAddress = :uadd ORDER BY RequestTime DESC LIMIT 1');
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
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT RequestTime From UserRequests WHERE UserSessionID = :usid ORDER BY RequestTime DESC LIMIT 1');
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

function checkCurrentRequest($lastrequest, $currentrequest)
{

    $currentrequest = new DateTime($currentrequest);
    $lastrequest = new DateTime($lastrequest);
    $timesincelastrequest = $currentrequest->diff($lastrequest);

    $yeardiff = $timesincelastrequest->y;
    $monthdiff = $timesincelastrequest->m;
    $daydiff = $timesincelastrequest->d;
    $hourdiff = $timesincelastrequest->h;
    $mindiff = $timesincelastrequest->i;
    $secdiff = $timesincelastrequest->s;

    if (($yeardiff == 0) && ($monthdiff == 0) && ($daydiff == 0) && ($hourdiff == 0) && ($mindiff == 0) && ($secdiff < 3)) {
        return false;
    } else {
        return true;
    }

}

function GetUserRequestCount($sessionID)
{
    try {
        $conn = dbConnect();
        $stmt = $conn->prepare('SELECT COUNT(*) AS RequestCount FROM UserRequests WHERE RequestTime >= NOW() - INTERVAL 1 DAY AND UserSessionID = :usid');
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
        $conn = dbConnect();
        $useraddress = $_SERVER['REMOTE_ADDR'];
        $stmt = $conn->prepare('SELECT COUNT(*) AS RequestCount FROM UserRequests WHERE RequestTime >= NOW() - INTERVAL 1 DAY AND UserAddress = :uadd');
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

function CheckIPRequestCount($requestsmade)
{
    $maxrequests = 200;
    $requestsleft = $maxrequests - $requestsmade;
    if ($requestsleft > 0) {
        return true;
    } else {
        return false;
    }

}

function CheckUserRequestCount()
{
    $maxrequests = 200;
    $starttime = $_SESSION["starttime"];
    $endtime = $_SESSION["endtime"];
    $currentime = new DateTime();

    if ($currentime < $endtime) {
        $requestsmade = $_SESSION["requestcounter"];
    } else {
        $_SESSION["requestcounter"] = 0;
        $requestsmade = $_SESSION["requestcounter"];
    }

    $requestsleft = $maxrequests - $requestsmade;

    if ($requestsleft > 0) {
        return true;
    } else {
        return false;
    }

}

function CheckRefer() {
$valideferdomain = 'localhost';
if(isset($_SESSION["domainallowed"]) && ($_SESSION['domainallowed'] == true)) {
    return true;
} else {
    $domain =  $_SERVER['HTTP_REFERER'];
    $domainref = parse_url($domain, PHP_URL_HOST);
    if ($domainref == $valideferdomain) {
        $_SESSION['domainallowed'] == true;
        return true;
    } else {
        return false;
    }
}
}
