import React, { useState, Component } from "react";
import ReactDOM from "react-dom";
import "./index.css";
import "materialize-css/dist/css/materialize.min.css";
import M from "materialize-css";

class Loader extends Component {
  render() {
    return (
      <div id="profile" className="container">
        <div className="preloader-wrapper small active">
          <div className="spinner-layer spinner-blue-only">
            <div className="circle-clipper left">
              <div className="circle"></div>
            </div>
            <div className="gap-patch">
              <div className="circle"></div>
            </div>
            <div className="circle-clipper right">
              <div className="circle"></div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

class TopNav extends Component {
  componentDidMount() {
    M.AutoInit();
  }
  render() {
    return (
      <nav className="teal">
        <div className="nav-wrapper">
          <a href="#" className="brand-logo">
            Let's Collab
          </a>
          <a href="#" data-target="slide-out" className="sidenav-trigger">
            <i className="material-icons">menu</i>
          </a>
        </div>
      </nav>
    );
  }
}

function Navigation() {
  const menuitem = [
    { id: "browsecollab", name: "Browse Collaborations", icon: "search" },
    { id: "startcollab", name: "Start Collaboration", icon: "add" },
    { id: "usercollab", name: "My Collaborations", icon: "group" },
    { id: "profile", name: "My Profile", icon: "person" },
    { id: "signup", name: "Sign Up/ Login", icon: "login" },
  ];

  const [viewMenuItem, setMenuItem] = useState("browsecollab");

  return (
    <>
      <TopNav />
      <ul id="slide-out" className="sidenav">
        <li>
          <div className="user-view">
            <div className="background teal"></div>
            <a href="#">
              <img
                className="circle"
                src="images/profile.png"
                alt="profile picture"
              />
            </a>
            <a href="#">
              <span className="white-text name">John Doe</span>
            </a>
            <a href="#">
              <span className="white-text email">jdoe@gmail.com</span>
            </a>
          </div>
        </li>
        {menuitem.map((item) => (
          <li key={item.id}>
            <a href="#" onClick={() => setMenuItem(item.id)}>
              <i className="material-icons">{item.icon}</i>
              {item.name}
            </a>
          </li>
        ))}
      </ul>

      {viewMenuItem === "browsecollab" ? (
        <BrowseCollabs />
      ) : viewMenuItem === "startcollab" ? (
        <StartCollab />
      ) : viewMenuItem === "usercollab" ? (
        <UserCollab />
      ) : viewMenuItem === "profile" ? (
        <Profile />
      ) : viewMenuItem === "signup" ? (
        <SignUp />
      ) : (
        <h6>There was an issue loading the page</h6>
      )}

      <nav className="teal">
        <ul id="bottom-nav">
          {menuitem.map((item) => (
            <li key={item.id}>
              <a href="#" onClick={() => setMenuItem(item.id)}>
                <i className="material-icons">{item.icon}</i>
              </a>
            </li>
          ))}
        </ul>
      </nav>
    </>
  );
}

class BrowseCollabs extends Component {
  state = {
    loaded: false,
    collablist: [],
    response200: false,
    response412: false,
    collabinfo: [],
    teaminfo: [],
    locfound: false,
    locinfo: [],
    joincollabrequested: false,
    hiddenjoincollab: true,
    hiddenbrowsecollab: false,
  };

  componentDidMount() {
    M.AutoInit();
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaycollabs"
    ).then((response) => {
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
        this.setState({ loaded: true, response412: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          this.setState({ loaded: true, response200: true, collablist: data });
        });
      }
    });
  }

  addLocationRequest = (e) => {
    var locreqsearchid = e.currentTarget.getAttribute("loc-search-id");
    const lrdata = { lrsid: locreqsearchid };

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=reactaddlocrequest",
      {
        method: "POST",
        body: JSON.stringify(lrdata),
      }
    ).then((response) => {
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
      }
      if (response.status === 406) {
        M.toast({ html: "Location Request Already Submitted", classes: "red" });
      }
      if (response.status === 401) {
        M.toast({
          html:
            "You must be logged in as a Location Account to submit a Location Request",
          classes: "red",
        });
      }
      if (response.status === 400) {
        M.toast({ html: "Could not add Location Request", classes: "red" });
      }
      if (response.status === 201) {
        M.toast({ html: "Location Request Submitted", classes: "green" });
      }
    });
  };

  addTeamRequest = (e) => {
    var teamreqsearchid = e.currentTarget.getAttribute("tm-search-id");
    const tmrdata = { tmrsid: teamreqsearchid };

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=reactaddteamrequest",
      {
        method: "POST",
        body: JSON.stringify(tmrdata),
      }
    ).then((response) => {
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
      }
      if (response.status === 406) {
        M.toast({ html: "Team Request Already Submitted", classes: "red" });
      }
      if (response.status === 401) {
        M.toast({
          html:
            "You must be logged in as a User Account to submit a Team Request",
          classes: "red",
        });
      }
      if (response.status === 400) {
        M.toast({ html: "Could not add Team Request", classes: "red" });
      }
      if (response.status === 201) {
        M.toast({ html: "Team Request Submitted", classes: "green" });
      }
    });
  };

  showJoinCollab = (e) => {
    this.setState({
      joincollabrequested: true,
      hiddenjoincollab: false,
      hiddenbrowsecollab: true,
    });
    var id = e.currentTarget.getAttribute("id");

    const collabid = { collabid: id };
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaycollab",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        this.setState({ collabinfo: data });
      });

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displayteam",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        this.setState({ teaminfo: data });
      });

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaylocation",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        if (data === false) {
          this.setState({ locfound: false });
        } else {
          this.setState({ locfound: true, locinfo: data });
        }
      });
  };

  render() {
    const {
      loaded,
      response412,
      response200,
      collablist,
      collabinfo,
      teaminfo,
      locinfo,
      hiddenjoincollab,
      hiddenbrowsecollab,
    } = this.state;
    if (!loaded) {
      return <Loader />;
    } else if (response412) {
      return (
        <div id="browsecollab" className="container">
          <p>Too Many Requests</p>
        </div>
      );
    } else if (response200) {
      if (collablist === false) {
        return (
          <div id="browsecollab" className="container">
            <p>No Collaborations to Browse</p>
          </div>
        );
      } else {
        M.AutoInit();
        return (
          <>
            <div
              id="browsecollab"
              className="container"
              hidden={hiddenbrowsecollab}
            >
              {collablist.map((collab) => (
                <div key={collab.CollaborationID} className="collabpost">
                  <div className="card teal darken-3">
                    <div className="card-content white-text">
                      <span className="card-title">{collab.Title}</span>
                      <p>{collab.Description}</p>
                    </div>
                    <div className="card-content teal lighten-4">
                      <div className="row">
                        <div
                          className="section col s6"
                          loc-search-id={collab.LocationSearchID}
                        >
                          <h6> I NEED A LOCATION </h6>
                          <p>
                            {collab.City} - {collab.LocationBookingFee}
                          </p>
                        </div>
                        <div
                          className="section col s6"
                          tm-search-id={collab.TeamMemberSearchID}
                        >
                          <h6> I NEED PEOPLE </h6>
                          <p>
                            {collab.Role} - {collab.TeamMemberBookingFee}
                          </p>
                        </div>
                      </div>
                      <button
                        id={collab.CollaborationID}
                        className="btn waves-effect waves-light teal darken-3"
                        type="button"
                        onClick={this.showJoinCollab}
                      >
                        JOIN<i className="material-icons right">send</i>
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>

            {this.state.joincollabrequested ? (
              <div id="joincollab" hidden={hiddenjoincollab}>
                <div className="col s12">
                  <div className="teal">
                    <ul className="tabs tabs-transparent">
                      <li className="tab col s6">
                        <a href="#collabsearch">JOIN THE TEAM</a>
                      </li>
                      <li className="tab col s6">
                        <a href="#collabteam">CHECK OUT THE TEAM</a>
                      </li>
                    </ul>
                  </div>
                </div>

                <div className="container">
                  <div id="collabsearch">
                    <div id="collabsearchinfo" className="section">
                      <h5>{collabinfo.Title}</h5>
                      <p>{collabinfo.Date}</p>
                      <p>{collabinfo.Description}</p>
                    </div>

                    <div id="locationsearchinfo" className="section">
                      <h5>Have this location?</h5>
                      <div>
                        <p>{collabinfo.City}</p>
                        <p>{collabinfo.LocationBookingFee}</p>
                        <p>{collabinfo.LocationDescription}</p>
                        <button
                          id="addlocbtn"
                          className="btn waves-effect waves-light"
                          type="button"
                          loc-search-id={collabinfo.LocationSearchID}
                          onClick={this.addLocationRequest}
                        >
                          ADD LOCATION
                          <i className="material-icons right">send</i>
                        </button>
                      </div>
                    </div>

                    <div id="teamsearchinfo" className="section">
                      <h5> Sound like you?</h5>
                      <div>
                        <p>{collabinfo.Role}</p>
                        <p>{collabinfo.TeamMemberBookingFee}</p>
                        <p>{collabinfo.TeamMemberDescription}</p>
                        <button
                          id="jointeambtn"
                          className="btn waves-effect waves-light"
                          type="button"
                          tm-search-id={collabinfo.TeamMemberSearchID}
                          onClick={this.addTeamRequest}
                        >
                          JOIN COLLAB
                          <i className="material-icons right">send</i>
                        </button>
                      </div>
                    </div>
                  </div>

                  <div id="collabteam">
                    <h5>Check Out The Location</h5>
                    {this.state.locfound ? (
                      <table id="collabloctbl" className="highlight">
                        <thead>
                          <tr>
                            <th>Location</th>
                            <th>Profile</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                              {locinfo.Name} {locinfo.City} {locinfo.State}
                            </td>
                            <td>
                              <a className="btn-floating btn-large waves-effect waves-light">
                                <i className="material-icons">location_on</i>
                              </a>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    ) : (
                      <table id="collabloctbl" className="highlight">
                        <tbody>
                          <tr>
                            <td> Location search in progress </td>
                          </tr>
                        </tbody>
                      </table>
                    )}

                    <h5>Check Out The Team</h5>
                    <table id="collabteamtbl" className="highlight">
                      <thead>
                        <tr>
                          <th>Member</th>
                          <th>Profile</th>
                        </tr>
                      </thead>
                      <tbody>
                        {teaminfo.map((member) => (
                          <tr key={member.UserID}>
                            <td>
                              {member.FirstName} {member.LastName} {member.Role}
                            </td>
                            <td>
                              <a className="btn-floating btn-large waves-effect waves-light">
                                <i className="material-icons">person</i>
                              </a>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            ) : (
              <div id="joincollab" hidden={hiddenjoincollab}>
                <h6>Select A Collab to Join</h6>
              </div>
            )}
          </>
        );
      }
    }
  }
}

class StartCollab extends Component {
  constructor(props) {
    super(props);
    this.ctitleInput = React.createRef();
    this.cdescriptInput = React.createRef();
    this.cdateInput = React.createRef();
    this.ctimeInput = React.createRef();
    this.ownerroleInput = React.createRef();
    this.locationunameInput = React.createRef();
    this.tmunameInput = React.createRef();
    this.tmroleInput = React.createRef();
    this.lcityInput = React.createRef();
    this.lbookingfeeInput = React.createRef();
    this.ldescriptInput = React.createRef();
    this.tmsearchroleInput = React.createRef();
    this.tmbookingfeeInput = React.createRef();
    this.tmdescriptInput = React.createRef();
    this.checkaddlocationCheck = React.createRef();
    this.checksearchlocationCheck = React.createRef();
    this.checkaddmemberCheck = React.createRef();
    this.checksearchmemberCheck = React.createRef();
  }

  componentDidMount() {
    M.AutoInit();
  }

  state = {
    hiddenaddloc: true,
    disablesearchloc: false,
    hiddensearchloc: true,
    disableaddloc: false,
    hiddenaddmember: true,
    hiddensearchmember: true,

    ctitle: "",
    cdescript: "",
    cdate: "",
    ctime: "",
    ownerrole: "",
    locationuname: "",
    tmuname: "",
    tmrole: "",
    lcity: "",
    lbookingfee: "",
    ldescript: "",
    tmsearchrole: "",
    tmbookingfee: "",
    tmdescript: "",

    ctitleerror: "Error",
    cdescripterror: "Error",
    cdateerror: "Error",
    ctimeerror: "Error",
    ownerroleerror: "Error",
    locationunameerror: "",
    tmunameerror: "Error",
    tmroleerror: "Error",
    lcityerror: "Error",
    lbookingfeeerror: "Error",
    ldescripterror: "Error",
    tmsearchroleerror: "Error",
    tmbookingfeeerror: "Error",
    tmdescripterror: "Error",

    ctitlesuccess: "Success",
    cdescriptsuccess: "Success",
    cdatesuccess: "Success",
    ctimesuccess: "Success",
    ownerrolesuccess: "Success",
    locationunamesuccess: "",
    tmunamesuccess: "Success",
    tmrolesuccess: "Success",
    lcitysuccess: "Success",
    lbookingfeesuccess: "Success",
    ldescriptsuccess: "Success",
    tmsearchrolesuccess: "Success",
    tmbookingfeesuccess: "Success",
    tmdescriptsuccess: "Success",
  };

  toggleaddloc = () => {
    this.setState((prevState) => ({
      hiddenaddloc: !prevState.hiddenaddloc,
    }));
  };

  toggledisablesearchloc = () => {
    this.setState((prevState) => ({
      disablesearchloc: !prevState.disablesearchloc,
    }));
  };

  togglesearchloc = () => {
    this.setState((prevState) => ({
      hiddensearchloc: !prevState.hiddensearchloc,
    }));
  };

  toggledisableaddloc = () => {
    this.setState((prevState) => ({
      disableaddloc: !prevState.disableaddloc,
    }));
  };

  toggleaddmember = () => {
    this.setState((prevState) => ({
      hiddenaddmember: !prevState.hiddenaddmember,
    }));
  };

  togglesearchmember = () => {
    this.setState((prevState) => ({
      hiddensearchmember: !prevState.hiddensearchmember,
    }));
  };

  AddLocEvents = () => {
    this.toggleaddloc();
    this.toggledisablesearchloc();
  };

  SearchLocEvents = () => {
    this.togglesearchloc();
    this.toggledisableaddloc();
  };

  showErrorTitle() {
    const ctitle = this.ctitleInput.current;
    if (ctitle.validity.valueMissing) {
      this.setState({
        ctitleerror: "You must enter a Title",
        ctitlesuccess: "",
      });
    } else if (ctitle.validity.tooShort) {
      this.setState({
        ctitleerror:
          "Title must be at least " + ctitle.minLength + " characters",
        ctitlesuccess: "",
      });
    } else if (ctitle.validity.tooLong) {
      this.setState({
        ctitleerror: "Title can only be " + ctitle.maxLength + " characters",
        ctitlesuccess: "",
      });
    } else if (ctitle.validity.patternMismatch) {
      this.setState({
        ctitleerror:
          "Title entered can only contain letters, spaces and - or ' ",
        ctitlesuccess: "",
      });
    } else {
      this.setState({ ctitleerror: "", ctitlesuccess: "Title entered" });
    }
  }

  showErrorCollabDescription() {
    const cdescript = this.cdescriptInput.current;
    if (cdescript.validity.valueMissing) {
      this.setState({
        cdescripterror: "You must enter a Description",
        cdescriptsuccess: "",
      });
    } else {
      this.setState({
        cdescriptsuccess: "Description entered",
        cdescripterror: "",
      });
    }
  }

  showErrorDate() {
    const cdate = this.cdateInput.current;
    if (cdate.validity.valueMissing) {
      this.setState({ cdateerror: "You must select a Date", cdatesuccess: "" });
    } else {
      this.setState({ cdatesuccess: "Date selected", cdateerror: "" });
    }
  }

  showErrorTime() {
    const ctime = this.ctimeInput.current;
    if (ctime.validity.valueMissing) {
      this.setState({ ctimeerror: "You must select a Time", ctimesuccess: "" });
    } else {
      this.setState({ ctimesuccess: "Time selected", ctimeerror: "" });
    }
  }

  showErrorLocationUsername() {
    const locationuname = this.locationunameInput.current;
    if (locationuname.validity.valueMissing) {
      this.setState({
        locationunameerror: "You must enter a Username",
        locationunamesuccess: "",
      });
    } else if (locationuname.validity.tooShort) {
      this.setState({
        locationunameerror:
          "Username must be at least " +
          locationuname.minLength +
          " characters",
        locationunamesuccess: "",
      });
    } else if (locationuname.validity.tooLong) {
      this.setState({
        locationunameerror:
          "Username can only be " + locationuname.maxLength + " characters",
        locationunamesuccess: "",
      });
    } else {
      this.setState({
        locationunamesuccess: "Username entered",
        locationunameerror: "",
      });
    }
  }

  showErrorLocationCity() {
    const lcity = this.lcityInput.current;
    if (lcity.validity.valueMissing) {
      this.setState({ lcityerror: "You must enter a City", lcitysuccess: "" });
    } else if (lcity.validity.tooShort) {
      this.setState({
        lcityerror: "City must be at least " + lcity.minLength + " characters",
        lcitysuccess: "",
      });
    } else if (lcity.validity.tooLong) {
      this.setState({
        lcityerror: "City can only be " + lcity.maxLength + " characters",
        lcitysuccess: "",
      });
    } else if (lcity.validity.patternMismatch) {
      this.setState({
        lcityerror: "City entered can only contain letters, spaces and - or ' ",
        lcitysuccess: "",
      });
    } else {
      this.setState({ lcitysuccess: "City entered", lcityerror: "" });
    }
  }

  showErrorLocationBookingFee() {
    const lbookingfee = this.lbookingfeeInput.current;
    if (lbookingfee.validity.valueMissing) {
      this.setState({
        lbookingfeeerror: "You must enter a Booking Fee",
        lbookingfeesuccess: "",
      });
    } else if (lbookingfee.validity.typeMismatch) {
      this.setState({
        lbookingfeeerror: "Booking Fee can only contain digits",
        lbookingfeesuccess: "",
      });
    } else if (lbookingfee.validity.stepMismatch) {
      this.setState({
        lbookingfeeerror: "Booking Fee can only contain upto 2 decimal places",
        lbookingfeesuccess: "",
      });
    } else if (lbookingfee.validity.rangeUnderflow) {
      this.setState({
        lbookingfeeerror: "Booking Fee must be a min of  " + lbookingfee.min,
        lbookingfeesuccess: "",
      });
    } else if (lbookingfee.validity.rangeOverflow) {
      this.setState({
        lbookingfeeerror:
          "Booking Fee can only be a max of  " + lbookingfee.max,
        lbookingfeesuccess: "",
      });
    } else {
      this.setState({
        lbookingfeesuccess: "Booking Fee entered",
        lbookingfeeerror: "",
      });
    }
  }

  showErrorLocationSearchDescription() {
    const ldescript = this.ldescriptInput.current;
    if (ldescript.validity.valueMissing) {
      this.setState({
        ldescripterror: "You must enter a Description",
        ldescriptsuccess: "",
      });
    } else {
      this.setState({
        ldescriptsuccess: "Description entered",
        ldescripterror: "",
      });
    }
  }

  showErrorOwnerRole() {
    const ownerrole = this.ownerroleInput.current;
    if (ownerrole.validity.valueMissing) {
      this.setState({
        ownerroleerror: "You must select a Role",
        ownerrolesuccess: "",
      });
    } else {
      this.setState({ ownerrolesuccess: "Role selected ", ownerroleerror: "" });
    }
  }

  showErrorTeamMemberRole() {
    const tmrole = this.tmroleInput.current;
    if (tmrole.validity.valueMissing) {
      this.setState({
        tmroleerror: "You must select a Role",
        tmrolesuccess: "",
      });
    } else {
      this.setState({ tmrolesuccess: "Role selected ", tmroleerror: "" });
    }
  }

  showErrorTeamMemberUsername() {
    const tmuname = this.tmunameInput.current;
    if (tmuname.validity.valueMissing) {
      this.setState({
        tmunameerror: "You must enter a Username",
        tmunamesuccess: "",
      });
    } else if (tmuname.validity.tooShort) {
      this.setState({
        tmunameerror:
          "Username must be at least " + tmuname.minLength + " characters",
        tmunamesuccess: "",
      });
    } else if (tmuname.validity.tooLong) {
      this.setState({
        tmunameerror:
          "Username can only be " + tmuname.maxLength + " characters",
        tmunamesuccess: "",
      });
    } else {
      this.setState({ tmunamesuccess: "Username entered", tmunameerror: "" });
    }
  }

  showErrorTeamMemberSearchRole() {
    const tmsearchrole = this.tmsearchroleInput.current;
    if (tmsearchrole.validity.valueMissing) {
      this.setState({
        tmsearchroleerror: "You must select a Role",
        tmsearchrolesuccess: "",
      });
    } else {
      this.setState({
        tmsearchrolesuccess: "Role selected",
        tmsearchroleerror: "",
      });
    }
  }

  showErrorTeamMemberSearchDescription() {
    const tmdescript = this.tmdescriptInput.current;
    if (tmdescript.validity.valueMissing) {
      this.setState({
        tmdescripterror: "You must enter a Description",
        tmdescriptsuccess: "",
      });
    } else {
      this.setState({
        tmdescriptsuccess: "Description entered",
        tmdescripterror: "",
      });
    }
  }

  showErrorTeamMemberBookingFee() {
    const tmbookingfee = this.tmbookingfeeInput.current;
    if (tmbookingfee.validity.valueMissing) {
      this.setState({
        tmbookingfeeerror: "You must enter a Booking Fee",
        tmbookingfeesuccess: "",
      });
    } else if (tmbookingfee.validity.typeMismatch) {
      this.setState({
        tmbookingfeeerror: "Booking Fee can only contain digits",
        tmbookingfeesuccess: "",
      });
    } else if (tmbookingfee.validity.stepMismatch) {
      this.setState({
        tmbookingfeeerror: "Booking Fee can only contain upto 2 decimal places",
        tmbookingfeesuccess: "",
      });
    } else if (tmbookingfee.validity.rangeUnderflow) {
      this.setState({
        tmbookingfeeerror: "Booking Fee must be a min of  " + tmbookingfee.min,
        tmbookingfeesuccess: "",
      });
    } else if (tmbookingfee.validity.rangeOverflow) {
      this.setState({
        tmbookingfeeerror:
          "Booking Fee can only be a max of  " + tmbookingfee.max,
        tmbookingfeesuccess: "",
      });
    } else {
      this.setState({
        tmbookingfeesuccess: "Booking Fee entered",
        tmbookingfeeerror: "",
      });
    }
  }

  validateStartCollab() {
    const ctitle = this.ctitleInput.current;
    const cdescript = this.cdescriptInput.current;
    const cdate = this.cdateInput.current;
    const ctime = this.ctimeInput.current;
    const ownerrole = this.ownerroleInput.current;
    const locationuname = this.locationunameInput.current;
    const tmuname = this.tmunameInput.current;
    const tmrole = this.tmroleInput.current;
    const lcity = this.lcityInput.current;
    const lbookingfee = this.lbookingfeeInput.current;
    const ldescript = this.ldescriptInput.current;
    const tmsearchrole = this.tmsearchroleInput.current;
    const tmbookingfee = this.tmbookingfeeInput.current;
    const tmdescript = this.tmdescriptInput.current;

    const checkaddlocation = this.checkaddlocationCheck.current;
    const checksearchlocation = this.checksearchlocationCheck.current;
    const checkaddmember = this.checkaddmemberCheck.current;
    const checksearchmember = this.checksearchmemberCheck.current;

    if (
      !ctitle.validity.valid ||
      !cdescript.validity.valid ||
      !cdate.validity.valid ||
      !ctime.validity.valid ||
      !ownerrole.validity.valid
    ) {
      this.showErrorTitle();
      this.showErrorCollabDescription();
      this.showErrorDate();
      this.showErrorTime();
      this.showErrorOwnerRole();
      return false;
    } else if (checkaddlocation.checked && !locationuname.validity.valid) {
      this.showErrorLocationUsername();
      return false;
    } else if (
      checksearchlocation.checked &&
      (!lcity.validity.valid ||
        !lbookingfee.validity.valid ||
        !ldescript.validity.valid)
    ) {
      this.showErrorLocationCity();
      this.showErrorLocationBookingFee();
      this.showErrorLocationSearchDescription();
      return false;
    } else if (
      checkaddmember.checked &&
      (!tmrole.validity.valid || !tmuname.validity.valid)
    ) {
      this.showErrorTeamMemberRole();
      this.showErrorTeamMemberUsername();
      return false;
    } else if (
      checksearchmember.checked &&
      (!tmsearchrole.validity.valid ||
        !tmbookingfee.validity.valid ||
        !tmdescript.validity.valid)
    ) {
      this.showErrorTeamMemberSearchRole();
      this.showErrorTeamMemberSearchDescription();
      this.showErrorTeamMemberBookingFee();
      return false;
    } else {
      return true;
    }
  }

  onBlur = () => {
    this.setState({ cdate: this.cdateInput.current.value });
    this.setState({ ctime: this.ctimeInput.current.value });

    this.showErrorTitle();
    this.showErrorCollabDescription();
    this.showErrorDate();
    this.showErrorTime();
    this.showErrorLocationUsername();
    this.showErrorLocationCity();
    this.showErrorLocationBookingFee();
    this.showErrorLocationSearchDescription();
    this.showErrorOwnerRole();
    this.showErrorTeamMemberRole();
    this.showErrorTeamMemberUsername();
    this.showErrorTeamMemberSearchRole();
    this.showErrorTeamMemberSearchDescription();
    this.showErrorTeamMemberBookingFee();
  };

  onChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  onSubmit = (e) => {
    e.preventDefault();
    if (this.validateStartCollab() === true) {
      fetch(
        "http://localhost:8888/letscollab/letscollab/api/api.php?getData=reactaddcollab",
        {
          method: "POST",
          body: JSON.stringify(this.state),
        }
      ).then((response) => {
        if (response.status === 412) {
          M.toast({ html: "Too Many Requests", classes: "red" });
        }
        if (response.status === 401) {
          M.toast({
            html:
              "You must be logged in to a User Account to submit a collaboration",
            classes: "red",
          });
        }
        if (response.status === 400) {
          M.toast({ html: "Collaboration could not be added", classes: "red" });
        }
        if (response.status === 404) {
          M.toast({
            html: "User not found and could not be added",
            classes: "red",
          });
        }
        if (response.status === 201) {
          M.toast({ html: "Collaboration submitted", classes: "green" });
        }
      });
    } else {
      M.toast({ html: "Please fix errors", classes: "red" });
    }
  };

  render() {
    const {
      hiddenaddloc,
      disablesearchloc,
      hiddensearchloc,
      disableaddloc,
      hiddenaddmember,
      hiddensearchmember,
      ctitle,
      cdescript,
      cdate,
      ctime,
      ownerrole,
      locationuname,
      tmuname,
      tmrole,
      lcity,
      lbookingfee,
      ldescript,
      tmsearchrole,
      tmbookingfee,
      tmdescript,
      ctitleerror,
      cdescripterror,
      cdateerror,
      ctimeerror,
      ownerroleerror,
      locationunameerror,
      tmunameerror,
      tmroleerror,
      lcityerror,
      lbookingfeeerror,
      ldescripterror,
      tmsearchroleerror,
      tmbookingfeeerror,
      tmdescripterror,
      ctitlesuccess,
      cdescriptsuccess,
      cdatesuccess,
      ctimesuccess,
      ownerrolesuccess,
      locationunamesuccess,
      tmunamesuccess,
      tmrolesuccess,
      lcitysuccess,
      lbookingfeesuccess,
      ldescriptsuccess,
      tmsearchrolesuccess,
      tmbookingfeesuccess,
      tmdescriptsuccess,
    } = this.state;
    return (
      <>
        <div id="startcollab" className="container">
          <div className="row">
            <form
              id="submitcollabform"
              method="POST"
              onSubmit={this.onSubmit}
              className="col s12"
              noValidate
            >
              <fieldset>
                <legend>
                  Collaboration Details
                  <i className="small material-icons">info</i>
                </legend>
                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="ctitle"
                      name="ctitle"
                      value={ctitle}
                      onChange={this.onChange}
                      onBlur={this.onBlur}
                      ref={this.ctitleInput}
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="50"
                      pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                      required
                    />
                    <label htmlFor="ctitle">Collaboration Title</label>
                    <span
                      id="ctitleerror"
                      className="helper-text"
                      data-success={ctitlesuccess}
                      data-error={ctitleerror}
                    ></span>
                  </div>
                </div>
                <div className="row">
                  <div className="input-field col s12">
                    <textarea
                      id="cdescript"
                      name="cdescript"
                      value={cdescript}
                      onChange={this.onChange}
                      onBlur={this.onBlur}
                      ref={this.cdescriptInput}
                      className="materialize-textarea validate"
                      required
                    ></textarea>
                    <label htmlFor="cdescript">Collaboration Description</label>
                    <span
                      id="cdescripterror"
                      className="helper-text"
                      data-success={cdescriptsuccess}
                      data-error={cdescripterror}
                    ></span>
                  </div>
                </div>
              </fieldset>

              <fieldset>
                <legend>
                  When is the Collaboration?
                  <i className="small material-icons">today</i>
                </legend>
                <div className="row">
                  <div className="col s6">
                    <label htmlFor="cdate">Date</label>
                    <input
                      id="cdate"
                      name="cdate"
                      value={this.state.cdate}
                      onChange={this.onChange}
                      onBlur={this.onBlur}
                      ref={this.cdateInput}
                      type="text"
                      className="datepicker validate"
                      required
                    />
                    <span
                      id="cdateerror"
                      className="helper-text"
                      data-success={cdatesuccess}
                      data-error={cdateerror}
                    ></span>
                  </div>
                  <div className="col s6">
                    <label htmlFor="ctime">Time</label>
                    <input
                      id="ctime"
                      name="ctime"
                      value={this.state.ctime}
                      onChange={this.onChange}
                      onBlur={this.onBlur}
                      ref={this.ctimeInput}
                      type="text"
                      className="timepicker validate"
                      required
                    />
                    <span
                      id="ctimeerror"
                      className="helper-text"
                      data-success={ctimesuccess}
                      data-error={ctimeerror}
                    ></span>
                  </div>
                </div>
              </fieldset>

              <fieldset>
                <legend>
                  Where is the Collaboration?
                  <i className="small material-icons">place</i>
                </legend>
                <p>
                  <label htmlFor="checkaddlocation">
                    <input
                      id="checkaddlocation"
                      name="checkaddlocation"
                      type="checkbox"
                      className="filled-in"
                      onChange={this.AddLocEvents}
                      disabled={disableaddloc}
                      ref={this.checkaddlocationCheck}
                    />
                    <span>I have a location</span>
                  </label>
                </p>
                <fieldset id="addlocation" hidden={hiddenaddloc}>
                  <div className="row">
                    <div className="input-field col s12">
                      <input
                        id="locationuname"
                        name="locationuname"
                        value={locationuname}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.locationunameInput}
                        className="validate"
                        type="text"
                        minLength="5"
                        maxLength="30"
                        required
                      />
                      <label htmlFor="locationuname">Username</label>
                      <span
                        id="locationunameerror"
                        className="helper-text"
                        data-success={locationunamesuccess}
                        data-error={locationunameerror}
                      ></span>
                    </div>
                  </div>
                </fieldset>

                <p>
                  <label htmlFor="checksearchlocation">
                    <input
                      id="checksearchlocation"
                      name="checksearchlocation"
                      type="checkbox"
                      className="filled-in"
                      onChange={this.SearchLocEvents}
                      disabled={disablesearchloc}
                      ref={this.checksearchlocationCheck}
                    />
                    <span>I'm looking for a location</span>
                  </label>
                </p>

                <fieldset id="searchlocation" hidden={hiddensearchloc}>
                  <div className="row">
                    <div className="input-field col s12">
                      <input
                        id="lcity"
                        name="lcity"
                        value={lcity}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.lcityInput}
                        className="validate"
                        type="text"
                        minLength="2"
                        maxLength="255"
                        pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                        required
                      />
                      <label htmlFor="lcity">City</label>
                      <span
                        id="lcityerror"
                        className="helper-text"
                        data-success={lcitysuccess}
                        data-error={lcityerror}
                      ></span>
                    </div>
                  </div>

                  <div className="row">
                    <div className="input-field col s12">
                      <input
                        id="lbookingfee"
                        name="lbookingfee"
                        value={lbookingfee}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.lbookingfeeInput}
                        className="validate"
                        type="number"
                        min="0"
                        max="1000000"
                        step=".01"
                        required
                      />
                      <label htmlFor="lbookingfee">Booking Fee</label>
                      <span
                        id="lbookingfeeerror"
                        className="helper-text"
                        data-success={lbookingfeesuccess}
                        data-error={lbookingfeeerror}
                      ></span>
                    </div>
                  </div>

                  <div className="row">
                    <div className="input-field col s12">
                      <textarea
                        id="ldescript"
                        name="ldescript"
                        value={ldescript}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.ldescriptInput}
                        className="materialize-textarea validate"
                        required
                      ></textarea>
                      <label htmlFor="ldescript">Description</label>
                      <span
                        id="ldescripterror"
                        className="helper-text"
                        data-success={ldescriptsuccess}
                        data-error={ldescripterror}
                      ></span>
                    </div>
                  </div>
                </fieldset>
              </fieldset>

              <fieldset>
                <legend>
                  Collaboration Team
                  <i className="small material-icons">people_alt</i>
                </legend>
                <div className="row">
                  <div className="input-field col s12">
                    <select
                      id="ownerrole"
                      name="ownerrole"
                      value={ownerrole}
                      onChange={this.onChange}
                      onBlur={this.onBlur}
                      ref={this.ownerroleInput}
                      className="validate"
                      required
                    >
                      <option value="" disabled>
                        Choose your role
                      </option>
                      <option value="photographer">Photographer</option>
                      <option value="model">Model</option>
                      <option value="makeupartist">Make-up Artist</option>
                    </select>
                    <label htmlFor="ownerrole">My Role</label>
                    <span
                      id="ownerroleerror"
                      className="helper-text"
                      data-success={ownerrolesuccess}
                      data-error={ownerroleerror}
                    ></span>
                  </div>
                </div>
                <p>
                  <label>
                    <input
                      id="checkaddmember"
                      name="checkaddmember"
                      type="checkbox"
                      className="filled-in"
                      onChange={this.toggleaddmember}
                      ref={this.checkaddmemberCheck}
                    />
                    <span>Add people to the collaboration</span>
                  </label>
                </p>

                <fieldset id="addmember" hidden={hiddenaddmember}>
                  <div className="row">
                    <div className="input-field col s12">
                      <select
                        id="tmrole"
                        name="tmrole"
                        value={tmrole}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.tmroleInput}
                        className="validate"
                        required
                      >
                        <option value="" disabled>
                          Choose their role
                        </option>
                        <option value="photographer">Photographer</option>
                        <option value="model">Model</option>
                        <option value="makeupartist">Make-up Artist</option>
                      </select>
                      <label htmlFor="tmrole">Role</label>
                      <span
                        id="tmroleerror"
                        className="helper-text"
                        data-success={tmrolesuccess}
                        data-error={tmroleerror}
                      ></span>
                    </div>
                  </div>
                  <div className="row">
                    <div className="input-field col s12">
                      <input
                        id="tmuname"
                        name="tmuname"
                        value={tmuname}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.tmunameInput}
                        className="validate"
                        type="text"
                        minLength="5"
                        maxLength="30"
                        required
                      />
                      <label htmlFor="tmuname">Username</label>
                      <span
                        id="tmunameerror"
                        className="helper-text"
                        data-success={tmunamesuccess}
                        data-error={tmunameerror}
                      ></span>
                    </div>
                  </div>
                </fieldset>

                <p>
                  <label>
                    <input
                      id="checksearchmember"
                      name="checksearchmember"
                      type="checkbox"
                      className="filled-in"
                      onChange={this.togglesearchmember}
                      ref={this.checksearchmemberCheck}
                    />
                    <span>Look for people to join the collaboration</span>
                  </label>
                </p>

                <fieldset id="searchmember" hidden={hiddensearchmember}>
                  <div className="row">
                    <div className="input-field col s12">
                      <select
                        id="tmsearchrole"
                        name="tmsearchrole"
                        value={tmsearchrole}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.tmsearchroleInput}
                        className="validate"
                        required
                      >
                        <option value="" disabled>
                          Choose their role
                        </option>
                        <option value="photographer">Photographer</option>
                        <option value="model">Model</option>
                        <option value="makeupartist">Make-up Artist</option>
                      </select>
                      <label htmlFor="tmsearchrole">Role</label>
                      <span
                        id="tmsearchroleerror"
                        className="helper-text"
                        data-success={tmsearchrolesuccess}
                        data-error={tmsearchroleerror}
                      ></span>
                    </div>
                  </div>
                  <div className="row">
                    <div className="input-field col s12">
                      <input
                        id="tmbookingfee"
                        name="tmbookingfee"
                        value={tmbookingfee}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.tmbookingfeeInput}
                        className="validate"
                        type="number"
                        min="0"
                        max="1000000"
                        step=".01"
                        required
                      />
                      <label htmlFor="tmbookingfee">Booking Fee</label>
                      <span
                        id="tmbookingfeeerror"
                        className="helper-text"
                        data-success={tmbookingfeesuccess}
                        data-error={tmbookingfeeerror}
                      ></span>
                    </div>
                  </div>

                  <div className="row">
                    <div className="input-field col s12">
                      <textarea
                        id="tmdescript"
                        name="tmdescript"
                        value={tmdescript}
                        onChange={this.onChange}
                        onBlur={this.onBlur}
                        ref={this.tmdescriptInput}
                        className="materialize-textarea validate"
                        required
                      ></textarea>
                      <label htmlFor="tmdescript">Description</label>
                      <span
                        id="tmdescripterror"
                        className="helper-text"
                        data-success={tmdescriptsuccess}
                        data-error={tmdescripterror}
                      ></span>
                    </div>
                  </div>
                </fieldset>
              </fieldset>

              <fieldset>
                <button
                  id="submitcollabbtn"
                  className="btn waves-effect waves-light"
                >
                  Submit<i className="material-icons right">send</i>
                </button>
              </fieldset>
            </form>
          </div>
        </div>
      </>
    );
  }
}

