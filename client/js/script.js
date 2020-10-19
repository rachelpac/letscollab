M.AutoInit();

sidelinks = document.querySelectorAll("#slide-out li");
bottomlinks = document.querySelectorAll("#bottom-nav li");
bottonicons = document.querySelectorAll('#bottom-nav i');

window.addEventListener("load", setMenu, false);

sidelinks[1].addEventListener("click", showBrowseCollab, false);
bottomlinks[0].addEventListener("click", showBrowseCollab, false);

sidelinks[2].addEventListener("click", showStartCollab, false);
bottomlinks[1].addEventListener("click", showStartCollab, false);

sidelinks[3].addEventListener("click", showUserCollab, false);
bottomlinks[2].addEventListener("click", showUserCollab, false);

sidelinks[4].addEventListener("click", showProfile, false);
bottomlinks[3].addEventListener("click", showProfile, false);

sidelinks[5].addEventListener("click", showSignup, false);
bottomlinks[4].addEventListener("click", showSignup, false);

sidelinks[6].addEventListener("click", showSettings, false);

function setMenu() {
    document.body.style.visibility = 'visible';
    if (!localStorage.getItem('selectedpage')) {
        localStorage.setItem('selectedpage', 'browsecollab');
    }
    if (localStorage.getItem('selectedpage') == 'browsecollab') {
        showBrowseCollab()
    }
    if (localStorage.getItem('selectedpage') == 'startcollab') {
        showStartCollab()
    }
    if (localStorage.getItem('selectedpage') == 'usercollab') {
        showUserCollab()
    }
    if (localStorage.getItem('selectedpage') == 'profile') {
        showProfile()
    }
    if (localStorage.getItem('selectedpage') == 'signup') {
        showSignup()
    }
    if (localStorage.getItem('selectedpage') == 'joincollab') {
        showJoinCollab()
    }
    if (localStorage.getItem('selectedpage') == 'settings') {
        showSettings()
    }
}

function hideSections() {
    startcollab.classList.add("hide");
    browsecollab.classList.add("hide");
    signup.classList.add("hide");
    profile.classList.add("hide");
    joincollab.classList.add("hide");
    usercollab.classList.add("hide");
    settings.classList.add("hide");
}

function unsetIconColour() {
    var icons = document.querySelectorAll('#bottom-nav i');
    for (var loop = 0; loop < icons.length; loop++) {
        icons[loop].style.color = 'white';
    }
}

loginbtn.addEventListener("click", submitLogin, false);
addlocbtn.addEventListener("click", submitLocationRequest, false);
jointeambtn.addEventListener("click", submitTeamRequest, false);

(function() {
    var links = document.querySelectorAll('#mycollab .btn-floating.btn-large.waves-effect.waves-light.red')
    for (var loop = 0; loop < links.length; loop++) {
        links[loop].addEventListener("click", denyRequest, false)
    }
})();

(function() {
    var links = document.querySelectorAll('#joinedcollab .btn-floating.btn-large.waves-effect.waves-light.red')
    for (var loop = 0; loop < links.length; loop++) {
        links[loop].addEventListener("click", withdrawRequest, false)
    }
})();

mycollabloc = document.querySelector('#mycollabloctbl tbody');
mycollabteam = document.querySelector('#mycollabteamtbl tbody');
mycollablocreq = document.querySelector('#mycollablocreqtbl tbody');
mycollabteamreq = document.querySelector('#mycollabteamreqtbl tbody');
myrequests = document.querySelector('#myreqtbl tbody');



function approveLocationRequest() {
    fetch('../api/api.php?getData=approvelocrequest')
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
        });
}

function approveTeamRequests() {
    fetch('../api/api.php?getData=approveteamrequests')
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
        });
}


profileIMG = document.querySelector("#profile img")
profileName = document.querySelector("#profile h5")
profileLinks = document.querySelectorAll('#profile .section p a')
profileInfo = document.querySelectorAll('#profile p')

function showProfile() {
    hideSections();
    unsetIconColour();
    profile.classList.remove("hide");
    localStorage.setItem('selectedpage', 'profile');
    bottonicons[3].style.color = 'black';

    fetch('../api/api.php?getData=displayuserprofile')
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            profileIMG.src = data.ProfilePicture;
            profileName.innerHTML = data.FirstName + " " + data.LastName;
            profileLinks[0].href = data.InstagramHandle;
            profileLinks[1].href = data.PortfolioURL;
            profileInfo[0].innerHTML = data.Email;
            profileInfo[1].innerHTML = "About" + " " + data.FirstName;
            profileInfo[2].innerHTML = data.Bio;
        });

}

function showSettings() {
    hideSections();
    unsetIconColour();
    settings.classList.remove("hide");
    localStorage.setItem('selectedpage', 'settings');
}


// function approveRequest() {
//     M.toast({ html: 'Collab Request Approved!', classes: 'green' });
// }

function denyRequest() {
    M.toast({ html: 'Collab Request Denied!', classes: 'red' });
}

