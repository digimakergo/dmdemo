import React,{Component, useState, useEffect} from 'react';
import { Switch, HashRouter as Router, Route, NavLink, Link, useLocation } from "react-router-dom";
import logo from './logo.svg';
import './App.css';
import DMInit from 'digimaker-ui/DMInit';
import Login from './Login';
import Profile from './Profile';
import Photos from './Photos';
import ErrorBoundary from './ErrorBoundary';
import {FetchWithAuth} from 'digimaker-ui/util';

function App() {
  return (
    <div className="App">
       <Router>
        <ErrorBoundary>
              <header className="App-header">
              <div>
              <div className="right-float">
                <div><a href="/">Demo home page</a></div><br />
                <NavLink activeClassName="active" to="/profile"><UserInfo /></NavLink> <br />
              </div>
              <h1><Link to="/">My page</Link></h1>
              <ul className="nav">
                <li><NavLink activeClassName="active" to="/">Shared photos</NavLink> </li>
              </ul>
              </div>
              </header>
              <div className="main">
              <Switch>
                <Route path="/login" component={Login}  />
                <Route path="/profile" component={Profile}  />
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

const UserInfo=() =>{
  const [user, setUser] = useState('');

  useEffect(()=>{
    if( !user ){
      FetchWithAuth( 'user/current/dmdemo')
         .then((data:any)=>{
          setUser( data.data );
        }).catch(err=>{
          console.error(err);
        });
    }
  })

  return user?user['name']:'';
}
