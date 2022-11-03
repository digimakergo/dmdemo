
/*
* This is to initialize all.
* This includes:
* - field types.
*
*/

// @ts-ignore
import Registry from 'digimaker-ui/Registry'

import Treemenu from './leftmenu/Treemenu'

import UserRoles from 'digimaker-ui/view/UserRoles.js';


Registry.register( 'view', 'user_roles', UserRoles );

Registry.register( 'leftmenu', 'treemenu', Treemenu );