class UserLogin extends Component {
  constructor(props) {
    super(props);
    this.lunameInput = React.createRef();
    this.lpwordInput = React.createRef();
  }

  componentDidMount() {
    M.AutoInit();
  }

  state = {
    luname: "",
    lpword: "",
    lunameerror: "Error",
    lpworderror: "Error",
    lunamesuccess: "Success",
    lpwordsuccess: "Success",
  };

  validateLogin() {
    const luname = this.lunameInput.current;
    const lpword = this.lpwordInput.current;

    if (!luname.validity.valid || !lpword.validity.valid) {
      this.showErrorLoginUsername();
      this.showErrorLoginPassword();
      return false;
    } else {
      return true;
    }
  }

  showErrorLoginUsername() {
    const luname = this.lunameInput.current;
    if (luname.validity.valueMissing) {
      this.setState({ lunameerror: "You must enter a Username" });
      this.setState({ lunamesuccess: "" });
    } else {
      this.setState({ lunamesuccess: "Username entered" });
      this.setState({ lunameerror: "" });
    }
  }

  showErrorLoginPassword() {
    const lpword = this.lpwordInput.current;
    if (lpword.validity.valueMissing) {
      this.setState({ lpworderror: "You must enter a Password" });
      this.setState({ lpwordsuccess: "" });
    } else {
      this.setState({ lpwordsuccess: "Password entered" });
      this.setState({ lpworderror: "" });
    }
  }

