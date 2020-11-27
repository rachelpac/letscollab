import React, { useState, useReducer, Component, useEffect } from "react";
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
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=displaycollabs"
    )
      .then((result) => result.json())
      .then(setData)
      .catch(console.error);
  }, []);
  if (data) {
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
    );
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
  const [disablesearchloc, toggledisablesearchloc] = useReducer(
    (disabled) => !disabled,
    false
  );
  const [hiddensearchloc, togglesearchloc] = useReducer(
    (hidden) => !hidden,
    true
  );
  const [disableaddloc, toggledisableaddloc] = useReducer(
    (disabled) => !disabled,
    false
  );
  const [hiddenaddmember, toggleaddmember] = useReducer(
    (hidden) => !hidden,
    true
  );
  const [hiddensearchmember, togglesearchmember] = useReducer(
    (hidden) => !hidden,
    true
  );

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

class UserLogin extends Component {
  componentDidMount() {
    M.AutoInit();
  }

  state = {
    luname: "",
    lpword: "",
  };

  onChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  onSubmit = (e) => {
    e.preventDefault();
    const { luname, lpword } = this.state;
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=reactlogin",
      {
        method: "POST",
        body: JSON.stringify(this.state),
      }
    ).then((response) => {
      console.log(response);
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
          console.log(data);
          localStorage.setItem("loggedinuser", data.username);
          localStorage.setItem("loggedinuserid", data.userid);
          localStorage.setItem("loggedinlocid", data.locid);
        });
        M.toast({ html: "You are now logged in", classes: "green" });
      }
    });
  };

  render() {
    const { luname, lpword } = this.state;
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
                    value={lpword}
                    className="validate"
                    type="password"
                    onChange={this.onChange}
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
  state = {
    hiddenaddlocacc: true,
    hiddenadduseracc: true,
  };
  componentDidMount() {
    M.AutoInit();
  }

  toggleaddlocacc = () => {
    this.setState((prevState) => ({
      hiddenaddlocacc: !prevState.hiddenaddlocacc,
    }));
  };

  toggleadduseracc = () => {
    this.setState((prevState) => ({
      hiddenadduseracc: !prevState.hiddenadduseracc,
    }));
  };

  render() {
    const { hiddenaddlocacc, hiddenadduseracc } = this.state;
    return (
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
                onChange={this.toggleadduseracc}
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
                onChange={this.toggleaddlocacc}
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
    );
  }
}

class UserLogout extends Component {
  logout() {
    fetch(
      "http://localhost:8888/letscollab/letscollab/api/api.php?getData=logout"
    ).then((response) => {
      console.log(response);
      if (response.status === 409) {
        M.toast({ html: "You were not logged in", classes: "red" });
      }
      if (response.status === 200) {
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

function SignUp() {
  return (
    <>
      <div id="signup" className="container">
        <div id="userlogin" className="row">
          <UserSignup />
          <UserLogin />
        </div>
        <UserLogout />
      </div>
    </>
  );
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
    console.log(loggedin);
    return loggedin;
  };

  componentDidMount() {
    const fetchloggedin = this.setUser();
    console.log(fetchloggedin);
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
      console.log(response);
      if (response.status === 401) {
        M.toast({ html: "Please log in to view your profile", classes: "red" });
        this.setState({ loaded: true, response401: true });
      }
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
        this.setState({ loaded: true, response412: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          console.log(data);
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
      return (
        <div id="profile" className="container">
          <p>Too Many Requests</p>
        </div>
      );
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
      console.log(response);
      if (response.status === 401) {
        M.toast({ html: "Please log in to view your profile", classes: "red" });
        this.setState({ loaded: true, response401: true });
      }
      if (response.status === 412) {
        M.toast({ html: "Too Many Requests", classes: "red" });
        this.setState({ loaded: true, response412: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          console.log(data);
          this.setState({ loaded: true, response200: true, collablist: data });
        });
      }
    });
  }

  showMyCollab = (e) => {
    this.setState({ collabinforequested: true });
    var id = e.currentTarget.getAttribute("collab-id");
    console.log(id);
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
        console.log(data);
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
        console.log(data);
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
              console.log(data);
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
        console.log(data);
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
        console.log(data);
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
      return (
        <div>
          <p>Too Many Requests</p>
        </div>
      );
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
                                >
                                  <i className="material-icons">done</i>
                                </a>
                              </td>
                              <td>
                                <a
                                  className="btn-floating btn-large waves-effect waves-light red"
                                  loc-request-id={request.LocationRequestID}
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
                          {member.FirstName} {member.LastName} {member.Role}{" "}
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
                            <a class="btn-floating btn-large waves-effect waves-light">
                              <i class="material-icons">person</i>
                            </a>
                          </td>
                          <td>
                            <a
                              class="btn-floating btn-large waves-effect waves-light green"
                              tm-role={member.Role}
                              user-id={member.UserID}
                              collab-id={member.CollaborationID}
                              tm-request-id={member.TeamMemberRequestID}
                              tm-search-id={member.TeamMemberSearchID}
                            >
                              <i class="material-icons">done</i>
                            </a>
                          </td>
                          <td>
                            <a
                              class="btn-floating btn-large waves-effect waves-light red"
                              tm-request-id={member.TeamMemberRequestID}
                            >
                              <i class="material-icons">clear</i>
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
    console.log(loggedin);
    return loggedin;
  };

  componentDidMount() {
    const fetchuserrequests = this.setUser();
    console.log(fetchuserrequests);
    fetch(
      `http://localhost:8888/letscollab/letscollab/api/api.php?getData=${fetchuserrequests}`
    ).then((response) => {
      console.log(response);
      if (response.status === 401) {
        M.toast({
          html: "Please log in to view your collaborations requests",
          classes: "red",
        });
        this.setState({ loaded: true, response401: true });
      }
      if (response.status === 200) {
        response.json().then((data) => {
          console.log(data);
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
    console.log(loggedin);
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
                <h3>There was an issue loading the page</h3>
              )}
            </>
          ) : viewTab === "joinedcollab" ? (
            <JoinedCollabs />
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