function withdrawRequest() {
    M.toast({ html: 'Collab Request Withdrawn!', classes: 'yellow darken-4' });

}


function submitLogin() {
    M.toast({ html: 'You are now logged in!', classes: 'green' });
}


function submitLocationRequest() {
    var form = document.querySelector('#locrequestform');
    var formData = new FormData(form);
    fetch('../api/api.php?getData=addlocrequest', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(result => {
            console.log(result);
            // M.toast({ html: result.message, classes: result.colour });
        })
}

function submitTeamRequest() {
    var form = document.querySelector('#teamrequestform');
    var formData = new FormData(form);
    fetch('../api/api.php?getData=addteamrequest', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(result => {
            console.log(result);
            // M.toast({ html: result.message, classes: result.colour });
        })
}

// USER COLLAB 

function showUserCollab() {
    hideSections();
    unsetIconColour();
    usercollab.classList.remove("hide");
    localStorage.setItem('selectedpage', 'usercollab');
    bottonicons[2].style.color = 'black';
    var id = 1;
    console.log(id);
    const ucdata = { collabid: id };
    fetch('../api/api.php?getData=displaylocation', {
            method: 'POST',
            body: JSON.stringify(ucdata)
        })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            if (data == false) {
                mycollabloctbl.innerHTML =
                    '<tr>' +
                    '<td> Location search in progress </td>' +
                    '</tr>'
                fetch('../api/api.php?getData=displaylocrequests', {
                        method: 'POST',
                        body: JSON.stringify(ucdata)
                    })
                    .then((response) => response.json())
                    .then((data) => {
                        console.log(data);
                        data.forEach(row => {
                            mycollablocreq.innerHTML +=
                                '<tr>' +
                                '<td>' + row.Name + ' - ' + row.City + ', ' + row.State + '</td>' +
                                '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">location_on</i></a></td>' +
                                '<td><a id="approveloc' + row.LocationID + '" class="btn-floating btn-large waves-effect waves-light green"><i class="material-icons">done</i></a></td>' +
                                '<td><a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">clear</i></a></td>' +
                                '</tr>'

                        })
                    })
                    .then(() => {
                        approvelocbtns = document.querySelectorAll('#mycollablocreqtbl a.btn-floating.btn-large.waves-effect.waves-light.green');
                        for (var loop = 0; loop < approvelocbtns.length; loop++) {
                            approvelocbtns[loop].addEventListener("click", approveLocationRequest, false);
                        }
                    });
            } else {
                mycollabloc.innerHTML =
                    '<tr>' +
                    '<td>' + data.Name + ' - ' + data.City + ', ' + data.State + '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">location_on</i></a></td>' +
                    '</tr>'
                mycollablocreqtbl.innerHTML =
                    '<tr>' +
                    '<td> Location has been found </td>' +
                    '</tr>'
            }
        });

    fetch('../api/api.php?getData=displayteam', {
            method: 'POST',
            body: JSON.stringify(ucdata)
        })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            data.forEach(row => {
                mycollabteam.innerHTML +=
                    '<tr>' +
                    '<td>' + row.FirstName + " " + row.LastName + ' - ' + row.Role + '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">person</i></a></td>' +
                    '</tr>'

            })
        });

    fetch('../api/api.php?getData=displayteamrequests', {
            method: 'POST',
            body: JSON.stringify(ucdata)
        })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            data.forEach(row => {
                mycollabteamreq.innerHTML +=
                    '<tr>' +
                    '<td>' + row.FirstName + " " + row.LastName + ' - ' + row.Role + '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">person</i></a></td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light green"><i class="material-icons">done</i></a></td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">clear</i></a></td>' +
                    '</tr>'
            })
        })
        .then(() => {
            approveteambtns = document.querySelectorAll('#mycollabteamreqtbl a.btn-floating.btn-large.waves-effect.waves-light.green');
            for (var loop = 0; loop < approveteambtns.length; loop++) {
                approveteambtns[loop].addEventListener("click", approveTeamRequests, false);
            }
        });

    fetch('../api/api.php?getData=displayuserlocrequests')
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            data.forEach(row => {
                myrequests.innerHTML +=
                    '<tr>' +
                    '<td>' + row.Title + '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">send</i></a></td>' +
                    '<td>' +
                    '<p class="yellow-text text-darken-4">' + row.RequestStatus + '</p>' +
                    '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">clear</i></a></td>' +
                    '</tr>'
            })
        });


}

// BROWSE COLLABORATION 