  onBlur = () => {
    this.showErrorLoginUsername();
    this.showErrorLoginPassword();
  };

  onChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  onSubmit = (e) => {
    e.preventDefault();
    if (this.validateLogin() == true) {
      fetch(
        "http://localhost:8888/letscollab/letscollab/api/api.php?getData=reactlogin",
        {
          method: "POST",
          body: JSON.stringify(this.state),
        }
      ).then((response) => {
        if (response.status === 409) {
          M.toast({ html: "You are already logged in", classes: "red" });
        }
        if (response.status === 400) {
          M.toast({ html: "Login Failed", classes: "red" });
        }
        if (response.status === 401) {
          M.toast({ html: "User does not exist", classes: "red" });
        }
        if (response.status === 403) {
          M.toast({ html: "Passord is incorrect", classes: "red" });
        }
        if (response.status === 200) {
          response.json().then((data) => {
            localStorage.setItem("loggedinuser", data.username);
            localStorage.setItem("loggedinuserid", data.userid);
            localStorage.setItem("loggedinlocid", data.locid);
          });
          M.toast({ html: "You are now logged in", classes: "green" });
        }
      });
    } else {
      M.toast({ html: "Please enter a Username and Password", classes: "red" });
    }
  };

  render() {
    const {
      luname,
      lpword,
      lunameerror,
      lpworderror,
      lunamesuccess,
      lpwordsuccess,
    } = this.state;
    return (
      <>
        <p>
          Already have an account?
          <a className="modal-trigger" href="#login">
            Login
          </a>
        </p>
        <div id="login" className="modal">
          <div className="modal-content">
            <form
              id="loginform"
              method="POST"
              onSubmit={this.onSubmit}
              className="col s12"
              noValidate
            >
              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="luname"
                    name="luname"
                    value={luname}
                    className="validate"
                    type="text"
                    onChange={this.onChange}
                    onBlur={this.onBlur}
                    ref={this.lunameInput}
                    required
                  />
                  <label htmlFor="luname">Username</label>
                  <span
                    id="lunameerror"
                    className="helper-text"
                    data-success={lunamesuccess}
                    data-error={lunameerror}
                  ></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="lpword"
                    name="lpword"
                    value={lpword}
                    className="validate"
                    type="password"
                    onChange={this.onChange}
                    onBlur={this.onBlur}
                    ref={this.lpwordInput}
                    required
                  />
                  <label htmlFor="lpword">Password</label>
                  <span
                    id="lpworderror"
                    className="helper-text"
                    data-success={lpwordsuccess}
                    data-error={lpworderror}
                  ></span>
                </div>
              </div>

              <div className="row">
                <button
                  id="loginbtn"
                  className="modal-close btn waves-effect waves-light"
                >
                  LOGIN<i className="material-icons right">send</i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </>
    );
  }
}

