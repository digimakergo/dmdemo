import React from "react";
import {
  Switch,
  BrowserRouter as Router,
  Link,
  Route,
  Redirect,
} from "react-router-dom";
import "./App.css";
import Slidemenu from "./Slidemenu";
import Login from "./user/Login";
import Select from "digimaker-ui/tinymce/Select";
import Logout from "./user/Logout";
import CurrentUser from "./user/CurrentUser";
import { MenuList } from "./leftmenu/MenuList";
import {
  getListConfig,
  getMainConfig,
  getViewSettings,
  getEditField,
  leftConfig,
  getBrowseAfterList,
} from "./Config";
import {DMInit, Main} from "digimaker-ui";
import {ViewVersion} from "digimaker-ui/view";
import MultiUpload from 'digimaker-ui/MultiUpload';
import queryString from "query-string";
import ErrorBoundary from "./ErrorBoundary";
import {Create, Edit} from "digimaker-ui/actions";
import { useState } from "react";
import { FullEdit } from "dmeditor-digimaker/actions/FullEdit";
import { FullCreate } from "dmeditor-digimaker/actions/FullCreate";
// import { FullEdit } from "./actions/FullEdit";
// import { FullCreate } from "./actions/FullCreate";
import './Init';
import './DMEditorInit';
import toast, { Toaster } from 'react-hot-toast';

const App = (props) => {
  const [current, setCurrent] = useState(null);  

  return (
    <>
    <Toaster />
    <ErrorBoundary>
      <Router basename={process.env.PUBLIC_URL}>
        <Switch>
          <Route path="/login" component={Login} />
          <Route path="/logout" component={Logout} />
          <Redirect exact={true} from="/" to={"/main/3"} />
          <Route
            path="/tinymce/select/:data"
            exact={true}
            render={(route) => (
              <Select data={route.match.params.data} browseConfig={{}} />
            )}
          />
          <Route
            path="/fulledit/:id"
            exact={true}
            render={(route) => (
              <FullEdit
                id={parseInt(route.match.params.id)}
                afterAction={(status, _params) =>
                  commonAfterAction(route.history, status, [
                    getFromParam(route.location.search),
                    `/main/${route.match.params.id}`,
                  ])
                }
                editField={(contentType: string)=>{
                  return getEditField(contentType)
                }}
              />
            )}
          />
          <Route
            path="/fullcreate/:id/:contenttype"
            exact={true}
            render={(route) =>(
              <FullCreate
                id={parseInt(route.match.params.id)}
                afterAction={(status, _params) =>
                  commonAfterAction(route.history, status, [
                    getFromParam(route.location.search),
                    `/main/${route.match.params.id}`,
                  ])
                }
                contentType={route.match.params.contenttype}
                editField={getEditField(route.match.params.contenttype)}
              />
            )}
          />  
          <Route>
            <div className="App">
              <DMInit 
              viewSettings={getViewSettings} 
              dateTime={{format:'YYYY-MM-DD hh:mm'}} 
              browseAfterList={getBrowseAfterList}>
                <div className="left">
                  <div className="logomenu">
                    <Slidemenu config={leftConfig}>
                      <a
                        className="logo"
                        href="/"
                        onClick={(e) => e.preventDefault()}
                      >
                        <img
                          alt=""
                          src={`${process.env.PUBLIC_URL}/images/logo.png`}
                          width="28px"
                        />
                      </a>
                    </Slidemenu>
                    <CurrentUser
                      as={(user) => (
                        <Link to="/1" className="profile">
                          {" "}
                          <i className="fas fa-user" />
                          &nbsp;{user.name}
                        </Link>
                      )}
                    />
                  </div>
                  <div>
                    <MenuList config={leftConfig} current={current} />
                  </div>
                </div>
                <div className="main">
                  <div>
                    <Route
                      path="/main/:id"
                      exact={true}
                      render={(route) => (
                        <Main
                          onLoad={(content) => {
                            setCurrent(content);
                          }}
                          id={parseInt(route.match.params.id)}
                          getMainConfig={getMainConfig}
                          getListConfig={getListConfig}
                          redirect={(url: string) =>
                            commonAfterAction(route.history, 0, [url])
                          }
                        />
                      )}
                    />
                    <Route
                      path="/main/:contenttype/:id"
                      exact={true}
                      render={(route) => (
                        <Main                        
                          id={parseInt(route.match.params.id)}
                          contenttype={route.match.params.contenttype}
                          getMainConfig={getMainConfig}
                          getListConfig={getListConfig}
                          redirect={(url: string) =>
                            commonAfterAction(route.history, 0, [url])
                          }
                        />
                      )}
                    />
                    <Route
                      path="/create/:parent/:contenttype"
                      render={(route) => (
                        <Create
                          key={Date.now()}
                          parent={parseInt(route.match.params.parent)}
                          contenttype={route.match.params.contenttype}
                          afterAction={(status) =>
                            commonAfterAction(route.history, status, [
                              `/main/${route.match.params.parent}`,
                            ])
                          }
                        />
                      )}
                    />
                    <Route
                      path="/edit/:contenttype/:id"
                      exact={true}
                      render={(route) => (
                        <Edit
                          id={parseInt(route.match.params.id)}
                          contenttype={route.match.params.contenttype}
                          afterAction={(status, _params) =>
                            commonAfterAction(route.history, status, [
                              getFromParam(route.location.search),
                              `/main/${route.match.params.contenttype}/${route.match.params.id}`,
                            ])
                          }
                        />
                      )}
                    />
                    <Route
                      path="/edit/:id"
                      exact={true}
                      render={(route) => (
                        <Edit
                          id={parseInt(route.match.params.id)}
                          afterAction={(status, _params) =>
                            commonAfterAction(route.history, status, [
                              getFromParam(route.location.search),
                              `/main/${route.match.params.id}`,
                            ])
                          }
                        />
                      )}
                    />                   
                    <Route
                      path="/version/:id/:version"
                      component={ViewVersion}
                    />
                    <Route
                      path="/image/multiupload/:parent"
                      exact={true}
                      render={(route) =>(
                        <MultiUpload 
                          name='multiUpload' 
                          service="content" 
                          multi={true} 
                          format="image/*" 
                          value={[]} 
                          parent={route.match.params.parent}
                          afterAction={(status) =>
                            commonAfterAction(route.history, status, [
                              `/main/${route.match.params.parent}`,
                            ])}
                          />
                      )}
                    /> 
                  </div>
                  <footer>
                    Powered by{" "}
                    <a
                      href="http://www.digimaker.com"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      <img
                        alt="Digimaker"
                        src={`${process.env.PUBLIC_URL}/logo.png`}
                        height="18px"
                      />
                      &nbsp;Digimaker CMF
                    </a>
                  </footer>
                </div>
              </DMInit>
            </div>
          </Route>
        </Switch>
      </Router>
    </ErrorBoundary>
    </>
  );
};

//with priorized urls, it does redirection. first url which is not empty will be redirected.
const commonAfterAction = (history: any, _status: number, urls: any[]) => {
  for (let url of urls) {
    if (url) {
      history.push(url);
      break;
    }
  }
};

const getFromParam = (location: string) => {
  let params = queryString.parse(location);
  return params["from"];
};

export default App;
