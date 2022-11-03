import React from "react";
import {
	Switch,
	BrowserRouter as Router,
	Link,
	Route,
	Redirect,
} from "react-router-dom";
import "./App.css";
import Slidemenu from "./leftmenu/Slidemenu";
import Login from "./user/Login";
import Select from "digimaker-ui/tinymce/Select";
import Logout from "./user/Logout";
import CurrentUser from "./user/CurrentUser";
import { MenuList } from "./leftmenu/MenuList";
import { getListConfig, getMainConfig, getViewSettings, leftConfig } from "./Config";
import "./Init";
import DMInit from "digimaker-ui/DMInit";
import ContextProvider from "./ContextProvider";
import queryString from "query-string";
import ErrorBoundary from "./ErrorBoundary";
import ViewVersion from "digimaker-ui/view/ViewVersion";
import Main from "./main/Main";
import Create from "digimaker-ui/actions/Create";
import Edit from "digimaker-ui/actions/Edit";

const App = () => {
	// util.setConfig(Config);
	// util.setCookieKey("dm_eui"); //todo: use .env?
	// const errorMessage = "No access to view";

	return (
		<ContextProvider>
			{/*context between right and left area */}
			<ErrorBoundary>
			<Router basename={process.env.PUBLIC_URL}>
				<Switch>
					<Route path='/login' component={Login} />
					<Route path='/logout' component={Logout} />
					<Redirect exact={true} from='/' to={'/main/3'} />
					<Route
						path='/tinymce/select/:data'
						exact={true}
						render={(route) => (
							<Select data={route.match.params.data} browseConfig={{}} />
						)}
					/>
					<Route>
						<div className='App'>
							<DMInit
								viewSettings={getViewSettings}
							>
								<div className='left'>
									<div className='logomenu'>
										<Slidemenu config={leftConfig}>
											<a className='logo' href='/' onClick={(e)=>e.preventDefault()}>
												<img
												    alt=''
													src={`${process.env.PUBLIC_URL}/images/logo.png`}
													width='28px'
												/>
											</a>
										</Slidemenu>
										<CurrentUser
											as={(user) => (
												<Link to='/1' className='profile'>
													{" "}
													<i className='fas fa-user' />&nbsp;{user.name}
												</Link>
											)}
										/>
									</div>
									<div>
										<MenuList config={leftConfig} />
									</div>
								</div>
								<div className='main'>
									<div>
										<Route
											path='/main/:id'
											exact={true}
											render={(route) => (
												<Main
													id={parseInt(route.match.params.id)}
													getMainConfig={getMainConfig}
													getListConfig={getListConfig}
													redirect={(url: string) =>
														commonAfterAction(route.history, 0, [url])}
												/>
											)}
										/>
										<Route
											path='/main/:contenttype/:id'
											exact={true}
											render={(route) => (
												<Main
													id={parseInt(route.match.params.id)}
													contenttype={route.match.params.contenttype}
													getMainConfig={getMainConfig}
													getListConfig={getListConfig}
													redirect={(url: string) =>
														commonAfterAction(route.history, 0, [url])}
												/>
											)}
										/>
										<Route
											path='/create/:parent/:contenttype'
											render={(route) => (
												<Create
													key={Date.now()}
													parent={parseInt(route.match.params.parent)}
													contenttype={route.match.params.contenttype}
													afterAction={(status) =>
														commonAfterAction(route.history, status, [
															`/main/${route.match.params.parent}`,
														])}
												/>
											)}
										/>
										<Route
											path='/edit/:contenttype/:id'
											exact={true}
											render={(route) => (
												<Edit
													id={parseInt(route.match.params.id)}
													contenttype={route.match.params.contenttype}
													afterAction={(status, _params) =>
														commonAfterAction(route.history, status, [
															getFromParam(route.location.search),
															`/main/${route.match.params.contenttype}/${route.match.params.id}`,
														])}
												/>
											)}
										/>
										<Route
											path='/edit/:id'
											exact={true}
											render={(route) => (
												<Edit
													id={parseInt(route.match.params.id)}
													afterAction={(status, _params) =>
														commonAfterAction(route.history, status, [
															getFromParam(route.location.search),
															`/main/${route.match.params.id}`,
														])}
												/>
											)}
										/>
										<Route
											path='/version/:id/:version'
											component={ViewVersion}
										/>
									</div>
									<footer>
										Powered by <a
											href='http://www.digimaker.com'
											target='_blank'
											rel="noopener noreferrer" 
										>
											<img
											    alt="Digimaker"
												src={`${process.env.PUBLIC_URL}/logo.png`}
												height='18px'
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
		</ContextProvider>
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