class UserSignup extends Component {
  constructor(props) {
    super(props);
    this.unameInput = React.createRef();
    this.pwordInput = React.createRef();
    this.cnfpwordInput = React.createRef();
    this.emailInput = React.createRef();
    this.profilepicInput = React.createRef();
    this.ighandleInput = React.createRef();
    this.workurlInput = React.createRef();
    this.fnameInput = React.createRef();
    this.lnameInput = React.createRef();
    this.bioInput = React.createRef();
    this.locnameInput = React.createRef();
    this.locaddressInput = React.createRef();
    this.loccityInput = React.createRef();
    this.locstateInput = React.createRef();
    this.locpostcodeInput = React.createRef();
    this.locdescriptInput = React.createRef();
    this.checkadduseraccCheck = React.createRef();
    this.checkaddlocationaccCheck = React.createRef();
  }

  state = {
    hiddenaddlocacc: true,
    disableaddlocacc: false,
    hiddenadduseracc: true,
    disableadduseracc: false,

    uname: "",
    pword: "",
    cnfpword: "",
    email: "",
    profilepic: "",
    ighandle: "",
    workurl: "",
    fname: "",
    lname: "",
    bio: "",
    locname: "",
    locaddress: "",
    loccity: "",
    locstate: "",
    locpostcode: "",
    locdescript: "",

    unameerror: "Error",
    pworderror: "Error",
    cnfpworderror: "Error",
    emailerror: "Error",
    profilepicerror: "Error",
    ighandleerror: "Error",
    workurlerror: "Error",
    fnameerror: "Error",
    lnameerror: "Error",
    bioerror: "Error",
    locnameerror: "Error",
    locaddresserror: "Error",
    loccityerror: "Error",
    locstateerror: "Error",
    locpostcodeerror: "Error",
    locdescripterror: "Error",

    unamesuccess: "Success",
    pwordsuccess: "Success",
    cnfpwordsuccess: "Success",
    emailsuccess: "Success",
    profilepicsuccess: "Success",
    ighandlesuccess: "Success",
    workurlsuccess: "Success",
    fnamesuccess: "Success",
    lnamesuccess: "Success",
    biosuccess: "Success",
    locnamesuccess: "Success",
    locaddresssuccess: "Success",
    loccitysuccess: "Success",
    locstatesuccess: "Success",
    locpostcodesuccess: "Success",
    locdescriptsuccess: "Success",
  };
  componentDidMount() {
    M.AutoInit();
  }

