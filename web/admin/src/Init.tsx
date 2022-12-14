import React from 'react';
import {FieldRegister} from 'digimaker-ui';
import { FieldJson } from './fieldtype/FieldJson';


FieldRegister.registerComponent( 'article/summary', ()=><div></div> );
FieldRegister.registerComponent( 'article/body', ()=><div></div> );

FieldRegister.registerComponent( 'json', FieldJson );