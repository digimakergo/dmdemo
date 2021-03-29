
***(Note. This demo project is still ongoing so documentation/code might not work.)***

A demo project of digimaker CMF, including a minimal website, web app and editorial backend setup.

You can just clone this project and do some configuration and it can be your initialized project.

For full documentation and references, please visit [https://digimaker.org/doc](https://digimaker.org/doc)

Run the demo
-------

#### Requirements:
- Go version >= 1.2(recommand >= 1.3)
- Mysql database(only support mysql for now)
- npm(dev only)

#### Frontend
```sh
 //clone it.
 git clone https://github.com/digimakergo/dmdemo.git

 //import database
 //remember to change configs/dm.yaml's database connection.
 mysql -u {username} -p {database} < data/dmdemo.sql

 //start server
 dmapp=. go run cmd/main.go
```
  View frontend: http://localhost:9200

Build frontend webapp

```sh
   cd web/app
   npm install
   npm run build
   (or just "npm start" and visit http://localhost:3000)
```
  View frontend webapp: http://localhost:9200/mypage

  (login with member/digimaker)


 #### Backend
  Suggest to clone eui into web/eui, see project structure in the bottom
  ```sh
   git clone https://github.com/digimakergo/eui.git
   cd eui
   npm install
   npm start
   ```
View backend: http://localhost:3000 and Login with `admin/Digimaker`


Development
-------

### Website, Templating

#### Override rule

First you need to define a template override rule under [configs/template_override.yaml](https://github.com/digimakergo/dmdemo/blob/master/configs/template_override.yaml) (and template_override-dmdemo.yaml), then you can do the templating in that template file.  

Example:
- [Display a folder](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/full.html)
- [Display frontpage](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/frontpage.html)
- [Layout](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/base.html)


#### Template functions/filters/macro
Built in template functions, filters can be found here: https://github.com/digimakergo/digimaker/tree/master/sitekit


### Web App
See [web/app](web/app) for examples.

- [Photos.tsx](web/app/src/Photos.tsx) Shows how to query images, add content(image) using rest api
- [Profile.tsx](web/app/src/Profile.tsx) Shows how to show/edit content(user) using components in digimaker-ui
- [Login.tsx](web/app/src/Login.tsx) Shows how to get authorization token using rest api

[digimaker-ui](https://www.npmjs.com/package/digimaker-ui): To help developing apps, we have created a react library digimaker-ui, which includes some content related components like View, List, Edit, Browse, also some utility components like FileUpload, TreeNode, Fetch etc.

Rest api includes query, manipulating of content, and is extendable.

### Server side Go api
Go apis include
- Query content
- Manipulate content(eg. create, update, delete), version
- Query/manipulate non-content entities(mapping to table)
- Permission
- Log

#### Query content

Query by id:
```go
content, err := query.FetchByID(context, id)
```

List:
```go
//20 top articles where author is 5 under rootContent
list, count, err := query.SubList(ctx, 1, rootContent, "article", 10, db.Cond("author", 5).Sortby("modified desc").Limit(0, 20) )
```

#### Manipulate content
Publish an article by user 1:

```go
data := map[string]interface{}{"title": "title only"}
// parent is 3, author is 1
content, validation, err := handler.Create(ctx, "article", data, 1, 3)
```

#### Callbacks(Events)

#### Manipulate non-content entities(tables)

### Permissions
The permission policies is defined under [policies.json](configs/policies.json), and then connect to role and user in the content. policies.json defines permission like
 - fetching  based on content type, parent,etc
 - operations(eg. create content, update, delete) based on content type, parent, author(self)
 - updated fields when updating - attribute level permission
 - non-content operation like login, left menu of eui, etc

Example on policies.json:
```json
  {
    "operation": ["content/update", "content/read"],
    "limited_to": {
      "contenttype": ["article"],
      "author": "self"
    }
  },
  {
      "operation": ["content/create"],
      "limited_to": {
      "contenttype": ["image"],
      "under": [461]
   }
  }
```

### Content model
Digimaker defines content model in file and generates entities based on the definition. Developers use those entities to manipulate content similar to ORM.

[contenttype.json](configs/contenttype.json) defines content model. If there is changes on contenttype.json, run below so it can generate entities under entity folder

```
cd dmdemo
dmapp=. go run /Users/xc/go/src/github.com/digimakergo/digimaker/codegen/contenttypes/gen.go
```

Default output example after run

```
Generating content entities for /Users/xc/go/src/github.com/digimakergo/dmdemo
Generating article
Generating usergroup
Generating role
Generating user
Generating image
Generating file
Generating folder
Generating frontpage
```


### Extend EUI

### Log & Debug


Build & Deploy
----------

Additional - Project structure
-------

A project structure example which follows some recommendation from Go standard project layout: https://github.com/golang-standards/project-layout

```
Project A
│───cmd
│     └─main.go
│──configs    
│     │─dm.yaml
│     │─contenttype.yaml
│     │-policies.yaml
│     └ template_override.yaml
│──entity
│──handlers
│──api
│──web
│  └templates
│
└───var
```

- cmd/main.go which is the starting point. It can be any nam&any structure as long as it can run as entry point.
- configs
   - dm.yaml: main configuration
   - contenttype.yaml: content model configuration
   - policies.yaml: policies configuration for permission related
   - [optional]temlate_override.yaml (only needed if you use templating)
- entity: generated ORM-like entities
- [optional]handlers: callback for events
- [optional]fieldtype: if you have custom fieldtype
- [optional]web/templates: only needed if you need templating for website
- [optional]rest/api: can be use for rest api
- [optional]var for generated web resources(eg. uploaded images): It doesn't need to be under this directory(configurable in dm.yaml) as long as it's visitable from web(for instance via nginx).

Note: all the .go related folders can be in any structure as long as they can be imported. The only required structure for Digimaker is the config files structure.
