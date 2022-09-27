import { env } from 'process';
import React, { Component } from 'react';
import config from './dm.json';

export default class ErrorBoundary extends React.Component<{}, {error:any, errorInfo:any}> {
  constructor(props) {
    super(props);
    this.state = { error: null, errorInfo: null };
  }

  componentDidCatch(error, errorInfo) {
    if( error.code=='0001' && window.location.pathname == env.PUBLIC_URL+ config.default_url ){
      window.location.href = env.PUBLIC_URL+'/login';
      return;
    }
    this.setState({
      error: error,
      errorInfo: errorInfo
    })
  }

  render() {
    let error = this.state.error;
    //todo: support different error hierarchy: 1) app level error. eg. refresh token expired.  2) view level eg. no access to a content/action.
    // maybe need different error boundary components / error types.
    if (this.state.errorInfo) {
      return (
        <div className="error-main alert alert-warning">
          <h2>Error</h2>
          <div>{error&&<div>
            {error.code=='0001'&&<div>
              Error message: {error.message}
              <div>
                <a href={env.PUBLIC_URL+'/login'}>Login</a>
              </div>
            </div>}
            </div>}</div>
          {this.props.children}
        </div>
      );
    }
  }
}