  toggleaddlocacc = () => {
    this.setState((prevState) => ({
      hiddenaddlocacc: !prevState.hiddenaddlocacc,
    }));
  };

  toggleadduseraccc = () => {
    this.setState((prevState) => ({
      hiddenadduseracc: !prevState.hiddenadduseracc,
    }));
  };

  toggledisableadduseracc = () => {
    this.setState((prevState) => ({
      disableadduseracc: !prevState.disableadduseracc,
    }));
  };

  toggledisableaddlocacc = () => {
    this.setState((prevState) => ({
      disableaddlocacc: !prevState.disableaddlocacc,
    }));
  };

  AddLocAccEvents = () => {
    this.toggleaddlocacc();
    this.toggledisableadduseracc();
  };

  AddUserAccEvents = () => {
    this.toggleadduseraccc();
    this.toggledisableaddlocacc();
  };

  showErrorUsername() {
    const uname = this.unameInput.current;
    if (uname.validity.valueMissing) {
      this.setState({
        unameerror: "You must enter a Username",
        unamesuccess: "",
      });
    } else if (uname.validity.tooShort) {
      this.setState({
        unameerror:
          "Username must be at least " + uname.minLength + " characters",
        unamesuccess: "",
      });
    } else if (uname.validity.tooLong) {
      this.setState({
        unameerror: "Username can only be " + uname.maxLength + " characters",
        unamesuccess: "",
      });
    } else {
      this.setState({ unameerror: "", unamesuccess: "Username entered" });
    }
  }

  showErrorPassword() {
    const pword = this.pwordInput.current;
    if (pword.validity.valueMissing) {
      this.setState({
        pworderror: "You must enter a Password",
        pwordsuccess: "",
      });
    } else if (pword.validity.tooShort) {
      this.setState({
        pworderror:
          "Password must be at least " + pword.minLength + " characters",
        pwordsuccess: "",
      });
    } else if (pword.validity.tooLong) {
      this.setState({
        pworderror: "Password can only be " + pword.maxLength + " characters",
        pwordsuccess: "",
      });
    } else if (pword.validity.patternMismatch) {
      this.setState({
        pworderror:
          "Password must have 1 lowercase letter, 1 uppercase letter, 1 number, 1 special character (#?!@$%^&*-) and be at least 8 characters long",
        pwordsuccess: "",
      });
    } else {
      this.setState({
        pworderror: "",
        pwordsuccess: "Password entered",
      });
    }
  }

  showErrorPasswordMatch() {
    const pword = this.pwordInput.current;
    const cnfpword = this.cnfpwordInput.current;
    if (pword.value !== cnfpword.value) {
      this.setState({
        cnfpworderror: "The Passwords do not match",
        cnfpwordsuccess: "",
      });
    } else {
      this.setState({
        cnfpworderror: "",
        cnfpwordsuccess: "Passwords match",
      });
    }
  }

  showErrorEmail() {
    const email = this.emailInput.current;
    if (email.validity.valueMissing) {
      this.setState({
        emailerror: "You must enter a Email",
        emailsuccess: "",
      });
    } else if (email.validity.typeMismatch) {
      this.setState({
        emailerror: "Entered value needs to be an email address",
        emailsuccess: "",
      });
    } else if (email.validity.tooShort) {
      this.setState({
        emailerror: "Email must be at least " + email.minLength + " characters",
        emailsuccess: "",
      });
    } else if (email.validity.tooLong) {
      this.setState({
        emailerror: "Email can only be " + email.maxLength + " characters",
        emailsuccess: "",
      });
    } else if (email.validity.patternMismatch) {
      this.setState({
        emailerror: "Entered value not a valid email address",
        emailsuccess: "",
      });
    } else {
      this.setState({
        emailerror: "",
        emailsuccess: "Email entered",
      });
    }
  }

  showErrorProfilePic() {
    const profilepic = this.profilepicInput.current;
    if (profilepic.validity.valueMissing) {
      this.setState({
        profilepicerror: "You must add a Profile Pic",
        profilepicsuccess: "",
      });
    } else {
      this.setState({
        profilepicerror: "",
        profilepicsuccess: "Profile Pic added",
      });
    }
  }

  showErrorInstagramHandle() {
    const ighandle = this.ighandleInput.current;
    if (ighandle.validity.valueMissing) {
      this.setState({
        ighandleerror: "You must enter a Instagram Handle",
        ighandlesuccess: "",
      });
    } else if (ighandle.validity.tooLong) {
      this.setState({
        ighandleerror:
          "Instagram Handle can only be " + ighandle.maxLength + " characters",
        ighandlesuccess: "",
      });
    } else {
      this.setState({
        ighandleerror: "",
        ighandlesuccess: "Instagram Handle entered",
      });
    }
  }

  showErrorWorkUrl() {
    const workurl = this.workurlInput.current;
    if (workurl.validity.valueMissing) {
      this.setState({
        workurlerror: "You must enter a Work Url",
        workurlsuccess: "",
      });
    } else if (workurl.validity.tooLong) {
      this.setState({
        workurlerror:
          "Work Url can only be " + workurl.maxLength + " characters",
        workurlsuccess: "",
      });
    } else {
      this.setState({
        workurlerror: "",
        workurlsuccess: "Work Url entered",
      });
    }
  }

  showErrorFirstName() {
    const fname = this.fnameInput.current;
    if (fname.validity.valueMissing) {
      this.setState({
        fnameerror: "You must enter a First Name",
        fnamesuccess: "",
      });
    } else if (fname.validity.tooShort) {
      this.setState({
        fnameerror:
          "First Name must be at least " + fname.minLength + " characters",
        fnamesuccess: "",
      });
    } else if (fname.validity.tooLong) {
      this.setState({
        fnameerror: "First Name can only be " + fname.maxLength + " characters",
        fnamesuccess: "",
      });
    } else if (fname.validity.patternMismatch) {
      this.setState({
        fnameerror:
          "First Name entered can only contain letters, spaces and - or ' ",
        fnamesuccess: "",
      });
    } else {
      this.setState({
        fnameerror: "",
        fnamesuccess: "First Name entered",
      });
    }
  }

  showErrorLasttName() {
    const lname = this.lnameInput.current;
    if (lname.validity.valueMissing) {
      this.setState({
        lnameerror: "You must enter a Last Name",
        lnamesuccess: "",
      });
    } else if (lname.validity.tooShort) {
      this.setState({
        lnameerror:
          "Last Name must be at least " + lname.minLength + " characters",
        lnamesuccess: "",
      });
    } else if (lname.validity.tooLong) {
      this.setState({
        lnameerror: "Last Name can only be " + lname.maxLength + " characters",
        lnamesuccess: "",
      });
    } else if (lname.validity.patternMismatch) {
      this.setState({
        lnameerror:
          "Last Name entered can only contain letters, spaces and - or ' ",
        lnamesuccess: "",
      });
    } else {
      this.setState({
        lnameerror: "",
        lnamesuccess: "Last Name entered",
      });
    }
  }

  showErrorBio() {
    const bio = this.bioInput.current;
    if (bio.validity.valueMissing) {
      this.setState({
        bioerror: "You must enter a Bio",
        biosuccess: "",
      });
    } else {
      this.setState({
        bioerror: "",
        biosuccess: "Bio entered",
      });
    }
  }

  showErrorLocationtName() {
    const locname = this.locnameInput.current;
    if (locname.validity.valueMissing) {
      this.setState({
        locnameerror: "You must enter a Location Name",
        locnamesuccess: "",
      });
    } else if (locname.validity.tooShort) {
      this.setState({
        locnameerror:
          "Location Name must be at least " + locname.minLength + " characters",
        locnamesuccess: "",
      });
    } else if (locname.validity.tooLong) {
      this.setState({
        locnameerror:
          "Location Name can only be " + locname.maxLength + " characters",
        locnamesuccess: "",
      });
    } else if (locname.validity.patternMismatch) {
      this.setState({
        locnameerror:
          "Location Name entered can only contain letters, spaces and - or ' ",
        locnamesuccess: "",
      });
    } else {
      this.setState({
        locnameerror: "",
        locnamesuccess: "Location Name entered",
      });
    }
  }

  showErrorAddress() {
    const locaddress = this.locaddressInput.current;
    if (locaddress.validity.valueMissing) {
      this.setState({
        locaddresserror: "You must enter an Address",
        locaddresssuccess: "",
      });
    } else if (locaddress.validity.tooShort) {
      this.setState({
        locaddresserror:
          "Address must be at least " + locaddress.minLength + " characters",
        locaddresssuccess: "",
      });
    } else if (locaddress.validity.tooLong) {
      this.setState({
        locaddresserror:
          "Address can only be " + locaddress.maxLength + " characters",
        locaddresssuccess: "",
      });
    } else {
      this.setState({
        locaddresserror: "",
        locaddresssuccess: "Address entered",
      });
    }
  }

  showErrorCity() {
    const loccity = this.loccityInput.current;
    if (loccity.validity.valueMissing) {
      this.setState({
        loccityerror: "You must enter a City",
        loccitysuccess: "",
      });
    } else if (loccity.validity.tooShort) {
      this.setState({
        loccityerror:
          "City must be at least " + loccity.minLength + " characters",
        loccitysuccess: "",
      });
    } else if (loccity.validity.tooLong) {
      this.setState({
        loccityerror: "City can only be " + loccity.maxLength + " characters",
        loccitysuccess: "",
      });
    } else if (loccity.validity.patternMismatch) {
      this.setState({
        loccityerror:
          "City entered can only contain letters, spaces and - or ' ",
        loccitysuccess: "",
      });
    } else {
      this.setState({
        loccityerror: "",
        loccitysuccess: "City entered",
      });
    }
  }

  showErrorState() {
    const locstate = this.locstateInput.current;
    if (locstate.validity.valueMissing) {
      this.setState({
        locstateerror: "You must enter a State",
        locstatesuccess: "",
      });
    } else if (locstate.validity.tooShort) {
      this.setState({
        locstateerror:
          "State must be at least " + locstate.minLength + " characters",
        locstatesuccess: "",
      });
    } else if (locstate.validity.tooLong) {
      this.setState({
        locstateerror:
          "State can only be " + locstate.maxLength + " characters",
        locstatesuccess: "",
      });
    } else if (locstate.validity.patternMismatch) {
      this.setState({
        locstateerror: "State entered can only contain captial letters",
        locstatesuccess: "",
      });
    } else {
      this.setState({
        locstateerror: "",
        locstatesuccess: "State entered",
      });
    }
  }

  showErrorPostCode() {
    const locpostcode = this.locpostcodeInput.current;
    if (locpostcode.validity.valueMissing) {
      this.setState({
        locpostcodeerror: "You must enter a Post Code",
        locpostcodesuccess: "",
      });
    } else if (locpostcode.validity.tooShort) {
      this.setState({
        locpostcodeerror:
          "Post Code can only contain " + locpostcode.minLength + " digits",
        locpostcodesuccess: "",
      });
    } else if (locpostcode.validity.tooLong) {
      this.setState({
        locpostcodeerror:
          "Post Code can only contain " + locpostcode.maxLength + " digits",
        locpostcodesuccess: "",
      });
    } else if (locpostcode.validity.patternMismatch) {
      this.setState({
        locpostcodeerror: "Post Code can only contain digits",
        locpostcodesuccess: "",
      });
    } else {
      this.setState({
        locpostcodeerror: "",
        locpostcodesuccess: "Post Code entered",
      });
    }
  }

