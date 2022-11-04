import * as React from 'react';
import { NavLink, useLocation } from "react-router-dom";
import Registry from 'digimaker-ui/Registry'
import Treemenu from './Treemenu';

//A menu container which list all the menus from top to down.
export const MenuList = (props:{config:any, index?:number, current?:any}) => {
    let location = useLocation();
    let path = location.pathname;

    let menus:any = null;
    if( props.index == null){
      menus = getCurrentMenu(path, props.current, props.config);
    }else{
      menus = props.config[props.index].menu;
    }

    
    let menuKey = '';
    for( let menu of menus ){
      menuKey = `${menuKey}-${menu.name}`;
    }

    return (<React.Suspense fallback="..."><div key={menuKey}>
        {menus.map((menu) => {
                return(
                    menu.type === 'treemenu'?
                    <Treemenu key={menu.name} current={props.current} config={menu} />                      
                    :<div className="menuitem">
                        <div className="menuitem-head">
                         <NavLink to={menu.path} activeClassName="selected">
                           <i className={`far ${menu.icon}`} /> {menu.name}
                         </NavLink>
                         </div>
                       </div>
                )
            })}
    </div></React.Suspense>)
}

//get leftmenu configuration based on location path
function getCurrentMenu(path: string, content:any, leftmenuConfig: any) {
    let result:any[] = [];

    for (let i = 0; i < leftmenuConfig.length; i++) {
        if (result.length > 0) {
            break;
        }
        let menus = leftmenuConfig[i].menu;
        for (let j = 0; j < menus.length; j++)
        {
              let menuitem = menus[j];
              if (menuitem['path'] === path)
              {
                result = menus;
                break;
              }
              else if(menuitem.root)
              {
                  if( content && content.hierarchy && content.hierarchy.split( '/' ).includes( menuitem.root.toString() ) )
                  {
                    result =menus;
                    break;
                  }
              }
        }
    }
    return result;
}
