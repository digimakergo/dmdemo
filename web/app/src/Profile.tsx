import * as React from 'react';
import DMInit from 'digimaker-ui/DMInit'
import {FetchWithAuth} from 'digimaker-ui/util';
import util from 'digimaker-ui/util';
import RenderFields from 'digimaker-ui/RenderFields';
import Loading from './Loading';

export default class Profile extends React.Component<{}, {mode:string, validation: any, data:any}> {

  constructor(props:any){
      super(props);
      this.state={mode:'view',validation:'',data:''};
    }

  componentDidMount(){
    this.fetchProfile();
  }

  //fetch profile data
  fetchProfile(){
    FetchWithAuth(process.env.REACT_APP_REMOTE_URL + '/user/current/dmdemo')
        .then((data) => {
            this.setState({data: data.data});
        }).catch(err=>{
          this.setState(()=>{throw err});
        })
  }

  //change to edit mode
  edit(){
      this.setState({mode: 'edit'});
  }

  //submit edit
  submit(e){
  e.preventDefault();

  const form = new FormData(e.target);
    const dataObject = {};
    for (let key of Array.from(form.keys())) {
        dataObject[key] = form.get(key);
    };

    let url = '/content/update/'+this.state.data.id;
    FetchWithAuth(process.env.REACT_APP_REMOTE_URL + url, {
        method: 'POST',
        body: JSON.stringify(dataObject),
    }).then((data) => {
        if (data.error==false) {
          this.setState({mode:'view', data:''});
          this.fetchProfile();
        }else {
          this.setState( {validation: data.data} )
        }
    })
}

  render () {
    if( !this.state.data ){
      return <Loading />;
    }

    return (
        <div>
          <h2>My profile</h2>

          <form onSubmit={e=>this.submit(e)}>
              <RenderFields mode={this.state.mode} type={"user"} data={this.state.data} validation={this.state.validation}  />

              {this.state.mode=='view'&&<div>
              <br />
                <input type="button" className="btn btn-primary btn-sm" onClick={()=>this.edit()} value="Edit" />
              </div>}

              {this.state.mode=='edit'&&<div>
                <br /><br />
                <input type="submit" className="btn btn-primary btn-sm" value="Save" /> &nbsp;
                <input type="button" onClick={()=>this.setState({mode: 'view'})} className="btn btn-light btn-sm" value='Cancel' />
              </div>}
            </form>
        </div>
    );
  }
}
