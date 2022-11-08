import * as React from 'react';
import { NavLink } from "react-router-dom";
import ReactTooltip from "react-tooltip";
import TreeNode from 'digimaker-ui/TreeNode';
import { Collapse } from 'react-bootstrap';

export default class Treemenu extends React.Component<{ config: any, current:any }, { rotating:boolean, current:any, open:boolean, data: any }> {

  constructor(props: any) {
    super(props);
    this.state = { current:'', rotating: false,open: props.config.open?true:false, data: {} };
  }

  componentDidMount() {
    this.setState({current: this.props.current});
  }

  treenodeChange(e, data){
    this.setState({current: data});
  }

  async refresh(e){
    e.preventDefault();
    this.setState({rotating: true});
  }

  render() {
    let isOpen = this.state.open;

    let selectedId:any = 0;
    if( this.state.current ){
       let hierarchy = this.state.current.hierarchy;
       if( hierarchy ){
          let selectedIdStrArray = hierarchy.split('/');
          let selectedIdArray:Array<number> = [];
          for( let i=0; i<selectedIdStrArray.length; i++ ){
            selectedIdArray[i] = parseInt( selectedIdStrArray[i] );
          }
          selectedId = selectedIdArray;
       }
    }
    
    return (
      <div className="menuitem">
          <div className="menuitem-head">
            <NavLink to={`/main/${this.state.data.id}`} activeClassName="selected">
              <i className={this.props.config.icon}></i> {this.state.data.name}
            </NavLink>
       
            <span className="right">
            {this.props.config.refresh&&<a href="/" onClick={(e)=>this.refresh(e)} style={{marginRight:'15px'}}><i className={"fas fa-sync"+(this.state.rotating?' rotate':'')}></i></a>}
            {this.props.config.is_site &&
              <a className="select-site" href="/" onClick={e=>e.preventDefault()} data-tip="Site list"><i className="fas fa-list"></i></a>}
              {this.state.data.children&&<a href="/" onClick={(e:any)=>{e.preventDefault();this.setState({open:!this.state.open})}}>
                 <i className={"foldable fas fa-chevron-right"+(this.state.open?' open':'')}>
              </i></a>}
              <ReactTooltip effect="solid" />
            </span>
          </div>

          <Collapse in={isOpen}>
            <div className="menuitem-content">
              <TreeNode showRoot={false} selectedId={selectedId} rootID={this.props.config.root} contenttype={this.props.config.contenttype} onDataFetched={data=>this.setState({data:data})} onClick={(e, data)=>this.treenodeChange(e, data)} />
            </div>
          </Collapse>
      </div>
    );
  }
}
