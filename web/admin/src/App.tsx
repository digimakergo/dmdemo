import React from 'react';
import { Switch, BrowserRouter as Router, Link, Route, Redirect } from "react-router-dom";
import './App.css';
import Slidemenu from './leftmenu/Slidemenu'
import Login from './user/Login'
import Select from 'digimaker-ui/tinymce/Select';
import Logout from './user/Logout';
import CurrentUser from './user/CurrentUser';
import {MenuList} from './leftmenu/MenuList';
import Config from './dm.json';
import './Init';
import util from 'digimaker-ui/util'
import DMInit from 'digimaker-ui/DMInit'
import ContextProvider from './ContextProvider';
import MainRoute from './MainRoute';
import ErrorBoundary from './ErrorBoundary';

const App: React.FC = () => {

    util.setConfig( Config );
    // util.setCookieKey("dm_eui"); //todo: use .env?
    const errorMessage ='No access to view';

    return (
        <ContextProvider> {/*context between right and left area */}
        <ErrorBoundary>
        <Router basename={process.env.PUBLIC_URL}>
          <Switch>
            <Route path="/login" component={Login}  />
            <Route path="/logout" component={Logout}  />           
            <Redirect exact from="/" to={Config['default_url']} />
            <Route path="/tinymce/select/:data" exact render={route=><Select data={route.match.params.data} />} />
            <Route>
            <div className="App">
                <DMInit>
                <div className="left">
                    <div className="logomenu">                        
                        <Slidemenu config={Config.leftmenu}>
                            <a className="logo" href="#">
                                <img src={process.env.PUBLIC_URL+"/images/logo.png"} width="28px" />
                            </a>
                        </Slidemenu>
                        <CurrentUser as={(user)=>
                                 <Link to="/1" className="profile"> <i className="fas fa-user"></i>&nbsp;{user.name}</Link> 
                        } />
                    </div>    
                    <div>
                      <MenuList config={Config.leftmenu} />
                    </div>
                </div>
                <div className="main">
                    <MainRoute config={Config} />
                    <footer>
                      Powered by <a href="http://www.digimaker.com" target="_blank"><img src={process.env.PUBLIC_URL+"/logo.png"} height="18px" />&nbsp;Digimaker CMF</a>
                    </footer>
                </div>
                </DMInit>
            </div>
            </Route>
            
        </Switch>
        </Router>
        </ErrorBoundary>
        </ContextProvider>
    );
}

export default App;