function showBrowseCollab() {
    hideSections();
    unsetIconColour();
    browsecollab.classList.remove("hide");
    localStorage.setItem('selectedpage', 'browsecollab');
    bottonicons[0].style.color = 'black';
    fetch('../api/api.php?getData=displaycollabs')
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            var collabpost = document.querySelector('#browsecollab');
            if (data == false) {
                collabpost.innerHTML = '<p> No Collabs Found </p>';
            } else {
                data.forEach(row => {
                    collabpost.innerHTML +=
                        '<div class="collabpost">' +
                        '<div class="card teal darken-3">' +
                        '<div class="card-content white-text">' +
                        '<span class="card-title">' + row.Title + '</span>' +
                        '<p>' + row.Description + '</p>' +
                        '</div>' +
                        '<div class="card-content teal lighten-4">' +
                        '<div class="row">' +
                        '<div class="section ' + row.LocationSearchID + ' col s6">' +
                        '<h6> I NEED A LOCATION </h6>' +
                        '<p>' + row.City + ' - ' + row.LocationBookingFee + '</p>' +
                        '</div>' +
                        '<div class="section ' + row.TeamMemberSearchID + ' col s6">' +
                        '<h6> I NEED PEOPLE </h6>' +
                        '<p>' + row.Role + ' - ' + row.TeamMemberBookingFee + '</p>' +
                        '</div>' +
                        '</div>' +
                        '<button id="' + row.CollaborationID + '"class="btn waves-effect waves-light" type="button">JOIN<i class="material-icons right">send</i></button>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                })
            }
        })
        .then(() => {
            hidenullsearch = document.querySelectorAll('div .collabpost .section.null');
            for (var loop = 0; loop < hidenullsearch.length; loop++) {
                hidenullsearch[loop].classList.add("hide");
            }
        })

    .then(() => {
        collabbtns = document.querySelectorAll('.collabpost button');
        for (var loop = 0; loop < collabbtns.length; loop++) {
            collabbtns[loop].addEventListener("click", showJoinCollab, false);
        }
    });

}

// JOIN COLLABORATION 

collabSearchTitle = document.querySelector('#collabsearchinfo h5');
collabSearchInfo = document.querySelectorAll('#collabsearchinfo p');
locationSearchInfo = document.querySelectorAll('#locationsearchinfo p');
teamSearchInfo = document.querySelectorAll('#teamsearchinfo p');

locationSearchSection = document.querySelector('div #locationsearchinfo');
teamSearchSection = document.querySelector('div #teamsearchinfo');

collabloc = document.querySelector('#collabloctbl tbody');
collabteam = document.querySelector('#collabteamtbl tbody');

function showJoinCollab() {
    hideSections();
    unsetIconColour();
    joincollab.classList.remove("hide");
    localStorage.setItem('selectedpage', 'joincollab');
    var id = this.getAttribute('id')
    console.log(id);
    const cdata = { collabid: id };
    fetch('../api/api.php?getData=displaycollab', {
            method: 'POST',
            body: JSON.stringify(cdata)
        })
        .then(response => response.json())
        .then((data) => {
            console.log(data);
            collabSearchTitle.innerHTML = data.Title;
            collabSearchInfo[0].innerHTML = data.Date;
            collabSearchInfo[1].innerHTML = data.Description;
            locationSearchInfo[0].innerHTML = data.City;
            locationSearchInfo[1].innerHTML = data.LocationBookingFee;
            locationSearchInfo[2].innerHTML = data.LocationDescription;
            locrequest.value = data.LocationSearchID;
            teamSearchInfo[0].innerHTML = data.Role;
            teamSearchInfo[1].innerHTML = data.TeamMemberBookingFee;
            teamSearchInfo[2].innerHTML = data.TeamMemberDescription
            teamrequest.value = data.TeamMemberSearchID;

            if ((data.LocationSearchID == null) && (data.TeamMemberSearchID != null)) {
                locationSearchSection.classList.remove("hide");
                teamSearchSection.classList.remove("hide");
                locationSearchSection.classList.add("hide");
            }

            if ((data.TeamMemberSearchID == null) && (data.LocationSearchID != null)) {
                teamSearchSection.classList.remove("hide");
                locationSearchSection.classList.remove("hide");
                teamSearchSection.classList.add("hide");
            }

            if ((data.TeamMemberSearchID != null) && (data.LocationSearchID != null)) {
                teamSearchSection.classList.remove("hide");
                locationSearchSection.classList.remove("hide");
            }


        });

    fetch('../api/api.php?getData=displayteam', {
            method: 'POST',
            body: JSON.stringify(cdata)
        })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            data.forEach(row => {
                collabteam.innerHTML +=
                    '<tr>' +
                    '<td>' + row.FirstName + ' ' + row.LastName + ' - ' + row.Role + '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">person</i></a></td>' +
                    '</tr>'
            })

        });

    fetch('../api/api.php?getData=displaylocation', {
            method: 'POST',
            body: JSON.stringify(cdata)
        })
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            if (data == false) {
                collabloctbl.innerHTML =
                    '<tr>' +
                    '<td> Location Search In Progress</td>' +
                    '</tr>'
            } else {
                collabloc.innerHTML =
                    '<tr>' +
                    '<td>' + data.Name + ' - ' + data.City + ', ' + data.State + '</td>' +
                    '<td><a class="btn-floating btn-large waves-effect waves-light"><i class="material-icons">location_on</i></a></td>' +
                    '</tr>'
            }
        });

}


// CREATE COLLABORATION