  showErrorLocationDescription() {
    const locdescript = this.locdescriptInput.current;
    if (locdescript.validity.valueMissing) {
      this.setState({
        locdescripterror: "You must enter a Location Description",
        locdescriptsuccess: "",
      });
    } else {
      this.setState({
        locdescripterror: "",
        locdescriptsuccess: "Location Description entered",
      });
    }
  }

  validateUserReg() {
    const uname = this.unameInput.current;
    const pword = this.pwordInput.current;
    const cnfpword = this.cnfpwordInput.current;
    const email = this.emailInput.current;
    const profilepic = this.profilepicInput.current;
    const ighandle = this.ighandleInput.current;
    const workurl = this.workurlInput.current;
    const fname = this.fnameInput.current;
    const lname = this.lnameInput.current;
    const bio = this.bioInput.current;
    const locname = this.locnameInput.current;
    const locaddress = this.locaddressInput.current;
    const loccity = this.loccityInput.current;
    const locstate = this.locstateInput.current;
    const locpostcode = this.locpostcodeInput.current;
    const locdescript = this.locdescriptInput.current;

    const checkadduseracc = this.checkadduseraccCheck.current;
    const checkaddlocationacc = this.checkaddlocationaccCheck.current;

    if (checkadduseracc.checked) {
      if (
        !uname.validity.valid ||
        !pword.validity.valid ||
        !cnfpword.validity.valid ||
        pword.value !== cnfpword.value ||
        !email.validity.valid ||
        !profilepic.validity.valid ||
        !ighandle.validity.valid ||
        !workurl.validity.valid ||
        !fname.validity.valid ||
        !lname.validity.valid ||
        !bio.validity.valid
      ) {
        this.showErrorUsername();
        this.showErrorPassword();
        this.showErrorPasswordMatch();
        this.showErrorEmail();
        this.showErrorProfilePic();
        this.showErrorInstagramHandle();
        this.showErrorWorkUrl();
        this.showErrorFirstName();
        this.showErrorLastName();
        this.showErrorBio();
      } else {
        return true;
      }
    }
    if (checkaddlocationacc.checked) {
      if (
        !uname.validity.valid ||
        !pword.validity.valid ||
        !cnfpword.validity.valid ||
        pword.value !== cnfpword.value ||
        !email.validity.valid ||
        !profilepic.validity.valid ||
        !ighandle.validity.valid ||
        !workurl.validity.valid ||
        !locname.validity.valid ||
        !locaddress.validity.valid ||
        !loccity.validity.valid ||
        !locstate.validity.valid ||
        !locpostcode.validity.valid ||
        !locdescript.validity.valid
      ) {
        this.showErrorUsername();
        this.showErrorPassword();
        this.showErrorPasswordMatch();
        this.showErrorEmail();
        this.showErrorProfilePic();
        this.showErrorInstagramHandle();
        this.showErrorWorkUrl();
        this.showErrorLocationName();
        this.showErrorAddress();
        this.showErrorCity();
        this.showErrorState();
        this.showErrorPostCode();
        this.showErrorLocationDescription();
      } else {
        return true;
      }
    }
  }

  onBlur = () => {
    this.showErrorUsername();
    this.showErrorPassword();
    this.showErrorPasswordMatch();
    this.showErrorEmail();
    this.showErrorProfilePic();
    this.showErrorInstagramHandle();
    this.showErrorWorkUrl();
    this.showErrorFirstName();
    this.showErrorLasttName();
    this.showErrorBio();
    this.showErrorLocationtName();
    this.showErrorAddress();
    this.showErrorCity();
    this.showErrorState();
    this.showErrorPostCode();
    this.showErrorLocationDescription();
  };

  onChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  onSubmit = (e) => {
    e.preventDefault();
    if (this.validateUserReg() == true) {
      fetch(
        "http://localhost:8888/letscollab/letscollab/api/api.php?getData=reactadduseracc",
        {
          method: "POST",
          body: JSON.stringify(this.state),
        }
      ).then((response) => {
        if (response.status === 412) {
          M.toast({ html: "Too Many Requests", classes: "red" });
        }
        if (response.status === 409) {
          M.toast({
            html: "You are already Registered and Logged in",
            classes: "red",
          });
        }
        if (response.status === 400) {
          M.toast({ html: "Could not complete registration", classes: "red" });
        }
        if (response.status === 406) {
          M.toast({ html: "User Already Exists", classes: "red" });
        }
        if (response.status === 201) {
          M.toast({ html: "Thank you for signing up", classes: "green" });
        }
      });
    } else {
      M.toast({ html: "Please fix errors", classes: "red" });
    }
  };

  render() {
    const {
      hiddenaddlocacc,
      disableaddlocacc,
      hiddenadduseracc,
      disableadduseracc,

      uname,
      pword,
      cnfpword,
      email,
      profilepic,
      ighandle,
      workurl,
      fname,
      lname,
      bio,
      locname,
      locaddress,
      loccity,
      locstate,
      locpostcode,
      locdescript,

      unameerror,
      pworderror,
      cnfpworderror,
      emailerror,
      profilepicerror,
      ighandleerror,
      workurlerror,
      fnameerror,
      lnameerror,
      bioerror,
      locnameerror,
      locaddresserror,
      loccityerror,
      locstateerror,
      locpostcodeerror,
      locdescripterror,

      unamesuccess,
      pwordsuccess,
      cnfpwordsuccess,
      emailsuccess,
      profilepicsuccess,
      ighandlesuccess,
      workurlsuccess,
      fnamesuccess,
      lnamesuccess,
      biosuccess,
      locnamesuccess,
      locaddresssuccess,
      loccitysuccess,
      locstatesuccess,
      locpostcodesuccess,
      locdescriptsuccess,
    } = this.state;
    return (
      <form
        id="signupform"
        method="POST"
        onSubmit={this.onSubmit}
        className="col s12"
        noValidate
      >
        <fieldset>
          <div className="row">
            <div className="input-field col s12">
              <input
                id="uname"
                name="uname"
                value={uname}
                className="validate"
                type="text"
                minLength="5"
                maxLength="30"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.unameInput}
                required
              />
              <label htmlFor="uname">Username</label>
              <span
                id="unameerror"
                className="helper-text"
                data-success={unamesuccess}
                data-error={unameerror}
              ></span>
            </div>
          </div>

          <div className="row">
            <div className="input-field col s12">
              <input
                id="pword"
                name="pword"
                value={pword}
                className="validate"
                type="password"
                minLength="8"
                maxLength="255"
                pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.pwordInput}
                required
              />
              <label htmlFor="pword">Password</label>
              <span
                id="pworderror"
                className="helper-text"
                data-success={pwordsuccess}
                data-error={pworderror}
              ></span>
            </div>
          </div>

          <div className="row">
            <div className="input-field col s12">
              <input
                id="cnfpword"
                name="cnfpword"
                value={cnfpword}
                className="validate"
                type="password"
                minLength="8"
                maxLength="255"
                pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.cnfpwordInput}
                required
              />
              <label htmlFor="cnfpword">Confirm Password</label>
              <span
                id="cnfpworderror"
                className="helper-text"
                data-success={cnfpwordsuccess}
                data-error={cnfpworderror}
              ></span>
            </div>
          </div>

          <div className="row">
            <div className="input-field col s12">
              <input
                id="email"
                name="email"
                value={email}
                className="validate"
                type="email"
                minLength="5"
                maxLength="50"
                pattern="^.+@.+\..+$"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.emailInput}
                required
              />
              <label htmlFor="email">Email</label>
              <span
                id="emailerror"
                className="helper-text"
                data-success={emailsuccess}
                data-error={emailerror}
              ></span>
            </div>
          </div>

          <div className="row">
            <div className="input-field col s12">
              <input
                id="profilepic"
                name="profilepic"
                value={profilepic}
                className="validate"
                type="text"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.profilepicInput}
                required
              />
              <label htmlFor="profilepic">Profile Pic</label>
              <span
                id="profilepicerror"
                className="helper-text"
                data-success={profilepicsuccess}
                data-error={profilepicerror}
              ></span>
            </div>
          </div>

          <div className="row">
            <div className="input-field col s12">
              <input
                id="ighandle"
                name="ighandle"
                value={ighandle}
                className="validate"
                type="text"
                maxLength="30"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.ighandleInput}
                required
              />
              <label htmlFor="ighandle">Instagram Handle</label>
              <span
                id="ighandleerror"
                className="helper-text"
                data-success={ighandlesuccess}
                data-error={ighandleerror}
              ></span>
            </div>
          </div>

          <div className="row">
            <div className="input-field col s12">
              <input
                id="workurl"
                name="workurl"
                value={workurl}
                className="validate"
                type="text"
                maxLength="255"
                onChange={this.onChange}
                onBlur={this.onBlur}
                ref={this.workurlInput}
                required
              />
              <label htmlFor="workurl">Portfolio OR Website URL</label>
              <span
                id="workurlerror"
                className="helper-text"
                data-success={workurlsuccess}
                data-error={workurlerror}
              ></span>
            </div>
          </div>
        </fieldset>

        <fieldset>
          <p>
            <label>
              <input
                id="checkadduseracc"
                name="checkadduseracc"
                type="checkbox"
                className="filled-in"
                ref={this.checkadduseraccCheck}
                disabled={disableadduseracc}
                onChange={this.AddUserAccEvents}
              />
              <span>User Account</span>
            </label>
          </p>
          <fieldset id="adduseracc" hidden={hiddenadduseracc}>
            <div className="row">
              <div className="input-field col s12">
                <input
                  id="fname"
                  name="fname"
                  value={fname}
                  className="validate"
                  type="text"
                  minLength="2"
                  maxLength="255"
                  pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.fnameInput}
                  required
                />
                <label htmlFor="fname">First Name</label>
                <span
                  id="fnameerror"
                  className="helper-text"
                  data-success={fnamesuccess}
                  data-error={fnameerror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="lname"
                  name="lname"
                  value={lname}
                  className="validate"
                  type="text"
                  minLength="2"
                  maxLength="255"
                  pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.lnameInput}
                  required
                />
                <label htmlFor="lname">Last Name</label>
                <span
                  id="lnameerror"
                  className="helper-text"
                  data-success={lnamesuccess}
                  data-error={lnameerror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="bio"
                  name="bio"
                  value={bio}
                  className="validate"
                  type="text"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.bioInput}
                  required
                />
                <label htmlFor="bio">Bio</label>
                <span
                  id="bioerror"
                  className="helper-text"
                  data-success={biosuccess}
                  data-error={bioerror}
                ></span>
              </div>
            </div>
          </fieldset>

          <p>
            <label>
              <input
                id="checkaddlocationacc"
                name="checkaddlocationacc"
                type="checkbox"
                className="filled-in"
                ref={this.checkaddlocationaccCheck}
                onChange={this.AddLocAccEvents}
                disabled={disableaddlocacc}
              />
              <span>Location Account</span>
            </label>
          </p>

          <fieldset id="addlocationacc" hidden={hiddenaddlocacc}>
            <div className="row">
              <div className="input-field col s12">
                <input
                  id="locname"
                  name="locname"
                  value={locname}
                  className="validate"
                  type="text"
                  minLength="2"
                  maxLength="255"
                  pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.locnameInput}
                  required
                />
                <label htmlFor="locname">Location Name</label>
                <span
                  id="locnameerror"
                  className="helper-text"
                  data-success={locnamesuccess}
                  data-error={locnameerror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="locaddress"
                  name="locaddress"
                  value={locaddress}
                  className="validate"
                  type="text"
                  minLength="2"
                  maxLength="255"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.locaddressInput}
                  required
                />
                <label htmlFor="locaddress">Address</label>
                <span
                  id="locaddresserror"
                  className="helper-text"
                  data-success={locaddresssuccess}
                  data-error={locaddresserror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="loccity"
                  name="loccity"
                  value={loccity}
                  className="validate"
                  type="text"
                  minLength="2"
                  maxLength="255"
                  pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.loccityInput}
                  required
                />
                <label htmlFor="loccity">City</label>
                <span
                  id="loccityerror"
                  className="helper-text"
                  data-success={loccitysuccess}
                  data-error={loccityerror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="locstate"
                  name="locstate"
                  value={locstate}
                  className="validate"
                  type="text"
                  minLength="2"
                  maxLength="3"
                  pattern="^[A-Z]*$"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.locstateInput}
                  required
                />
                <label htmlFor="locstate">State</label>
                <span
                  id="locstateerror"
                  className="helper-text"
                  data-success={locstatesuccess}
                  data-error={locstateerror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="locpostcode"
                  name="locpostcode"
                  value={locpostcode}
                  className="validate"
                  type="text"
                  minLength="4"
                  maxLength="4"
                  pattern="^[0-9]*$"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.locpostcodeInput}
                  required
                />
                <label htmlFor="locpostcode">Post Code</label>
                <span
                  id="locpostcodeerror"
                  className="helper-text"
                  data-success={locpostcodesuccess}
                  data-error={locpostcodeerror}
                ></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="locdescript"
                  name="locdescript"
                  value={locdescript}
                  className="validate"
                  type="text"
                  onChange={this.onChange}
                  onBlur={this.onBlur}
                  ref={this.locdescriptInput}
                  required
                />
                <label htmlFor="locdescript">Description</label>
                <span
                  id="locdescripterror"
                  className="helper-text"
                  data-success={locdescriptsuccess}
                  data-error={locdescripterror}
                ></span>
              </div>
            </div>
          </fieldset>
        </fieldset>

        <fieldset>
          <p>
            <label htmlFor="terms">
              <input type="checkbox" id="terms" />
              <span>
                Agree to
                <a className="modal-trigger" href="#termsmodal">
                  Terms
                </a>
              </span>
            </label>
          </p>
          <div id="termsmodal" className="modal modal-fixed-footer">
            <div className="modal-content">
              <h4>Modal Header</h4>
              <p>A bunch of text</p>
            </div>
            <div className="modal-footer">
              <a
                href="#!"
                className="modal-close waves-effect waves-green btn-flat"
                id="agree"
              >
                Agree
              </a>
              <a
                href="#!"
                className="modal-close waves-effect waves-red btn-flat"
                id="disagree"
              >
                Disagree
              </a>
            </div>
          </div>
        </fieldset>

        <fieldset>
          <button id="signupbtn" className="btn waves-effect waves-light">
            SIGN UP<i className="material-icons right">send</i>
          </button>
        </fieldset>
      </form>
    );
  }
}

