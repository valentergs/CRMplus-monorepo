import React, { Fragment } from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import "./App.css";

// Components
import DashBoard from "./Components/Dashboard/DashBoard";
import Header from "./Components/Layout/Header";
import Usuarios from "./Components/Usuario/Usuarios";
import About from "./Components/pages/About";
import Register from "./Components/Auth/Register";
import Login from "./Components/Auth/Login";
import Alerts from "./Components/Layout/Alerts.js";

// Contexts
import CrmplusState from "./Context/crmplus/crmplusState";
import AuthState from "./Context/auth/authState";
import AlertState from "./Context/alert/AlertState";

const App = () => {
  return (
    <AuthState>
      <CrmplusState>
        <AlertState>
          <Router>
            <Fragment>
              <Header />
              <div className="container">
                <Alerts />
                <Switch>
                  <Route exact path="/dashboard" component={DashBoard} />
                  <Route exact path="/usuarios" component={Usuarios} />
                  <Route exact path="/about" component={About} />
                  <Route exact path="/register" component={Register} />
                  <Route exact path="/" component={Login} />
                </Switch>
              </div>
            </Fragment>
          </Router>
        </AlertState>
      </CrmplusState>
    </AuthState>
  );
};

export default App;
