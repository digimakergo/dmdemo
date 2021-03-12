import React from 'react';
import { Switch, BrowserRouter as Router, Route, Link, useLocation } from "react-router-dom";
import logo from './logo.svg';
import './App.css';
import DMInit from 'digimaker-ui/DMInit';
import Login from './Login';
import Profile from './Profile';
import Photos from './Photos';
import ErrorBoundary from './ErrorBoundary';

function App() {
  return (
    <div className="App">
       <Router basename="/mypage">
        <ErrorBoundary>
              <header className="App-header">
              <div>
              <h1><Link to="/">Mypage</Link></h1>
              <div className="right"><a href="/">Demo</a></div>
              <ul className="nav">
                <li><Link to="/photos">Shared photos</Link> </li>
                <li><Link to="/profile">Profile</Link> </li>
              </ul>
              </div>
              </header>
              <div className="main">
              <Switch>
                <Route path="/login" component={Login}  />
                <Route path="/profile" component={Profile}  />
                <Route path="/photos" component={Photos}  />
                <Route path="/" component={Photos}  />
            </Switch>
              </div>
        </ErrorBoundary>
        </Router>
        <footer>
           Demo based on <a href="http://github.com/digimakergo/digimaker" target="_blank">Digmaker CMF</a> under MIT license
        </footer>
    </div>
  );
}

export default App;
