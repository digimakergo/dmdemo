import * as React from 'react';
import DMInit from 'digimaker-ui/DMInit'
import {FetchWithAuth} from 'digimaker-ui/util';
import util from 'digimaker-ui/util';
import Moment from 'react-moment';
import Loading from './Loading';
import FileUpload from 'digimaker-ui/FileUpload';


export default class Photos extends React.Component<{}, {data:any, showMine:boolean, showAdding: boolean, uploadedPath: string, uploadedName:string}> {

  constructor(props:any){
      super(props);
      this.state={data:'', showMine: false, showAdding: false, uploadedPath:'',uploadedName:''};
    }

  componentDidMount(){
    this.fetchPhotos();
  }

  componentDidUpdate( prevProps, prevState, snapshot ){
    //when changing page
    if( prevState.showMine != this.state.showMine)
    {
      this.fetchPhotos();
    }
  }

  fetchPhotos(){
    let showMine = '';
    if( this.state.showMine ){
      showMine='&field.author=1'; //todo: get dynamic
    }
    FetchWithAuth(process.env.REACT_APP_REMOTE_URL + '/content/list/image?parent='+process.env.REACT_APP_PHOTO_ROOT+'&level=1&sortby=published%20desc&limit=10&offset=0'+showMine)
        .then(res => res.json())
        .then((data) => {
            this.setState({data: data});
        }).catch(err=>{
          this.setState(()=>{throw err});
        })
  }


  updated(data){
    let name = this.state.uploadedName;
    if( !name ){
      name = data.name;
      name = name.split('.').slice(0, -1).join('.')
    }
    this.setState({uploadedPath: data.nameUploaded, uploadedName: name})
  }

  inputName(e){
    this.setState({uploadedName: e.target.value})
  }

  submit(){
    let dataObject = {'name': this.state.uploadedName, 'image': this.state.uploadedPath};
    FetchWithAuth(process.env.REACT_APP_REMOTE_URL + '/content/new/' + process.env.REACT_APP_PHOTO_ROOT + '/image', {
        method: 'POST',
        body: JSON.stringify(dataObject),
    }).then((res) => {
        if (res.ok) {
          this.setState({uploadedPath: '', uploadedName:'', showAdding: false});
          this.fetchPhotos();
        } else {
            console.log(res)
        }
    });
  }

  showAdding(show:boolean){
    this.setState({showAdding: show});
  }

  render () {
    if( !this.state.data ){
      return <Loading />;
    }

    return (
        <div>
          <h2>Photos</h2>

          <div className="block right">
            <label>
              <input type="checkbox" checked={this.state.showMine} onChange={()=>this.setState({showMine: !this.state.showMine})} /> Show mine only
            </label>
            &nbsp;
            <input className="btn btn-sm btn-primary" type="button" value="Add photo" onClick={()=>this.showAdding(true)} />
          </div>

          {this.state.showAdding&&<div className="panel-add">
            <h3>Add photo</h3>

            <div className="block">
              <label>Upload image: </label>
              <FileUpload service="content" format="image/*" onSuccess={(data)=>{this.updated(data)}} />
              {this.state.uploadedPath&&<img src={process.env.REACT_APP_ASSET_URL+"/"+this.state.uploadedPath} />}
            </div>

            <div className="block">
              <label>Name: </label>
              <input className="form-control" type="text" onChange={(e)=>this.inputName(e)} value={this.state.uploadedName} />
            </div>

            <div className="block">
              <input className="btn btn-sm btn-primary" type="button" value="Submit" onClick={()=>this.submit()} /> &nbsp;
              <input className="btn btn-sm btn-secondary" type="button" value="Cancel" onClick={()=>this.showAdding(false)} />
            </div>
          </div>}

          <div className="gallery">
            {this.state.data.list.map( (item) => <div className="gallery-item">
              <div className="gallery-item-header">{item.name}</div>
              <div>
                <a target="_blank" href={process.env.REACT_APP_ASSET_URL+"/"+item.image} >
                  <img src={process.env.REACT_APP_ASSET_URL+"/images/thumbnail/"+item.image} />
                </a>
              </div>
              <div className="gallery-item-author">
                {item.author} on <Moment format="YYYY-MM-DD HH:mm" unix>{item.modified}</Moment>
                </div>
              </div> )}
          </div>
        </div>
    );
  }
}
