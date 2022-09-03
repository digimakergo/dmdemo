
/*
* This is to initialize all.
* This includes:
* - field types.
*
*/

// @ts-ignore
import Registry from 'digimaker-ui/Registry'

import Treemenu from './leftmenu/menutype/Treemenu'
import Listmenu from './leftmenu/menutype/Listmenu'

import Copy from 'digimaker-ui/actions/Copy';
import Filter from 'digimaker-ui/actions/Filter';
import Delete from 'digimaker-ui/actions/Delete'
import Move from 'digimaker-ui/actions/Move'
import SetToTop from 'digimaker-ui/actions/SetToTop'
import AssignRole from 'digimaker-ui/actions/user/AssignRole'
import SetPriority from 'digimaker-ui/actions/SetPriority';
import UserRoles from 'digimaker-ui/view/UserRoles';


Registry.register( 'action', 'copy', Copy );
Registry.register( 'action', 'delete', Delete );
Registry.register( 'action', 'move', Move );
Registry.register( 'action', 'set_priority', SetPriority );
Registry.register( 'action', 'set_to_top', SetToTop );
Registry.register( 'action', 'assign_role', AssignRole );
Registry.register( 'action', 'filter', Filter );
Registry.register( 'view', 'user_roles', UserRoles );


Registry.register( 'leftmenu', 'treemenu', Treemenu );
Registry.register( 'leftmenu', 'listmenu', Listmenu );