class UserLogout extends Component {
  logout() {
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=logout"
    ).then((response) => {
      if (response.status === 409) {
        M.toast({ html: "You were not logged in", classes: "red" });
      }
      if (response.status === 200) {
        localStorage.setItem("loggedinuser", null);
        localStorage.setItem("loggedinuserid", null);
        localStorage.setItem("loggedinlocid", null);
        M.toast({ html: "You are now logged out", classes: "green" });
      }
    });
  }

  render() {
    return (
      <div id="userlogout" className="row">
        <div className="row">
          <button
            id="logoutbtn"
            className="btn waves-effect waves-light"
            type="button"
            onClick={this.logout}
          >
            LOGOUT<i className="material-icons right">send</i>
          </button>
        </div>
      </div>
    );
  }
}

class SignUp extends Component {
  state = {
    userloggedin: false,
  };

  componentDidMount() {
    if (localStorage.getItem("loggedinuserid") !== "null") {
      this.setState({ userloggedin: true });
    } else if (localStorage.getItem("loggedinlocid") !== "null") {
      this.setState({ userloggedin: true });
    } else {
      this.setState({ userloggedin: false });
    }
  }

  render() {
    const { userloggedin } = this.state;

    if (userloggedin) {
      return (
        <>
          <div id="signup" className="container">
            <div id="userlogout" className="row">
              <UserLogout />
            </div>
          </div>
        </>
      );
    } else {
      return (
        <>
          <div id="signup" className="container">
            <div id="userlogin" className="row">
              <UserSignup />
              <UserLogin />
            </div>
          </div>
        </>
      );
    }
  }
}

class Profile extends Component {
  state = {
    profiledata: [],
    loaded: false,
    response401: false,
    response412: false,
    response200: false,
    loggedinuser: false,
    loggedinloc: false,
  };

  setUser = () => {
    var loggedin = "nulluser";
    if (localStorage.getItem("loggedinuserid") !== "null") {
      loggedin = "displayuserprofile";
    } else if (localStorage.getItem("loggedinlocid") !== "null") {
      loggedin = "displaylocprofile";
    } else {
      loggedin = "nulluser";
    }

    return loggedin;
  };

  componentDidMount() {
    const fetchloggedin = this.setUser();

    if (fetchloggedin === "displayuserprofile") {
      this.setState({ loggedinuser: true });
    } else if (fetchloggedin === "displaylocprofile") {
      this.setState({ loggedinloc: true });
    } else {
      this.setState({ loggedinuser: false, loggedinloc: false });
    }

    fetch(
      `http://localhost:8888/letscollab/letscollab/api/api.php?getData=${fetchloggedin}`
    ).then((response) => {
      if (response.status === 401) {
        this.setState({ loaded: true, response401: true });
      }
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
        this.setState({ loaded: true, response412: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          this.setState({ loaded: true, response200: true, profiledata: data });
        });
      }
    });
  }

  render() {
    const {
      loaded,
      profiledata,
      response401,
      response412,
      response200,
      loggedinuser,
      loggedinloc,
    } = this.state;
    if (!loaded) {
      return <Loader />;
    } else if (response401) {
      return (
        <div id="profile" className="container">
          <p>Please log in to view your profile</p>
        </div>
      );
    } else if (response412) {
      return <Loader />;
    } else if (response200) {
      if (loggedinuser) {
        return (
          <div id="profile" className="container">
            <div className="row">
              <div className="col s6">
                <img
                  className="profileimg circle"
                  src={profiledata.ProfilePicture}
                />
              </div>

              <div className="col s6">
                <h5>
                  {profiledata.FirstName} {profiledata.LastName}
                </h5>
                <p>{profiledata.Email}</p>
              </div>
            </div>

            <div className="section">
              <p>About {profiledata.FirstName}</p>
              <p>{profiledata.Bio}</p>
            </div>

            <div className="section">
              <p>
                <a href={profiledata.InstagramHandle}>INSTAGRAM</a>
              </p>
              <p>
                <a href={profiledata.PortfolioURL}>VIEW PORTFOLIO</a>
              </p>
            </div>
          </div>
        );
      } else if (loggedinloc) {
        return (
          <div id="profile" className="container">
            <div className="row">
              <div className="col s6">
                <img
                  className="profileimg circle"
                  src={profiledata.ProfilePicture}
                />
              </div>

              <div className="col s6">
                <h5>{profiledata.Name}</h5>
                <p>
                  {profiledata.City} {profiledata.State}
                </p>
                <p>{profiledata.Email}</p>
              </div>
            </div>

            <div className="section">
              <p>About {profiledata.LocationName}</p>
              <p>{profiledata.Description}</p>
            </div>

            <div className="section">
              <p>
                <a href={profiledata.InstagramHandle}>INSTAGRAM</a>
              </p>
              <p>
                <a href={profiledata.PortfolioURL}>VIEW PORTFOLIO</a>
              </p>
            </div>
          </div>
        );
      } else {
        return (
          <div id="profile" className="container">
            <p>Please log in to view your profile</p>
          </div>
        );
      }
    } else {
      return <div>There was an issue retrieving the data</div>;
    }
  }
}

class MyLocCollabs extends Component {
  render() {
    return (
      <div>
        <p>Location Account: Please see Joined Collab tab</p>
      </div>
    );
  }
}

class MyCollabs extends Component {
  state = {
    collablist: [],
    loaded: false,
    response401: false,
    response412: false,
    response200: false,
    collabinforequested: false,
    collabinfo: [],
    locfound: false,
    locinfo: [],
    locrequestsmade: false,
    locrequests: [],
    teaminfo: [],
    teamrequestsmade: false,
    teamrequests: [],
  };

