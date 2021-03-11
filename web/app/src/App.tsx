import React from 'react';
import { Switch, BrowserRouter as Router, Route, Link, useLocation } from "react-router-dom";
import logo from './logo.svg';
import './App.css';
import DMInit from 'digimaker-ui/DMInit';
import Login from './Login';
import Profile from './Profile';
import ErrorBoundary from './ErrorBoundary';

function App() {
  return (
    <div className="App">
       <Router>
        <ErrorBoundary>
              <header className="App-header">
              <h1><Link to="/">Mypage</Link></h1>
              <ul className="nav">
                <li><Link to="/profile" className="logo">Profile</Link> </li>
                <li><Link to="/login">Login</Link></li>
              </ul>
              </header>
              <Switch>
                <Route path="/login" component={Login}  />
                <Route path="/profile" component={Profile}  />
            </Switch>
        </ErrorBoundary>
        </Router>
    </div>
  );
}

export default App;
