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
import queryString from 'query-string';
import ErrorBoundary from './ErrorBoundary';
import ViewVersion from 'digimaker-ui/view/ViewVersion';
import Main from './main/Main';
import Create from 'digimaker-ui/actions/Create';
import Edit from 'digimaker-ui/actions/Edit';

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
            <Route path="/tinymce/select/:data" exact render={route=><Select data={route.match.params.data} browseConfig={{}} />} />
            <Route>
            <div className="App">
                <DMInit contenttypeSetting={(contenttype:string)=>{
                    if( contenttype == 'image' ){
                        return {inline_fields:["image"], block_fields:["name","image"],browselist:{viewmode: 'block', columns:["name"], sort_default:[["priority", "desc"]] }};
                    }else{
                        return {inline_fields:["name"],browselist:{viewmode: 'list', columns:["name", "published"], sort_default:[["priority", "desc"]] }}};
                    }
                }>
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
                <div>
                    <Route path="/main/:id" exact render={route=><Main id={parseInt(route.match.params.id)} getMainConfig={getMainConfig} getListConfig={getListConfig} redirect={(url:string)=>commonAfterAction( route.history, 0,[url] ) } />} />
                    <Route path="/main/:contenttype/:id" exact render={route=><Main id={parseInt(route.match.params.id)} contenttype={route.match.params.contenttype} getMainConfig={getMainConfig} getListConfig={getListConfig}  redirect={(url:string)=>commonAfterAction( route.history, 0,[url] ) } />} />
                    <Route path="/create/:parent/:contenttype" render={route=><Create key={Date.now()} parent={parseInt(route.match.params.parent)} contenttype={route.match.params.contenttype} afterAction={(status)=>commonAfterAction( route.history, status, ['/main/' + route.match.params.parent] )} />} />
                    <Route path="/edit/:contenttype/:id" exact render={route=><Edit id={parseInt(route.match.params.id)} contenttype={route.match.params.contenttype} afterAction={(status, params)=>commonAfterAction(route.history,status, [getFromParam(route.location.search), '/main/'+route.match.params.contenttype+'/'+route.match.params.id])} />} />
                    <Route path="/edit/:id" exact render={route=><Edit id={parseInt(route.match.params.id)} afterAction={(status, params)=>commonAfterAction(route.history,status, [getFromParam(route.location.search), '/main/'+route.match.params.id])} />} />
                    <Route path="/version/:id/:version" component={ViewVersion} />
                </div>
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

const getMainConfig = (content:any)=>{
    let commonActions = [{
        "link": "/edit/{id}",
        "name": "Edit",
        "icon": "icon-edit",
        "title": "Edit the content"
      }];
    let mainConfig = {...Config.main[content.content_type]};
    mainConfig["actions"] = [ commonActions, ...mainConfig["actions"]];

    let list = [] as string[];
    if( content.content_type==='folder' ){
        let ids = content.hierarchy.split('/');
        if( ids.includes('3') ){
            list = [...list, "article"];
        }
        if( ids.includes('583') || ids.includes('461') ){
            list = [...list, "image"];
        }

        if( ids.includes('4') ){
            list = [...list, "user"];
        }

        if( ids.includes('7') ){
            list = [...list, "role"];
        }

        mainConfig['list'] = list;
        mainConfig['new'] = ['folder', list];
    }
    return mainConfig;
}

const getListConfig = (parent:string, contenttype: string)=>{
    return Config.list[contenttype];
}

//with priorized urls, it does redirection. first url which is not empty will be redirected.
const commonAfterAction = (history:any, status:number, urls:Array<any>)=>{
    for( let url of urls ){
       if( url ){
         history.push( url );
         break;
       }
    }
};

const getFromParam = (location:string)=>{
    let params = queryString.parse(location);
    return params['from'];
  };

export default App;
