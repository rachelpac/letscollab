import React, { useState, useReducer, Component, useEffect } from "react";
import ReactDOM from "react-dom";
import "./index.css";
import "materialize-css/dist/css/materialize.min.css";
import M from "materialize-css";

const profileinfo = {
  UserID: 5,
  FirstName: "Test",
  LastName: "Type",
  Email: "testuser@test.com",
  Bio: "bio",
  ProfilePicture: "../client/images/profile.png",
  InstagramHandle: "https://www.instagram.com/",
  PortfolioURL: "https://www.imgmodels.com/",
  LoginID: 7,
};

const mycollablist = [
  {
    CollaborationID: 28,
    Title: "test owner id",
  },
  {
    CollaborationID: 29,
    Title: "testauthpass",
  },
  {
    CollaborationID: 30,
    Title: "testfaillocacc",
  },
];

const myjoinedcollablist = [
  {
    Title: "collab title",
    TeamMemberRequestID: 6,
    TeamMemberSearchID: 1,
    UserID: 5,
    RequestStatus: "Pending",
    CollaborationID: 1,
  },
  {
    Title: "test7",
    TeamMemberRequestID: 7,
    TeamMemberSearchID: 2,
    UserID: 5,
    RequestStatus: "Pending",
    CollaborationID: 7,
  },
  {
    Title: "test",
    TeamMemberRequestID: 8,
    TeamMemberSearchID: 21,
    UserID: 5,
    RequestStatus: "Approved",
    CollaborationID: 39,
  },
];

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
        <Profile userinfo={profileinfo} />
      ) : viewMenuItem === "signup" ? (
        <SignUp />
      ) : (
        <h3>There was an issue loading the page</h3>
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

function BrowseCollabs() {
  const [data, setData] = useState(null);
  useEffect(() => {
    fetch('http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaycollabs')
    .then (result => result.json())
    .then(setData)
    .catch(console.error);
  },  []);
  if(data) {
    console.log(data);
    return (
    <>
    
      <div id="browsecollab" className="container">
        {data.map((collab) => (
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
                >
                  JOIN<i className="material-icons right">send</i>
                </button>
              </div>
            </div>
          </div>
          ))}
      </div>
    </>
  )  
  }
  return null;
}

class OwnerSelect extends Component {
  componentDidMount() {
    M.AutoInit();
  }
  render() {
    return (
      <div className="row">
        <div className="input-field col s12">
          <select id="ownerrole" name="ownerrole" className="validate" required>
            <option value="" disabled>
              Choose your role
            </option>
            <option value="photographer">Photographer</option>
            <option value="model">Model</option>
            <option value="makeupartist">Make-up Artist</option>
          </select>
          <label htmlFor="ownerrole">My Role</label>
          <span id="ownerroleerror" className="helper-text"></span>
        </div>
      </div>
    );
  }
}

class TeamMemberSearchSelect extends Component {
  componentDidMount() {
    M.AutoInit();
  }
  render() {
    return (
      <div className="row">
        <div className="input-field col s12">
          <select
            id="tmsearchrole"
            name="tmsearchrole"
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
          <span id="tmsearchroleerror" className="helper-text"></span>
        </div>
      </div>
    );
  }
}

class TeamMemberAddSelect extends Component {
  componentDidMount() {
    M.AutoInit();
  }
  render() {
    return (
      <div className="row">
        <div className="input-field col s12">
          <select id="tmrole" name="tmrole" className="validate" required>
            <option value="" disabled>
              Choose their role
            </option>
            <option value="photographer">Photographer</option>
            <option value="model">Model</option>
            <option value="makeupartist">Make-up Artist</option>
          </select>
          <label htmlFor="tmrole">Role</label>
          <span id="tmroleerror" className="helper-text"></span>
        </div>
      </div>
    );
  }
}

function StartCollab() {
 const [hiddenaddloc, toggleaddloc] = useReducer((hidden) => !hidden, true);
 const [disablesearchloc, toggledisablesearchloc] = useReducer((disabled) => !disabled, false);
 const [hiddensearchloc, togglesearchloc] = useReducer((hidden) => !hidden, true);
 const [disableaddloc, toggledisableaddloc] = useReducer((disabled) => !disabled, false);
 const [hiddenaddmember, toggleaddmember] = useReducer((hidden) => !hidden, true);
 const [hiddensearchmember, togglesearchmember] = useReducer((hidden) => !hidden, true);

  function AddLocEvents() {
     toggleaddloc();
     toggledisablesearchloc();
  }

  function SearchLocEvents() {
    togglesearchloc();
    toggledisableaddloc();
  }

  return (
    <>
      <div id="startcollab" className="container">
        <div className="row">
          <form
            id="submitcollabform"
            method="POST"
            action="../api/api.php?getData=addcollab"
            className="col s12"
          >
            <fieldset>
              <legend>
                Collaboration Details{" "}
                <i className="small material-icons">info</i>
              </legend>
              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="ctitle"
                    name="ctitle"
                    className="validate"
                    type="text"
                    minLength="2"
                    maxLength="50"
                    pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                    required
                  />
                  <label htmlFor="ctitle">Collaboration Title</label>
                  <span id="ctitleerror" className="helper-text"></span>
                </div>
              </div>
              <div className="row">
                <div className="input-field col s12">
                  <textarea
                    id="cdescript"
                    name="cdescript"
                    className="materialize-textarea validate"
                    required
                  ></textarea>
                  <label htmlFor="cdescript">Collaboration Description</label>
                  <span id="cdescripterror" className="helper-text"></span>
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
                    type="text"
                    className="datepicker validate"
                    required
                  />
                  <span id="cdateerror" className="helper-text"></span>
                </div>
                <div className="col s6">
                  <label htmlFor="ctime">Time</label>
                  <input
                    id="ctime"
                    name="ctime"
                    type="text"
                    className="timepicker validate"
                    required
                  />
                  <span id="ctimeerror" className="helper-text"></span>
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
                {disableaddloc ? true : false}
                  <input
                    id="checkaddlocation"
                    name="checkaddlocation"
                    type="checkbox"
                    className="filled-in"
                    onChange={AddLocEvents}
                    disabled={disableaddloc}
                  />
                  <span>I have a location</span>
                </label>
              </p>
              <fieldset id="addlocation" hidden={hiddenaddloc}> 
              {hiddenaddloc ? true : false}
                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="locationuname"
                      name="locationuname"
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
                    ></span>
                  </div>
                </div>
              </fieldset>

              <p>
                <label htmlFor="checksearchlocation">
                  {disablesearchloc ? true : false}
                  <input
                    id="checksearchlocation"
                    name="checksearchlocation"
                    type="checkbox"
                    className="filled-in"
                    onChange={SearchLocEvents}
                    disabled={disablesearchloc}
                    
                  />
                  <span>I'm looking for a location</span>
                </label>
              </p>

              <fieldset id="searchlocation" hidden={hiddensearchloc}>
                {hiddensearchloc ? true : false}
                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="lcity"
                      name="lcity"
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="255"
                      pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                      required
                    />
                    <label htmlFor="lcity">City</label>
                    <span id="lcityerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="lbookingfee"
                      name="lbookingfee"
                      className="validate"
                      type="number"
                      min="0"
                      max="1000000"
                      required
                    />
                    <label htmlFor="lbookingfee">Booking Fee</label>
                    <span id="lbookingfeeerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <textarea
                      id="ldescript"
                      name="ldescript"
                      className="materialize-textarea validate"
                      required
                    ></textarea>
                    <label htmlFor="ldescript">Description</label>
                    <span id="ldescripterror" className="helper-text"></span>
                  </div>
                </div>
              </fieldset>
            </fieldset>

            <fieldset>
              <legend>
                Collaboration Team
                <i className="small material-icons">people_alt</i>
              </legend>
              <OwnerSelect />
              <p>
                <label>
                  <input
                    id="checkaddmember"
                    name="checkaddmember"
                    type="checkbox"
                    className="filled-in"
                    onChange={toggleaddmember}
                  />
                  <span>Add people to the collaboration</span>
                </label>
              </p>

              <fieldset id="addmember" hidden={hiddenaddmember}>
                {hiddenaddmember ? true : false}
                <TeamMemberAddSelect />
                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="tmuname"
                      name="tmuname"
                      className="validate"
                      type="text"
                      minLength="5"
                      maxLength="30"
                      required
                    />
                    <label htmlFor="tmuname">Username</label>
                    <span id="tmunameerror" className="helper-text"></span>
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
                    onChange={togglesearchmember}
                  />
                  <span>Look for people to join the collaboration</span>
                </label>
              </p>

              <fieldset id="searchmember" hidden={hiddensearchmember}>
                {hiddensearchmember ? true : false}
                <TeamMemberSearchSelect />
                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="tmbookingfee"
                      name="tmbookingfee"
                      className="validate"
                      type="number"
                      min="0"
                      max="1000000"
                      required
                    />
                    <label htmlFor="tmbookingfee">Booking Fee</label>
                    <span id="tmbookingfeeerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <textarea
                      id="tmdescript"
                      name="tmdescript"
                      className="materialize-textarea validate"
                      required
                    ></textarea>
                    <label htmlFor="tmdescript">Description</label>
                    <span id="tmdescripterror" className="helper-text"></span>
                  </div>
                </div>
              </fieldset>
            </fieldset>

            <fieldset>
              <button
                id="submitcollabbtn"
                className="btn waves-effect waves-light"
                type="button"
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

class TermsModal extends Component {
  componentDidMount() {
    M.AutoInit();
  }
  render() {
    return (
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
    );
  }
}

class LoginModal extends Component {
  componentDidMount() {
    M.AutoInit();
  }
  render() {
    return (
      <div id="login" className="modal">
        <div className="modal-content">
          <form
            id="loginform"
            method="POST"
            action="../api/ses.php?getSession=login"
            className="col s12"
          >
            <div className="row">
              <div className="input-field col s12">
                <input
                  id="luname"
                  name="luname"
                  className="validate"
                  type="text"
                  required
                />
                <label htmlFor="luname">Username</label>
                <span id="lunameerror" className="helper-text"></span>
              </div>
            </div>

            <div className="row">
              <div className="input-field col s12">
                <input
                  id="lpword"
                  name="lpword"
                  className="validate"
                  type="password"
                  required
                />
                <label htmlFor="lpword">Password</label>
                <span id="lpworderror" className="helper-text"></span>
              </div>
            </div>

            <div className="row">
              <button
                id="loginbtn"
                className="modal-close btn waves-effect waves-light"
                type="button"
                onClick={submitLogin}
              >
                LOGIN<i className="material-icons right">send</i>
              </button>
            </div>
          </form>
        </div>
      </div>
    );
  }
}

function submitLogin() {
  console.log('pressed submit');
}

function SignUp() {
  const [hiddenaddlocacc, toggleaddlocacc] = useReducer(
    (hidden) => !hidden,
    true
  );
  const [hiddenadduseracc, toggleadduseracc] = useReducer(
    (hidden) => !hidden,
    true
  );
  return (
    <>
      <div id="signup" className="container">
        <div id="userlogin" className="row">
          <form
            id="signupform"
            method="POST"
            action="../api/api.php?getData=adduseracc"
            className="col s12"
          >
            <fieldset>
              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="uname"
                    name="uname"
                    className="validate"
                    type="text"
                    minLength="5"
                    maxLength="30"
                    required
                  />
                  <label htmlFor="uname">Username</label>
                  <span id="unameerror" className="helper-text"></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="pword"
                    name="pword"
                    className="validate"
                    type="password"
                    minLength="8"
                    maxLength="255"
                    pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                    required
                  />
                  <label htmlFor="pword">Password</label>
                  <span id="pworderror" className="helper-text"></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="cnfpword"
                    name="cnfpword"
                    className="validate"
                    type="password"
                    minLength="8"
                    maxLength="255"
                    pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                    required
                  />
                  <label htmlFor="cnfpword">Confirm Password</label>
                  <span id="cnfpworderror" className="helper-text"></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="email"
                    name="email"
                    className="validate"
                    type="email"
                    minLength="5"
                    maxLength="50"
                    pattern="^.+@.+\..+$"
                    required
                  />
                  <label htmlFor="email">Email</label>
                  <span id="emailerror" className="helper-text"></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="profilepic"
                    name="profilepic"
                    className="validate"
                    type="text"
                    required
                  />
                  <label htmlFor="profilepic">Profile Pic</label>
                  <span id="profilepicerror" className="helper-text"></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="ighandle"
                    name="ighandle"
                    className="validate"
                    type="text"
                    maxLength="30"
                    required
                  />
                  <label htmlFor="ighandle">Instagram Handle</label>
                  <span id="ighandleerror" className="helper-text"></span>
                </div>
              </div>

              <div className="row">
                <div className="input-field col s12">
                  <input
                    id="workurl"
                    name="workurl"
                    className="validate"
                    type="text"
                    maxLength="255"
                    required
                  />
                  <label htmlFor="workurl">Portfolio OR Website URL</label>
                  <span id="workurlerror" className="helper-text"></span>
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
                    onChange={toggleadduseracc}
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
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="255"
                      pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                      required
                    />
                    <label htmlFor="fname">First Name</label>
                    <span id="fnameerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="lname"
                      name="lname"
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="255"
                      pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                      required
                    />
                    <label htmlFor="lname">Last Name</label>
                    <span id="lnameerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="bio"
                      name="bio"
                      className="validate"
                      type="text"
                      required
                    />
                    <label htmlFor="bio">Bio</label>
                    <span id="bioerror" className="helper-text"></span>
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
                    onChange={toggleaddlocacc}
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
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="255"
                      pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                      required
                    />
                    <label htmlFor="locname">Location Name</label>
                    <span id="locnameerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="locaddress"
                      name="locaddress"
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="255"
                      required
                    />
                    <label htmlFor="locaddress">Address</label>
                    <span id="locaddresserror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="loccity"
                      name="loccity"
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="255"
                      pattern="^[A-Za-z]*((-|'|\s)*[A-Za-z])*$"
                      required
                    />
                    <label htmlFor="loccity">City</label>
                    <span id="loccityerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="locstate"
                      name="locstate"
                      className="validate"
                      type="text"
                      minLength="2"
                      maxLength="3"
                      pattern="^[A-Z]*$"
                      required
                    />
                    <label htmlFor="locstate">State</label>
                    <span id="locstateerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="locpostcode"
                      name="locpostcode"
                      className="validate"
                      type="number"
                      max="9999"
                      required
                    />
                    <label htmlFor="locpostcode">Post Code</label>
                    <span id="locpostcodeerror" className="helper-text"></span>
                  </div>
                </div>

                <div className="row">
                  <div className="input-field col s12">
                    <input
                      id="locdescript"
                      name="locdescript"
                      className="validate"
                      type="text"
                      required
                    />
                    <label htmlFor="locdescript">Description</label>
                    <span id="locdescripterror" className="helper-text"></span>
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
              <TermsModal />
            </fieldset>

            <fieldset>
              <button
                id="signupbtn"
                className="btn waves-effect waves-light"
                type="button"
                disabled
              >
                SIGN UP<i className="material-icons right">send</i>
              </button>
            </fieldset>
          </form>

          <p>
            Already have an account?
            <a className="modal-trigger" href="#login">
              Login
            </a>
          </p>
          <LoginModal />
        </div>

        <div id="userlogout" className="row" hidden>
          <div className="row">
            <button
              id="logoutbtn"
              className="btn waves-effect waves-light"
              type="button"
            >
              LOGOUT<i className="material-icons right">send</i>
            </button>
          </div>
        </div>
      </div>
    </>
  );
}

function Profile() {
  return (
    <>
      <div id="profile" className="container">
        <div className="error"></div>
        <div className="row">
          <div className="col s6">
            <img
              className="profileimg circle"
              src={profileinfo.ProfilePicture}
            />
          </div>

          <div className="col s6">
            <h5>
              {profileinfo.FirstName} {profileinfo.LastName}
            </h5>
            <p>{profileinfo.Email}</p>
          </div>
        </div>

        <div className="section">
          <p>About {profileinfo.FirstName}</p>
          <p>{profileinfo.Bio}</p>
        </div>

        <div className="section">
          <p>
            <a href={profileinfo.InstagramHandle}>INSTAGRAM</a>
          </p>
          <p>
            <a href={profileinfo.PortfolioURL}>VIEW PORTFOLIO</a>
          </p>
        </div>
      </div>
    </>
  );
}

function MyCollabs({ mycollabs }) {
  return (
    <>
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
              {mycollabs.map((collab) => (
                <tr key={collab.CollaborationID}>
                  <td>{collab.Title}</td>
                  <td>
                    <a
                      className="btn-floating btn-large waves-effect waves-light"
                      collab-id={collab.CollaborationID}
                    >
                      <i className="material-icons">send</i>
                    </a>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div id="viewmycollab" className="hide">
          <div id="collabinfo">
            <h5></h5>
            <p></p>
            <p></p>
          </div>

          <h5>Location</h5>
          <table id="mycollabloctbl" className="highlight">
            <thead>
              <tr>
                <th>Location</th>
                <th>Profile</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>

          <h5>Location Requests</h5>
          <table id="mycollablocreqtbl" className="highlight">
            <thead>
              <tr>
                <th>Location</th>
                <th>Profile</th>
                <th>Approve</th>
                <th>Deny</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>

          <h5>Team</h5>
          <table id="mycollabteamtbl" className="highlight">
            <thead>
              <tr>
                <th>Member</th>
                <th>Profile</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>

          <h5>Team Requests</h5>
          <table id="mycollabteamreqtbl" className="highlight">
            <thead>
              <tr>
                <th>Member</th>
                <th>Profile</th>
                <th>Approve</th>
                <th>Deny</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>
        </div>
      </div>
    </>
  );
}

function JoinedCollabs({ myjoinedcollabs }) {
  return (
    <>
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
            {myjoinedcollabs.map((collab) => (
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
    </>
  );
}

function UserCollab() {
  const tabs = [
    { id: "mycollab", name: "My Collab" },
    { id: "joinedcollab", name: "Joined Collabs" },
  ];

  const [viewTab, setTab] = useState("mycollab");

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
            <MyCollabs mycollabs={mycollablist} />
          ) : viewTab === "joinedcollab" ? (
            <JoinedCollabs myjoinedcollabs={myjoinedcollablist} />
          ) : (
            <h3>There was an issue loading the page</h3>
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