function showStartCollab() {
    hideSections();
    unsetIconColour();
    startcollab.classList.remove("hide");
    localStorage.setItem('selectedpage', 'startcollab');
    bottonicons[1].style.color = 'black';
}

checkaddlocation.addEventListener("change", showAddLocation, false);
checksearchlocation.addEventListener("change", showSearchLocation, false);
checkaddmember.addEventListener("change", showAddMember, false);
checksearchmember.addEventListener("change", showSearchMember, false);

function showAddLocation() {
    if (checkaddlocation.checked) {
        addlocation.hidden = false;
        checksearchlocation.disabled = true;
    }
    if (!checkaddlocation.checked) {
        addlocation.hidden = true;
        checksearchlocation.disabled = false;
    }

    if ((checkaddlocation.checked || checksearchlocation.checked) && (checkaddmember.checked || checksearchmember.checked)) {
        submitcollabbtn.disabled = false;
    }

    if ((!checkaddlocation.checked && !checksearchlocation.checked) || (!checkaddmember.checked && !checksearchmember.checked)) {
        submitcollabbtn.disabled = true;
    }

}

function showSearchLocation() {
    if (checksearchlocation.checked) {
        searchlocation.hidden = false;
        checkaddlocation.disabled = true;
    }
    if (!checksearchlocation.checked) {
        searchlocation.hidden = true;
        checkaddlocation.disabled = false;
    }

    if ((checkaddlocation.checked || checksearchlocation.checked) && (checkaddmember.checked || checksearchmember.checked)) {
        submitcollabbtn.disabled = false;
    }

    if ((!checkaddlocation.checked && !checksearchlocation.checked) || (!checkaddmember.checked && !checksearchmember.checked)) {
        submitcollabbtn.disabled = true;
    }
}

function showAddMember() {
    if (checkaddmember.checked) {
        addmember.hidden = false;
    }
    if (!checkaddmember.checked) {
        addmember.hidden = true;
    }
    if ((checkaddlocation.checked || checksearchlocation.checked) && (checkaddmember.checked || checksearchmember.checked)) {
        submitcollabbtn.disabled = false;
    }
    if ((!checkaddlocation.checked && !checksearchlocation.checked) || (!checkaddmember.checked && !checksearchmember.checked)) {
        submitcollabbtn.disabled = true;
    }
}

function showSearchMember() {
    if (checksearchmember.checked) {
        searchmember.hidden = false;
    }
    if (!checksearchmember.checked) {
        searchmember.hidden = true;
    }
    if ((checkaddlocation.checked || checksearchlocation.checked) && (checkaddmember.checked || checksearchmember.checked)) {
        submitcollabbtn.disabled = false;
    }
    if ((!checkaddlocation.checked && !checksearchlocation.checked) || (!checkaddmember.checked && !checksearchmember.checked)) {
        submitcollabbtn.disabled = true;
    }
}

submitcollabbtn.addEventListener("click", submitCollab, false);

function submitCollab() {
    isdatavalid = validateCollab();
    if (isdatavalid == true) {
        var form = document.querySelector('#submitcollabform');
        var formData = new FormData(form);
        fetch('../api/api.php?getData=addcollab', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                console.log(response);
                if (response.status === 400) {
                    M.toast({ html: 'Collaboration could not be added', classes: 'red' });
                }
                if (response.status === 404) {
                    M.toast({ html: 'User not found and could not be added', classes: 'red' });
                }
                if (response.status === 200) {
                    M.toast({ html: 'Collaboration submitted', classes: 'green' });
                }
            });
    } else {
        M.toast({ html: 'Please fix errors', classes: 'red' });
    }
}

function validateCollab() {
    if ((!ctitle.validity.valid) || (!cdescript.validity.valid) || (!cdate.validity.valid) || (!ctime.validity.valid) || (!ownerrole.validity.valid)) {
        showErrorTitle();
        showErrorCollabDescription();
        showErrorDate();
        showErrorTime();
        showErrorOwnerRole();
        return false;
    } else if ((checkaddlocation.checked) && (!locationuname.validity.valid)) {
        showErrorLocationUsername();
        return false;
    } else if ((checksearchlocation.checked) && ((!lcity.validity.valid) || (!lbookingfee.validity.valid) || (!ldescript.validity.valid))) {
        showErrorLocationCity();
        showErrorLocationBookingFee();
        showErrorLocationSearchDescription();
        return false;
    } else if ((checkaddmember.checked) && ((!tmrole.validity.valid) || (!tmuname.validity.valid))) {
        showErrorTeamMemberRole();
        showErrorTeamMemberUsername();
        return false;
    } else if ((checksearchmember.checked) && ((!tmsearchrole.validity.valid) || (!tmbookingfee.validity.valid) || (!tmdescript.validity.valid))) {
        showErrorTeamMemberSearchRole();
        showErrorTeamMemberSearchDescription();
        showErrorTeamMemberBookingFee();
        return false;
    } else {
        return true;
    }
}



