import * as React from 'react';
import { NavLink, useLocation } from "react-router-dom";
import Treemenu from './Treemenu';

//A menu container which list all the menus from top to down.
export const MenuList = (props:{config:any, index?:number, current?:any}) => {
  console.log("123")
    let location = useLocation();
    let path = location.pathname;

    let menus:any = null;
    if( props.index == null){
      menus = getCurrentMenu(path, props.current, props.config);
    }else{
      menus = props.config[props.index];
    }

    
    let menuKey = '';
      menuKey = `${menuKey}-${menus.name}`;

    return (<React.Suspense fallback="..."><div key={menuKey}>
          { menus.type === 'treemenu'&&
            <Treemenu key={menus.name} current={props.current} config={menus} />                      
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
