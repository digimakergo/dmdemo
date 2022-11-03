import { ActionProps } from "digimaker-ui/Actions";
import Delete from "digimaker-ui/actions/Delete";
import Move from "digimaker-ui/actions/Move";
import SetPriority from "digimaker-ui/actions/SetPriority";
import SetToTop from "digimaker-ui/actions/SetToTop";
import { ViewSettingsType } from "digimaker-ui/DMInit";
import React from "react";

export const leftConfig = [
  {
    name: 'Sites',
    icon: 'fa-desktop',
    path: '/main/3',
    menu: [
      {
        name: 'Sites',
        type: 'leftmenu:treemenu',
        contenttype: ['folder'],
        icon: 'fas fa-home',
        is_site: true,
        open: true,
        root: 3,
      },
      {
        name: 'Shared',
        type: 'leftmenu:treemenu',
        contenttype: ['folder'],
        icon: 'fas fa-share-alt',
        open: true,
        root: 460,
      },
      {
        name: 'Resources',
        type: 'leftmenu:treemenu',
        contenttype: ['folder'],
        icon: 'far fa-images',
        root: 9,
      },
    ],
  },
  {
    name: 'Users',
    icon: 'fa-users',
    path: '/main/4',
    menu: [
      {
        name: 'Organizations',
        type: 'leftmenu:treemenu',
        contenttype: ['usergroup'],
        icon: 'fas fa-sitemap',
        root: 4,
      },
      {
        name: 'Roles',
        icon: 'fas fa-user-tag',
        path: '/main/7',
      },
    ],
  },
];


/* get list config based on parent and content type */
export const getListConfig = (_parent: any, contenttype: string)=>{
  const commonSettings = {
    show_header: true,
    show_table_header: true,
    pagination: 10,
    sort:[],
    row_actions: [
      {
        link: '/edit/{_contenttype_id}?from=/main/{_from_id}',
        name: 'Edit',
        icon: 'icon-edit',
      },
      (actionProps:ActionProps)=><Delete {...actionProps} />
    ]
  }

  const listConfg = {     
      folder: {
        ...commonSettings,
        sort_default: [['published', 'desc']],
        columns: ['name', 'author', 'published', 'modified'],        
      },
      article: {
        ...commonSettings,
        sort_default: [
          ['priority', 'desc'],
          ['modified', 'desc'],
        ],
        sort: {
          name: 'asc',
          modified: 'desc',
          priority: 'desc',
          author_name: 'asc',
        },
        row_actions:[
          ...commonSettings.row_actions,
          (actionProps:ActionProps)=><SetToTop {...actionProps} />
        ],
        columns: ['name', 'coverimage', 'author_name', 'modified', 'priority'],
        pagination: 20,
      },     
      image: {
        sort_default: [['published', 'desc']],
        sort: [],
        columns: ['name', 'image', 'author', 'published', 'modified'],
        block_fields: ['image', 'name', 'modified'],
        show_header: true,
        show_table_header: true,
        actions: [],
        viewmode: 'block',
        row_actions: [
          {
            link: '/edit/{_contenttype_id}?from=/main/{_from_id}',
            name: 'Edit',
            icon: 'icon-edit',
          },
          (actionProps:ActionProps)=><Delete {...actionProps} />
        ],
        pagination: 10,
        row_more: ['export'],
        blockview_columns: ['image', 'name', 'modified'],
      },
      usergroup: {
        ...commonSettings,
        sort_default: [['published', 'desc']],
        sort: [],
        columns: ['name', 'author', 'published', 'modified', 'priority'],
      },
      user: {
        ...commonSettings,
        sort_default: [['name', 'asc']],
        sort: { name: 'asc', modified: 'desc' },
        columns: ['name', 'published', 'modified'],
        pagination: 25,
      },
      role: {
        ...commonSettings,
        sort_default: [['cid', 'asc']],
        columns: ['cid', 'name', 'identifier', 'published', 'modified'],
        row_actions: [
          { link: '/main/role/{cid}', name: 'Detail', icon: 'fa-arrow-right' },
          {
            link: '/edit/role/{cid}?from=/main/7',
            icon: 'fas fa-edit',
            name: 'Edit',
          }          
        ],
        pagination: 10,
      }
    };

    return listConfg[contenttype]?listConfg[contenttype]:commonSettings;
}

/** get main config based on content */
export const getMainConfig = (content: any) => {
  const mainConfig = {
    folder: {
      actions: [
        (actionProps:ActionProps)=><SetPriority {...actionProps} />
      ]
    },
    frontpage: {
      list: ['frontpage_block'],
    },  
    role: {
      view: true,
    },
    article: {
      view: true,
      metainfo:true,
      actions: [      
        (actionProps:ActionProps)=><Move {...actionProps} />
      ],
    },
    user: {
      view: true,
      view_com: 'view:user_roles',    
    },
  };

	let commonActions = [
		{
			link: "/edit/{id}",
			name: "Edit",
			icon: "icon-edit",
			title: "Edit the content",
		},
    (actionProps:ActionProps)=><Delete {...actionProps} />
	];

  const commonMain = {list:[], new:[]};
	let result = { ...commonMain, ...mainConfig[content.content_type] };
  if( result["actions"] ){
    result["actions"] = [...commonActions, ...result['actions']];
  }

	let list = [] as string[];
	if (content.content_type === "folder") {
		let ids = content.hierarchy.split("/");
		if (ids.includes("3")) {
			list = [...list, "article"];
		}
		if (ids.includes("10") || ids.includes("461")) {
			list = [...list, "image"];
		}

		if (ids.includes("4")) {
			list = [...list, "user"];
		}

		if (ids.includes("7")) {
			list = [...list, "role"];
		}

		result["list"] = list;
		result["new"] = ["folder", ...list];
	}
	return result;
};

export const getBrowseConfig = ()=>{
  return  { filter: {
      '*': { contenttype: ['folder'] },
      usergroup: { contenttype: ['usergroup'] },
      user: { contenttype: ['folder'] },
      sv_product: { contenttype: ['sv_product_package'] },
    },
    list: {
      '*': {
        level: 1,
        can_select: false,
        pagination: 10,
        sort_default: [
          ['priority', 'desc'],
          ['name', 'asc'],
        ],
        sort: { priority: 'desc', name: 'asc', modified: 'desc', id: 'desc' },
        actions: [],
        columns: ['id', 'title', 'modified', 'priority'],
      },
      image: {
        viewmode: 'block',
        parent: 461,
        sort_default: [['modified', 'desc'], '-'],
        block_fields: ['image', 'name'],
      },
      user: {
        sort_default: [['modified', 'desc'], '-'],
        parent: 4,
      }
    }
  };  
}


export const getViewSettings = ( contenttype: string )=>{
  if (contenttype === "image") {
    return {
      inline_fields: ["image"],
      block_fields: ["name", "image"],
      browselist: {
        viewmode: "block",
        columns: ["name"],
        sort_default: [["priority", "desc"]],
      },
    } as ViewSettingsType;
  } else {
    return {
      inline_fields: ["title"],
      browselist: {
        viewmode: "list",
        columns: ["name", "published"],
        sort_default: [["priority", "desc"]],
      },
    } as ViewSettingsType;
  } 
}