ctitle.addEventListener("blur", showErrorTitle, false);
cdescript.addEventListener("blur", showErrorCollabDescription, false);
cdate.addEventListener("blur", showErrorDate, false);
ctime.addEventListener("blur", showErrorTime, false);
locationuname.addEventListener("blur", showErrorLocationUsername, false);
lcity.addEventListener("blur", showErrorLocationCity, false);
lbookingfee.addEventListener("blur", showErrorLocationBookingFee, false);
ldescript.addEventListener("blur", showErrorLocationSearchDescription, false);
ownerrole.addEventListener("blur", showErrorOwnerRole, false);
tmrole.addEventListener("blur", showErrorTeamMemberRole, false);
tmuname.addEventListener("blur", showErrorTeamMemberUsername, false);
tmsearchrole.addEventListener("blur", showErrorTeamMemberSearchRole, false);
tmdescript.addEventListener("blur", showErrorTeamMemberSearchDescription, false);
tmbookingfee.addEventListener("blur", showErrorTeamMemberBookingFee, false);


function showErrorTitle() {
    if (ctitle.validity.valueMissing) {
        ctitleerror.setAttribute("data-error", "You must enter a Title");
    } else if (ctitle.validity.tooShort) {
        ctitleerror.setAttribute("data-error", "Title must be at least " + ctitle.minLength + " characters");
    } else if (ctitle.validity.tooLong) {
        ctitleerror.setAttribute("data-error", "Title can only be " + ctitle.maxLength + " characters");
    } else if (ctitle.validity.patternMismatch) {
        ctitleerror.setAttribute("data-error", "Title entered can only contain letters, spaces and - or ' ");
    } else {
        ctitleerror.setAttribute("data-success", "Title entered");
    }

}

function showErrorCollabDescription() {
    if (cdescript.validity.valueMissing) {
        cdescripterror.setAttribute("data-error", "You must enter a Description");
    } else {
        cdescripterror.setAttribute("data-success", "Description entered");
    }
}

function showErrorDate() {
    if (cdate.validity.valueMissing) {
        cdateerror.setAttribute("data-error", "You must select a Date");
    } else {
        cdateerror.setAttribute("data-success", "Date entered");
    }
}

function showErrorTime() {
    if (ctime.validity.valueMissing) {
        ctimeerror.setAttribute("data-error", "You must select a Time");
    } else {
        ctimeerror.setAttribute("data-success", "Time entered");
    }
}

function showErrorLocationUsername() {
    if (locationuname.validity.valueMissing) {
        locationunameerror.setAttribute("data-error", "You must enter a Username");
    } else if (locationuname.validity.tooShort) {
        locationunameerror.setAttribute("data-error", "Username must be at least " + locationuname.minLength + " characters");
    } else if (locationuname.validity.tooLong) {
        locationunameerror.setAttribute("data-error", "Username can only be " + locationuname.maxLength + " characters");
    } else {
        locationunameerror.setAttribute("data-success", "Username entered");
    }
}

function showErrorLocationCity() {
    if (lcity.validity.valueMissing) {
        lcityerror.setAttribute("data-error", "You must enter a City");
    } else if (lcity.validity.tooShort) {
        lcityerror.setAttribute("data-error", "City must be at least " + lcity.minLength + " characters");
    } else if (lcity.validity.tooLong) {
        lcityerror.setAttribute("data-error", "City can only be " + lcity.maxLength + " characters");
    } else if (lcity.validity.patternMismatch) {
        lcityerror.setAttribute("data-error", "City entered can only contain letters, spaces and - or ' ");
    } else {
        lcityerror.setAttribute("data-success", "City entered");
    }
}

function showErrorLocationBookingFee() {
    if (lbookingfee.validity.valueMissing) {
        lbookingfeeerror.setAttribute("data-error", "You must enter a Booking Fee");
    } else if (lbookingfee.validity.typeMismatch) {
        lbookingfeeerror.setAttribute("data-error", "Booking Fee can only contain digits");
    } else if (lbookingfee.validity.rangeUnderflow) {
        lbookingfeeerror.setAttribute("data-error", "Booking Fee must be a min of  " + lbookingfee.min);
    } else if (lbookingfee.validity.rangeOverflow) {
        lbookingfeeerror.setAttribute("data-error", "Booking Fee can only be a max of  " + lbookingfee.max);
    } else {
        lbookingfeeerror.setAttribute("data-success", "Booking Fee entered");
    }
}

function showErrorLocationSearchDescription() {
    if (ldescript.validity.valueMissing) {
        ldescripterror.setAttribute("data-error", "You must enter a Description");
    } else {
        ldescripterror.setAttribute("data-success", "Description entered");
    }
}

function showErrorOwnerRole() {
    if (ownerrole.validity.valueMissing) {
        ownerroleerror.setAttribute("data-error", "You must select a Role");
    } else {
        ownerroleerror.setAttribute("data-success", "Role selected");
    }
}

function showErrorTeamMemberRole() {
    if (tmrole.validity.valueMissing) {
        tmroleerror.setAttribute("data-error", "You must select a Role");
    } else {
        tmroleerror.setAttribute("data-success", "Role selected");
    }
}

