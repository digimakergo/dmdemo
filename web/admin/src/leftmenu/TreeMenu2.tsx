import * as React from 'react';
import { useState } from 'react';
import { NavLink,useLocation} from "react-router-dom";
import ReactTooltip from "react-tooltip";
import TreeNode from 'digimaker-ui/TreeNode';
import { Collapse } from 'react-bootstrap';

//A menu container which list all the menus from top to down.
export const TreeMenu = (props:{config:any, index?:number, current:any}) => {
    const [data,setData] = useState({})
    const [selectedId,setSelectedId] =useState(0 as any)

    let location = useLocation();
    let path = location.pathname;
    let menuKey:any = '';

    
    let menus:any = null;
    if( props.index == null){
      menus = getCurrentMenu(path, props.current, props.config);
    }else{
      menus = props.config[props.index];
    }
    menuKey = `${menuKey}-${menus.name}`;

    let isOpen=menus.open?true:false;
   
    

    if(menus){
      let hierarchy = menus.hierarchy;
      if( hierarchy ){
        let selectedIdStrArray = hierarchy.split('/');
        let selectedIdArray:Array<number> = [];
        for( let i=0; i<selectedIdStrArray.length; i++ ){
          selectedIdArray[i] = parseInt( selectedIdStrArray[i] );
        }
        setSelectedId(selectedIdArray)
      }
    }

    const treenodeChange=(e, data)=>{
      menus=data;
    }
    
    if(!menus){
      return null
    }
    return (<React.Suspense fallback="..."><div key={menuKey}>
          { menus.type === 'treemenu'&&
            <div className="menuitem"  >
              <Collapse in={isOpen}>
                <div className="menuitem-content">
                  <TreeNode key={menus.name} showRoot={false} selectedId={selectedId} rootID={menus.root} contenttype={menus.contenttype} onDataFetched={data=>setData(data)} onClick={(e, data)=>treenodeChange(e,data)} />
                </div>
              </Collapse>
          </div>                    
          }
    </div></React.Suspense>)
}

//get leftmenu configuration based on location path
function getCurrentMenu(path: string, content:any, leftmenuConfig: any) {
    let result:any[] = [];

    for (let i = 0; i < leftmenuConfig.length; i++) {
        if (result.length > 0) {
            break;
        }
        let menus = leftmenuConfig[i];
        if(menus.path===path){
          result = menus;
        }
        if(menus.root){
          if( content && content.hierarchy && content.hierarchy.split( '/' ).includes( menus.root.toString() ) )
          {
            result =menus;
            break;
          }
        }
    }
    return result;
}
