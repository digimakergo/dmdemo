
/*
* This is to initialize all.
* This includes:
* - field types.
*
*/

// @ts-ignore
import Registry from 'digimaker-ui/Registry'

import Treemenu from './leftmenu/Treemenu'

import Copy from 'digimaker-ui/actions/Copy.js';
import Filter from 'digimaker-ui/actions/Filter.js';
import Delete from 'digimaker-ui/actions/Delete.js'
import Move from 'digimaker-ui/actions/Move.js'
import SetToTop from 'digimaker-ui/actions/SetToTop.js'
import AssignRole from 'digimaker-ui/actions/user/AssignRole.js'
import SetPriority from 'digimaker-ui/actions/SetPriority.js';
import UserRoles from 'digimaker-ui/view/UserRoles.js';


Registry.register( 'action', 'copy', Copy );
Registry.register( 'action', 'delete', Delete );
Registry.register( 'action', 'move', Move );
Registry.register( 'action', 'set_priority', SetPriority );
Registry.register( 'action', 'set_to_top', SetToTop );
Registry.register( 'action', 'assign_role', AssignRole );
Registry.register( 'action', 'filter', Filter );
Registry.register( 'view', 'user_roles', UserRoles );


Registry.register( 'leftmenu', 'treemenu', Treemenu );
