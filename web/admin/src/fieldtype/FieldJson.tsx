import React from 'react';
import {FieldtypeProps} from 'digimaker-ui';
import {DMEditorView} from 'dmeditor';
import { Link } from 'react-router-dom';

export const FieldJson = (props:FieldtypeProps)=>{

    const def = props.definition;
    const format =def.parameters?.format;

    return <div>        
        {format==='dmeditor'&&<div>
        {props.mode&&props.mode==='view'&&<div>
            <label>{def.name}:</label> 
            {props.data&&<DMEditorView data={props.data} />}
        </div>}
        {props.mode&&props.mode==='edit'&&<div>
         </div>}
        </div>}</div>;

}