export default {
    leftmenu: [
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
            name: 'Sites',
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
    ],
    list: {
      _browse: {
        article: {
          sort: { name: 'desc' },
          columns: ['name'],
          pagination: 20,
          can_select: false,
        },
      },
      folder: {
        sort_default: [['published', 'desc']],
        sort: [],
        columns: ['name', 'author', 'published', 'modified'],
        show_header: true,
        show_table_header: false,
        actions: [],
        row_actions: [],
        pagination: 10,
        row_more: ['export'],
      },
      article: {
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
        columns: ['name', 'coverimage', 'author_name', 'modified', 'priority'],
        show_header: true,
        show_table_header: true,
        actions: [],
        row_actions: [],
        pagination: 20,
        row_more: ['export'],
      },
      frontpage: {
        sort_default: [['published', 'desc']],
        sort: [],
        columns: ['name', 'author', 'published', 'modified'],
        show_header: true,
        show_table_header: false,
        actions: [],
        row_actions: [],
        pagination: 10,
        row_more: ['export'],
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
          {
            com: 'action:delete',
            icon: 'fas fa-trash',
            name: 'delete',
          },
        ],
        pagination: 10,
        row_more: ['export'],
        blockview_columns: ['image', 'name', 'modified'],
      },
      usergroup: {
        sort_default: [['published', 'desc']],
        sort: [],
        columns: ['name', 'author', 'published', 'modified', 'priority'],
        show_header: true,
        show_table_header: false,
        actions: [],
        row_actions: [],
        pagination: 10,
        row_more: [],
      },
      user: {
        sort_default: [['name', 'asc']],
        sort: { name: 'asc', modified: 'desc' },
        columns: ['name', 'published', 'modified'],
        show_header: true,
        show_table_header: true,
        actions: [],
        row_actions: [],
        pagination: 25,
        row_more: [],
      },
      role: {
        sort_default: [['cid', 'asc']],
        sort: [],
        columns: ['cid', 'name', 'identifier', 'published', 'modified'],
        show_header: true,
        show_table_header: true,
        actions: [],
        row_actions: [
          { link: '/main/role/{cid}', name: 'Detail', icon: 'fa-arrow-right' },
          {
            link: '/edit/role/{cid}?from=/main/7',
            icon: 'fas fa-edit',
            name: 'Edit',
          },
          {
            com: 'action:delete',
            icon: 'fas fa-trash',
            name: 'delete',
          },
        ],
        pagination: 10,
        row_more: [],
      },
    },
    browse: {
      filter: {
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
        },
      },
    },
    main: {
      '*': {
        sort_default: [
          ['priority', 'desc'],
          ['name', 'asc'],
        ],
        sort: { id: 'desc', priority: 'desc', name: 'asc' },
        columns: ['id', 'name', 'priority'],
        pagination: 25,
        show_header: true,
        show_table_header: true,
        pagination: 25,
        actions: [
          {
            link: '/edit/{id}',
            name: 'Edit',
            icon: 'icon-edit',
            title: 'Edit the content',
          },
          {
            com: 'action:move',
            icon: 'icon-move',
            name: 'Move',
          },
        ],
        row_actions: [
          { link: '/edit/{id}', name: 'Edit', icon: 'icon-edit' },
          { com: 'action:set_priority' },
        ],
      },
      folder: {
        list: ['3:article', '583:image', '461:image', '4:user', '7:role'],
        actions: [
          {
            com: 'action:delete',
            icon: 'fas fa-trash',
            name: 'delete',
          },
          {
            com: 'action:set_priority',
          },
        ],
        new: ['article', 'folder', 'frontpage', 'image', '4:user', 'role:7'],
      },
      frontpage: {
        list: ['frontpage_block'],
        actions: [],
        new: '',
      },
      usergroup: {
        list: ['user'],
        new: ['usergroup', 'user'],
        actions: [
          {
            link: '/edit/{id}',
            title: 'Edit this',
            name: 'Edit',
          },
        ],
      },
      role: {
        view: true,
        new: [],
        openSide: true,
        list: [],
      },
      article: {
        view: true,
        actions: [
          {
            link: '/edit/{id}',
            title: 'Edit this',
            name: 'Edit',
          },
          {
            com: 'action:move',
            icon: 'icon icon-move',
            name: 'move',
          },
          {
            com: 'action:delete',
            icon: 'fas fa-trash',
            name: 'delete',
          },
        ],
      },
      user: {
        view: true,
        view_com: 'view:user_roles',
        actions: [
          {
            link: '/edit/{id}',
            com: 'action:delete',
            title: 'Edit this',
            name: 'Edit',
          },
        ],
      },
    },
    inline: {
      article: ['name'],
      image: ['image'],
      user: ['name'],
    },
    block: {
      article: ['title'],
      image: ['image', 'name'],
    },
  };