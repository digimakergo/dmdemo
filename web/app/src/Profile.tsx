import * as React from 'react';
import DMInit from 'digimaker-ui/DMInit'
import {FetchWithAuth} from 'digimaker-ui/util';
import util from 'digimaker-ui/util';
import LoadFields from 'digimaker-ui/LoadFields';

export default class Profile extends React.Component<{}, {data:any}> {

  constructor(props:any){
      super(props);
      this.state={data:''};
    }

  componentDidMount(){
    this.fetchProfile();
  }

  fetchProfile(){
    FetchWithAuth(process.env.REACT_APP_REMOTE_URL + '/user/current/admin')
        .then(res => res.json())
        .then((data) => {
            this.setState({data: data});
        }).catch(err=>{
          this.setState(()=>{throw err});
        })
  }

  render () {
    if( !this.state.data ){
      return '';
    }

    return (
        <div>
          <h2>My profile</h2>
          <h3>{this.state.data.name}</h3>
            <LoadFields mode="view" type={"user"} data={this.state.data}  />
        </div>
    );
  }
}