function showErrorTeamMemberUsername() {
    if (tmuname.validity.valueMissing) {
        tmunameerror.setAttribute("data-error", "You must enter a Username");
    } else if (tmuname.validity.tooShort) {
        tmunameerror.setAttribute("data-error", "Username must be at least " + tmuname.minLength + " characters");
    } else if (tmuname.validity.tooLong) {
        tmunameerror.setAttribute("data-error", "Username can only be " + tmuname.maxLength + " characters");
    } else {
        tmunameerror.setAttribute("data-success", "Username entered");
    }
}

function showErrorTeamMemberSearchRole() {
    if (tmsearchrole.validity.valueMissing) {
        tmsearchroleerror.setAttribute("data-error", "You must select a Role");
    } else {
        tmsearchroleerror.setAttribute("data-success", "Role selected");
    }
}

function showErrorTeamMemberSearchDescription() {
    if (tmdescript.validity.valueMissing) {
        tmdescripterror.setAttribute("data-error", "You must enter a Description");
    } else {
        tmdescripterror.setAttribute("data-success", "Description entered");
    }
}

function showErrorTeamMemberBookingFee() {
    if (tmbookingfee.validity.valueMissing) {
        tmbookingfeeerror.setAttribute("data-error", "You must enter a Booking Fee");
    } else if (tmbookingfee.validity.typeMismatch) {
        tmbookingfeeerror.setAttribute("data-error", "Booking Fee can only contain digits");
    } else if (tmbookingfee.validity.rangeUnderflow) {
        tmbookingfeeerror.setAttribute("data-error", "Booking Fee must be a min of  " + tmbookingfee.min);
    } else if (tmbookingfee.validity.rangeOverflow) {
        tmbookingfeeerror.setAttribute("data-error", "Booking Fee can only be a max of  " + tmbookingfee.max);
    } else {
        tmbookingfeeerror.setAttribute("data-success", "Booking Fee entered");
    }
}

// REGISTER USER

function showSignup() {
    hideSections();
    unsetIconColour();
    signup.classList.remove("hide");
    localStorage.setItem('selectedpage', 'signup');
    bottonicons[4].style.color = 'black';
}

checkadduseracc.addEventListener("change", showAddUserAcc, false);
checkaddlocationacc.addEventListener("change", showAddLocationAcc, false);


function showAddUserAcc() {
    if (checkadduseracc.checked) {
        adduseracc.hidden = false;
        checkaddlocationacc.disabled = true;
        signupbtn.disabled = false;
    }
    if (!checkadduseracc.checked) {
        adduseracc.hidden = true;
        checkaddlocationacc.disabled = false;
        signupbtn.disabled = true;
    }
}

function showAddLocationAcc() {
    if (checkaddlocationacc.checked) {
        addlocationacc.hidden = false;
        checkadduseracc.disabled = true;
        signupbtn.disabled = false;
    }
    if (!checkaddlocationacc.checked) {
        addlocationacc.hidden = true;
        checkadduseracc.disabled = false;
        signupbtn.disabled = true;
    }
}

agree.addEventListener("click", agreeTerms, false);
disagree.addEventListener("click", disagreeTerms, false);

function agreeTerms() {
    terms.setAttribute("checked", "checked");
}

function disagreeTerms() {
    terms.removeAttribute("checked", "checked");
}

signupbtn.addEventListener("click", registerUser, false);

function registerUser() {
    isdatavalid = validateUserReg();
    if (isdatavalid == true) {
        var form = document.querySelector('#signupform');
        var formData = new FormData(form);
        fetch('../api/api.php?getData=adduseracc', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                console.log(response);
                if (response.status === 400) {
                    M.toast({ html: 'Could not complete registration', classes: 'red' });
                }
                if (response.status === 406) {
                    M.toast({ html: 'User Already Exists', classes: 'red' });
                }
                if (response.status === 200) {
                    M.toast({ html: 'Thank you for signing up', classes: 'green' });
                }
            });
    } else {
        M.toast({ html: 'Please fix errors', classes: 'red' });
    }
}

uname.addEventListener("blur", showErrorUsername, false);
pword.addEventListener("blur", showErrorPassword, false);
cnfpword.addEventListener("blur", showErrorPasswordMatch, false);
email.addEventListener("blur", showErrorEmail, false);
profilepic.addEventListener("blur", showErrorProfilePic, false);
ighandle.addEventListener("blur", showErrorInstagramHandle, false);
workurl.addEventListener("blur", showErrorWorkUrl, false);
fname.addEventListener("blur", showErrorFirstName, false);
lname.addEventListener("blur", showErrorLastName, false);
bio.addEventListener("blur", showErrorBio, false);
locname.addEventListener("blur", showErrorLocationName, false);
locaddress.addEventListener("blur", showErrorAddress, false);
loccity.addEventListener("blur", showErrorCity, false);
locstate.addEventListener("blur", showErrorState, false);
locpostcode.addEventListener("blur", showErrorPostCode, false);
locdescript.addEventListener("blur", showErrorLocationDescription, false);

