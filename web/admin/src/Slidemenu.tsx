import * as React from 'react';
import { Link, NavLink,Route} from "react-router-dom";
import { useLocation} from "react-router";
import Treemenu from './leftmenu/Treemenu';

export const Slidemenu = (props:{config:any, onSelect?:any, current?:any}) => {
  const [sidemenus,setSidemenus] = React.useState(props.config);
  const [index,setIndex] = React.useState(0 as any);
  let location = useLocation();
  let path = location.pathname;

  React.useEffect(()=>{
    console.log(props.current)
    console.log("234",path)
    props.onSelect(index);
    if(props.current){
      let index:any=0;
      index = getCurrentMenuIndex(path, props.current, props.config);
      setIndex(index)
    }
  })
  return ( <>
    <div className={`slidemenu`}>
        <ul>
            <li>
                <a className="logo" href="/" onClick={(e) => { e.preventDefault(); setIndex(-1) }}>
                    <img alt='Logo' src={`${process.env.PUBLIC_URL}/images/logo.png`} />
                </a>
            </li>
            {sidemenus.map((menu:any, i:number) => {
                return (<li key={menu.path} onClick={()=>{setIndex(i)}}>
                      <NavLink to={menu.path} onClick={()=>{setIndex(i)}} className={i===index?menu.identifier+' selected':menu.identifier} >
                        <i className={`${menu.icon}`} />
                      </NavLink>
                    </li>)
            })}
        </ul>
        <div className="logout">
          <Link title="Logout" to="/logout"><i className="fas fa-sign-out-alt"></i></Link>
        </div>
    </div>
    </>)
}


function getCurrentMenuIndex(path: string, content:any, leftmenuConfig: any) {
    let Index:any = 0;

    for (let i = 0; i < leftmenuConfig.length; i++) {
        let menus = leftmenuConfig[i];
        if(menus.path===path){
          Index=i;
        }
        if(menus.root){
          if( content && content.hierarchy && content.hierarchy.split( '/' ).includes( menus.root.toString() ) )
          {
            Index=i;
            break;
          }
        }
    }
    return Index;
}