  componentDidMount() {
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displayusercollabs"
    ).then((response) => {
      if (response.status === 401) {
        this.setState({ loaded: true, response401: true });
      }
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
        this.setState({ loaded: true, response412: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          this.setState({ loaded: true, response200: true, collablist: data });
        });
      }
    });
  }

  approveLocRequest = (e) => {
    var locationID = e.currentTarget.getAttribute("loc-id");
    var collaborationID = e.currentTarget.getAttribute("collab-id");
    var locrequestID = e.currentTarget.getAttribute("loc-request-id");
    var locsearchID = e.currentTarget.getAttribute("loc-search-id");
    const lrdata = {
      lid: locationID,
      cid: collaborationID,
      lrid: locrequestID,
      lsid: locsearchID,
    };

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=approvelocrequest",
      {
        method: "POST",
        body: JSON.stringify(lrdata),
      }
    ).then((response) => {
      if (response.status === 201) {
        M.toast({ html: "Location Request Approved", classes: "green" });
      }
    });
  };

  denyLocRequest = (e) => {
    var locrequestID = e.currentTarget.getAttribute("loc-request-id");
    const lrdata = { lrid: locrequestID };

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=denylocrequests",
      {
        method: "POST",
        body: JSON.stringify(lrdata),
      }
    ).then((response) => {
      if (response.status === 201) {
        M.toast({ html: "Location Request Denied", classes: "red" });
      }
    });
  };

  approveTeamRequest = (e) => {
    var role = e.currentTarget.getAttribute("tm-role");
    var userID = e.currentTarget.getAttribute("user-id");
    var collaborationID = e.currentTarget.getAttribute("collab-id");
    var tmrequestID = e.currentTarget.getAttribute("tm-request-id");
    var tmsearchID = e.currentTarget.getAttribute("tm-search-id");
    const trdata = {
      tmrole: role,
      uid: userID,
      cid: collaborationID,
      tmrid: tmrequestID,
      tmsid: tmsearchID,
    };

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=approveteamrequests",
      {
        method: "POST",
        body: JSON.stringify(trdata),
      }
    ).then((response) => {
      if (response.status === 201) {
        M.toast({ html: "Team Request Approved", classes: "green" });
      }
    });
  };

  denyTeamRequest = (e) => {
    var tmrequestID = e.currentTarget.getAttribute("tm-request-id");
    const trdata = { tmrid: tmrequestID };

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=denyteamrequests",
      {
        method: "POST",
        body: JSON.stringify(trdata),
      }
    ).then((response) => {
      if (response.status === 201) {
        M.toast({ html: "Team Request Denied", classes: "red" });
      }
    });
  };

  showMyCollab = (e) => {
    this.setState({ collabinforequested: true });
    var id = e.currentTarget.getAttribute("collab-id");

    const collabid = { collabid: id };
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displayusercollab",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        this.setState({ collabinfo: data });
      });

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaylocation",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        if (data === false) {
          this.setState({ locfound: false });
          fetch(
            "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaylocrequests",
            {
              method: "POST",
              body: JSON.stringify(collabid),
            }
          )
            .then((response) => response.json())
            .then((data) => {
              if (data === false) {
                this.setState({ locrequestsmade: false });
              } else {
                this.setState({ locrequestsmade: true, locrequests: data });
              }
            });
        } else {
          this.setState({ locfound: true, locinfo: data });
        }
      });

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displayteam",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        this.setState({ teaminfo: data });
      });

    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displayteamrequests",
      {
        method: "POST",
        body: JSON.stringify(collabid),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        if (data === false) {
          this.setState({ teamrequestsmade: false });
        } else {
          this.setState({ teamrequestsmade: true, teamrequests: data });
        }
      });
  };

  render() {
    const {
      loaded,
      collablist,
      response401,
      response412,
      response200,
      collabinfo,
      locinfo,
      locrequests,
      teaminfo,
      teamrequests,
    } = this.state;
    if (!loaded) {
      return <Loader />;
    } else if (response401) {
      return (
        <div>
          <p>Please log in to view your profile</p>
        </div>
      );
    } else if (response412) {
      return <Loader />;
    } else if (response200) {
      if (collablist === false) {
        return (
          <div>
            <p>You have not started any collaboration</p>
          </div>
        );
      } else {
        return (
          <div id="mycollab" className="col s12">
            <div id="mycollablist" className="col s12">
              <h5>My Collaborations</h5>
              <table id="mycollablisttbl" className="highlight">
                <thead>
                  <tr>
                    <th></th>
                    <th>Details</th>
                  </tr>
                </thead>
                <tbody>
                  {collablist.map((collab) => (
                    <tr key={collab.CollaborationID}>
                      <td>{collab.Title}</td>
                      <td>
                        <a
                          className="btn-floating btn-large waves-effect waves-light"
                          collab-id={collab.CollaborationID}
                          onClick={this.showMyCollab}
                        >
                          <i className="material-icons">send</i>
                        </a>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {this.state.collabinforequested ? (
              <div id="viewmycollab">
                <div id="collabinfo">
                  <h5>{collabinfo.Title}</h5>
                  <p>{collabinfo.Description}</p>
                  <p>{collabinfo.Date}</p>
                </div>

                <h5>Location</h5>
                {this.state.locfound ? (
                  <table id="mycollabloctbl" className="highlight">
                    <thead>
                      <tr>
                        <th>Location</th>
                        <th>Profile</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          {locinfo.Name} {locinfo.City} {locinfo.State}
                        </td>
                        <td>
                          <a className="btn-floating btn-large waves-effect waves-light">
                            <i className="material-icons">location_on</i>
                          </a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                ) : (
                  <table id="mycollabloctbl" className="highlight">
                    <tbody>
                      <tr>
                        <td> Location search in progress </td>
                      </tr>
                    </tbody>
                  </table>
                )}

                <h5>Location Requests</h5>

                {this.state.locfound ? (
                  <table id="mycollablocreqtbl" className="highlight">
                    <tbody>
                      <tr>
                        <td> Location has been found </td>
                      </tr>
                    </tbody>
                  </table>
                ) : (
                  <>
                    {this.state.locrequestsmade ? (
                      <table id="mycollablocreqtbl" className="highlight">
                        <thead>
                          <tr>
                            <th>Location</th>
                            <th>Profile</th>
                            <th>Approve</th>
                            <th>Deny</th>
                          </tr>
                        </thead>
                        <tbody>
                          {locrequests.map((request) => (
                            <tr key={request.LocationRequestID}>
                              <td>
                                {request.Name} {request.City} {request.State}
                              </td>
                              <td>
                                <a className="btn-floating btn-large waves-effect waves-light">
                                  <i className="material-icons">location_on</i>
                                </a>
                              </td>
                              <td>
                                <a
                                  className="btn-floating btn-large waves-effect waves-light green"
                                  loc-id={request.LocationID}
                                  collab-id={request.CollaborationID}
                                  loc-request-id={request.LocationRequestID}
                                  loc-search-id={request.LocationSearchID}
                                  onClick={this.approveLocRequest}
                                >
                                  <i className="material-icons">done</i>
                                </a>
                              </td>
                              <td>
                                <a
                                  className="btn-floating btn-large waves-effect waves-light red"
                                  loc-request-id={request.LocationRequestID}
                                  onClick={this.denyLocRequest}
                                >
                                  <i className="material-icons">clear</i>
                                </a>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    ) : (
                      <table id="mycollablocreqtbl" className="highlight">
                        <tbody>
                          <tr>
                            <td> No location requests </td>
                          </tr>
                        </tbody>
                      </table>
                    )}
                  </>
                )}

                <h5>Team</h5>

                <table id="mycollabteamtbl" className="highlight">
                  <thead>
                    <tr>
                      <th>Member</th>
                      <th>Profile</th>
                    </tr>
                  </thead>
                  <tbody>
                    {teaminfo.map((member) => (
                      <tr key={member.UserID}>
                        <td>
                          {member.FirstName} {member.LastName} {member.Role}
                        </td>
                        <td>
                          <a className="btn-floating btn-large waves-effect waves-light">
                            <i className="material-icons">person</i>
                          </a>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>

                <h5>Team Requests</h5>
                {this.state.teamrequestsmade ? (
                  <table id="mycollabteamreqtbl" className="highlight">
                    <thead>
                      <tr>
                        <th>Member</th>
                        <th>Profile</th>
                        <th>Approve</th>
                        <th>Deny</th>
                      </tr>
                    </thead>
                    <tbody>
                      {teamrequests.map((member) => (
                        <tr>
                          <td>
                            {member.FirstName} {member.LastName} {member.Role}
                          </td>
                          <td>
                            <a className="btn-floating btn-large waves-effect waves-light">
                              <i className="material-icons">person</i>
                            </a>
                          </td>
                          <td>
                            <a
                              className="btn-floating btn-large waves-effect waves-light green"
                              tm-role={member.Role}
                              user-id={member.UserID}
                              collab-id={member.CollaborationID}
                              tm-request-id={member.TeamMemberRequestID}
                              tm-search-id={member.TeamMemberSearchID}
                              onClick={this.approveTeamRequest}
                            >
                              <i className="material-icons">done</i>
                            </a>
                          </td>
                          <td>
                            <a
                              className="btn-floating btn-large waves-effect waves-light red"
                              tm-request-id={member.TeamMemberRequestID}
                              onClick={this.denyTeamRequest}
                            >
                              <i className="material-icons">clear</i>
                            </a>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                ) : (
                  <table id="mycollabteamreqtbl" className="highlight">
                    <tbody>
                      <tr>
                        <td> No team requests </td>
                      </tr>
                    </tbody>
                  </table>
                )}
              </div>
            ) : (
              <div id="viewmycollab">
                <p>Select A Collab To See More</p>
              </div>
            )}
          </div>
        );
      }
    }
  }
}

class JoinedCollabs extends Component {
  state = {
    requestlist: [],
    loaded: false,
    response401: false,
    response200: false,
  };

  setUser = () => {
    var loggedin = "nulluser";
    if (localStorage.getItem("loggedinuserid") !== "null") {
      loggedin = "displayuserrequests";
    } else if (localStorage.getItem("loggedinlocid") !== "null") {
      loggedin = "displayuserlocrequests";
    } else {
      loggedin = "nulluser";
    }

    return loggedin;
  };

  componentDidMount() {
    const fetchuserrequests = this.setUser();

    fetch(
      `http://localhost:8888/letscollab/letscollab/api/api.php?getData=${fetchuserrequests}`
    ).then((response) => {
      if (response.status === 401) {
        this.setState({ loaded: true, response401: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          this.setState({ loaded: true, response200: true, requestlist: data });
        });
      }
    });
  }

  render() {
    const { loaded, requestlist, response401, response200 } = this.state;

    if (!loaded) {
      return <Loader />;
    } else if (response401) {
      return (
        <div>
          <p>Please log in to view your collaborations requests</p>
        </div>
      );
    } else if (response200) {
      if (requestlist === false) {
        return (
          <div>
            <p>You have not made any requests</p>
          </div>
        );
      } else {
        return (
          <div id="joinedcollab" className="col s12">
            <h5>Joined Collab Requests</h5>
            <table id="myreqtbl" className="highlight">
              <thead>
                <tr>
                  <th></th>
                  <th>Details</th>
                  <th>Status</th>
                  <th>Withdraw</th>
                </tr>
              </thead>
              <tbody>
                {requestlist.map((collab) => (
                  <tr key={collab.CollaborationID}>
                    <td>{collab.Title}</td>
                    <td>
                      <a className="btn-floating btn-large waves-effect waves-light">
                        <i className="material-icons">send</i>
                      </a>
                    </td>
                    <td>
                      <p className="yellow-text text-darken-4">
                        {collab.RequestStatus}
                      </p>
                    </td>
                    <td>
                      <a className="btn-floating btn-large waves-effect waves-light red">
                        <i className="material-icons">clear</i>
                      </a>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        );
      }
    }
  }
}

function UserCollab() {
  const tabs = [
    { id: "mycollab", name: "My Collab" },
    { id: "joinedcollab", name: "Joined Collabs" },
  ];

  const [viewTab, setTab] = useState("mycollab");
  const [viewUserTab, setUser] = useState(getUser());

  function getUser() {
    var loggedin = "";
    if (localStorage.getItem("loggedinuserid") !== "null") {
      loggedin = "userprofile";
    } else if (localStorage.getItem("loggedinlocid") !== "null") {
      loggedin = "locprofile";
    } else {
      loggedin = "";
    }

    return loggedin;
  }

  return (
    <>
      <div id="usercollab">
        <div className="col s12">
          <div className="teal">
            <ul className="tabs tabs-transparent">
              {tabs.map((tab) => (
                <li key={tab.id} className="tab col s6">
                  <a href="#" onClick={() => setTab(tab.id)}>
                    {tab.name}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="container">
          {viewTab === "mycollab" ? (
            <>
              {viewUserTab === "userprofile" ? (
                <MyCollabs />
              ) : viewUserTab === "locprofile" ? (
                <MyLocCollabs />
              ) : (
                <p>Please log in to view your collaborations</p>
              )}
            </>
          ) : viewTab === "joinedcollab" ? (
            <JoinedCollabs />
          ) : (
            <p>Please log in to view your collaboration requests</p>
          )}
        </div>
      </div>
    </>
  );
}

function App() {
  return <Navigation />;
}

ReactDOM.render(<App />, document.getElementById("root"));