function validateUserReg() {
    if (checkadduseracc.checked) {
        if ((!uname.validity.valid) || (!pword.validity.valid) || (!cnfpword.validity.valid) || (pword.value !== cnfpword.value) || (!email.validity.valid) || (!profilepic.validity.valid) || (!ighandle.validity.valid) || (!workurl.validity.valid) || (!fname.validity.valid) || (!lname.validity.valid) || (!bio.validity.valid)) {
            showErrorUsername();
            showErrorPassword();
            showErrorPasswordMatch();
            showErrorEmail();
            showErrorProfilePic();
            showErrorInstagramHandle();
            showErrorWorkUrl();
            showErrorFirstName();
            showErrorLastName();
            showErrorBio();
        } else {
            return true;
        }
    }
    if (checkaddlocationacc.checked) {
        if ((!uname.validity.valid) || (!pword.validity.valid) || (!cnfpword.validity.valid) || (pword.value !== cnfpword.value) || (!email.validity.valid) || (!profilepic.validity.valid) || (!ighandle.validity.valid) || (!workurl.validity.valid) || (!locaddress.validity.valid) || (!loccity.validity.valid) || (!locstate.validity.valid) || (!locpostcode.validity.valid) || (!locdescript.validity.valid)) {
            showErrorUsername();
            showErrorPassword();
            showErrorPasswordMatch();
            showErrorEmail();
            showErrorProfilePic();
            showErrorInstagramHandle();
            showErrorWorkUrl();
            showErrorLocationName();
            showErrorAddress();
            showErrorCity();
            showErrorState();
            showErrorPostCode();
            showErrorLocationDescription();
        } else {
            return true;
        }

    }
}

function showErrorUsername() {
    if (uname.validity.valueMissing) {
        unameerror.setAttribute("data-error", "You must enter a Username");
    } else if (uname.validity.tooShort) {
        unameerror.setAttribute("data-error", "Username must be at least " + uname.minLength + " characters");
    } else if (uname.validity.tooLong) {
        unameerror.setAttribute("data-error", "Username can only be " + uname.maxLength + " characters");
    } else {
        unameerror.setAttribute("data-success", "Username entered");
    }
}

function showErrorPassword() {
    if (pword.validity.valueMissing) {
        pworderror.setAttribute("data-error", "You must enter a Password");
    } else if (pword.validity.tooShort) {
        pworderror.setAttribute("data-error", "Password must be at least " + pword.minLength + " characters");
    } else if (pword.validity.tooLong) {
        pworderror.setAttribute("data-error", "Password can only be " + pword.maxLength + " characters");
    } else if (pword.validity.patternMismatch) {
        pworderror.setAttribute("data-error", "Password must have 1 lowercase letter, 1 uppercase letter, 1 number, 1 special character (#?!@$%^&*-) and be at least 8 characters long");
    } else {
        pworderror.setAttribute("data-success", "Password entered");
    }
}

function showErrorPasswordMatch() {
    if (pword.value !== cnfpword.value) {
        cnfpworderror.setAttribute("data-error", "The Passwords do not match");
    } else {
        cnfpworderror.setAttribute("data-success", "Passwords match");
    }
}

function showErrorEmail() {
    if (email.validity.valueMissing) {
        emailerror.setAttribute("data-error", "You must enter a Email");
    } else if (email.validity.typeMismatch) {
        emailerror.setAttribute("data-error", "Entered value needs to be an email address");
    } else if (email.validity.tooShort) {
        emailerror.setAttribute("data-error", "Email must be at least " + email.minLength + " characters");
    } else if (email.validity.tooLong) {
        emailerror.setAttribute("data-error", "Email can only be " + email.maxLength + " characters");
    } else if (email.validity.patternMismatch) {
        emailerror.setAttribute("data-error", "Entered value not a valid email address");
    } else {
        emailerror.setAttribute("data-success", "Email entered");
    }
}

function showErrorProfilePic() {
    if (profilepic.validity.valueMissing) {
        profilepicerror.setAttribute("data-error", "You must add a Profile Pic");
    } else {
        profilepicerror.setAttribute("data-success", "Profile Pic added");
    }
}

function showErrorInstagramHandle() {
    if (ighandle.validity.valueMissing) {
        ighandleerror.setAttribute("data-error", "You must enter a Instagram Handle");
    } else if (ighandle.validity.tooLong) {
        ighandleerror.setAttribute("data-error", "Instagram Handle can only be " + ighandle.maxLength + " characters");
    } else {
        ighandleerror.setAttribute("data-success", "Instagram Handle entered");
    }
}

function showErrorWorkUrl() {
    if (workurl.validity.valueMissing) {
        workurlerror.setAttribute("data-error", "You must enter a Work Url");
    } else if (workurl.validity.tooLong) {
        workurlerror.setAttribute("data-error", "Work Url can only be " + workurl.maxLength + " characters");
    } else {
        workurlerror.setAttribute("data-success", "Work Url entered");
    }

}

function showErrorFirstName() {
    if (fname.validity.valueMissing) {
        fnameerror.setAttribute("data-error", "You must enter a First Name");
    } else if (fname.validity.tooShort) {
        fnameerror.setAttribute("data-error", "First Name must be at least " + fname.minLength + " characters");
    } else if (fname.validity.tooLong) {
        fnameerror.setAttribute("data-error", "First Name can only be " + fname.maxLength + " characters");
    } else if (fname.validity.patternMismatch) {
        fnameerror.setAttribute("data-error", "First Name entered can only contain letters, spaces and - or ' ");
    } else {
        fnameerror.setAttribute("data-success", "First Name entered");
    }

}

function showErrorLastName() {
    if (lname.validity.valueMissing) {
        lnameerror.setAttribute("data-error", "You must enter a Last Name");
    } else if (lname.validity.tooShort) {
        lnameerror.setAttribute("data-error", "Last Name must be at least " + lname.minLength + " characters");
    } else if (lname.validity.tooLong) {
        lnameerror.setAttribute("data-error", "Last Name can only be " + lname.maxLength + " characters");
    } else if (lname.validity.patternMismatch) {
        lnameerror.setAttribute("data-error", "Last Name entered can only contain letters, spaces and - or ' ");
    } else {
        lnameerror.setAttribute("data-success", "Last Name entered");
    }
}

function showErrorBio() {
    if (bio.validity.valueMissing) {
        bioerror.setAttribute("data-error", "You must enter a Bio");
    } else {
        bioerror.setAttribute("data-success", "Bio entered");
    }
}

function showErrorLocationName() {
    if (locname.validity.valueMissing) {
        locnameerror.setAttribute("data-error", "You must enter a Location Name");
    } else if (locname.validity.tooShort) {
        locnameerror.setAttribute("data-error", "Location Name must be at least " + locname.minLength + " characters");
    } else if (locname.validity.tooLong) {
        locnameerror.setAttribute("data-error", "Location Name can only be " + locname.maxLength + " characters");
    } else if (locname.validity.patternMismatch) {
        locnameerror.setAttribute("data-error", "Location Name entered can only contain letters, spaces and - or ' ");
    } else {
        locnameerror.setAttribute("data-success", "Location Name entered");
    }
}

function showErrorAddress() {
    if (locaddress.validity.valueMissing) {
        locaddresserror.setAttribute("data-error", "You must enter an Address");
    } else if (locaddress.validity.tooShort) {
        locaddresserror.setAttribute("data-error", "Address must be at least " + locaddress.minLength + " characters");
    } else if (locaddress.validity.tooLong) {
        locaddresserror.setAttribute("data-error", "Address can only be " + locaddress.maxLength + " characters");
    } else if (locaddress.validity.patternMismatch) {
        locaddresserror.setAttribute("data-error", "Address entered can only contain letters, spaces and - or ' ");
    } else {
        locaddresserror.setAttribute("data-success", "Address entered");
    }
}

function showErrorCity() {
    if (loccity.validity.valueMissing) {
        loccityerror.setAttribute("data-error", "You must enter a City");
    } else if (loccity.validity.tooShort) {
        loccityerror.setAttribute("data-error", "City must be at least " + loccity.minLength + " characters");
    } else if (loccity.validity.tooLong) {
        loccityerror.setAttribute("data-error", "City can only be " + loccity.maxLength + " characters");
    } else if (loccity.validity.patternMismatch) {
        loccityerror.setAttribute("data-error", "City entered can only contain letters, spaces and - or ' ");
    } else {
        loccityerror.setAttribute("data-success", "City entered");
    }
}

function showErrorState() {
    if (locstate.validity.valueMissing) {
        locstateerror.setAttribute("data-error", "You must enter a State");
    } else if (locstate.validity.tooShort) {
        locstateerror.setAttribute("data-error", "State must be at least " + locstate.minLength + " characters");
    } else if (locstate.validity.tooLong) {
        locstateerror.setAttribute("data-error", "State can only be " + locstate.maxLength + " characters");
    } else if (locstate.validity.patternMismatch) {
        locstateerror.setAttribute("data-error", "State entered can only contain letters");
    } else {
        locstateerror.setAttribute("data-success", "State entered");
    }
}

function showErrorPostCode() {
    if (locpostcode.validity.valueMissing) {
        locpostcodeerror.setAttribute("data-error", "You must enter a Post Code");
    } else if (locpostcode.validity.typeMismatch) {
        locpostcodeerror.setAttribute("data-error", "Post Code can only contain digits");
    } else if (locpostcode.validity.rangeOverflow) {
        locpostcodeerror.setAttribute("data-error", "Post Code can only be a max of  " + locpostcode.max);
    } else {
        locpostcodeerror.setAttribute("data-success", "Post Code entered");
    }
}

function showErrorLocationDescription() {
    if (locdescript.validity.valueMissing) {
        locdescripterror.setAttribute("data-error", "You must enter a Location Description");
    } else {
        locdescripterror.setAttribute("data-success", "Location Description entered");
    }
}