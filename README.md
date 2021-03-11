

***(Note. This demo project is still ongoing so documentation/code might not work.)***

A demo project of digimaker CMF. which has minimal setup and works straight forward.

You can just clone this project and do some configuration and it can be your initialized project.

Run the demo
-------
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

### Website Templating

#### Override rule

First you need to define a template override rule under [configs/template_override.yaml](https://github.com/digimakergo/dmdemo/blob/master/configs/template_override.yaml) (and template_override-dmdemo.yaml), then you can do the templating in that template file.  

Example:
- [Display a folder](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/full.html)
- [Display frontpage](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/frontpage.html)
- [Layout](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/base.html)


#### Template functions/filters/macro
Built in template functions, filters can be found here: https://github.com/digimakergo/digimaker/tree/master/sitekit


### Rest api
See [web/app](blob/master/web/app) for examples.

[digimaker-ui](https://www.npmjs.com/package/digimaker-ui): To help developing apps, we have created a react library digimaker-ui, which includes some content related components like View, List, Edit, Browse, also some utility components like FileUpload, TreeNode, Fetch etc.

Rest api includes query, manipulating of content, and is extendable.

Get content by id:
Request: `/content/get/3`
Response:
```json
{
  "cid": 3,
  "version": 0,
  "published": 1560534450,
  "modified": 1615464230,
  "cuid": "bk1trcli6ekibbmo2cj0",
  "status": 1,
  "author": 1,
  "author_name": "Administrator Admin",
  "relations": {},
  "folder_type": "site",
  "summary": "<p>This is a demo site.</p>",
  "title": "Demo",
  "id": 3,
  ...
}
```
Get content list:
Request: `/content/list/folder?parent=3&level=1&sortby=priority%20desc%3Bmodified%20desc&limit=20&offset=0`
Response:
```json
{
  "list": [
    {
      "cid": 28,
      "version": 0,
      "published": 1614682043,
      "modified": 1614682043,
      "cuid": "c0v1feuvvhfup2usch5g",
      "status": 0,
      "author": 1,
      "author_name": "Administrator Admin",
      ...
    },
    {
      "cid": 27,
      "version": 0,
      "published": 1614682022,
      "modified": 1614682022,
      "cuid": "c0v1f9mvvhfup2usch4g",
      "status": 0,
      "author": 1,
      "author_name": "Administrator Admin",
      ...
    }
  ],
  "count": 2
}
```

### Go api
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
//20 top articles where author is 5
list, count, err := query.SubList(ctx, rootContent, "article", 10,  1, db.Cond("author", 5), []int{0, 20}, []string{"modified desc"}, true)
```

#### Manipulate content
Publish an article by user 1:

```go
data := map[string]interface{}{"title": "title only"}
// parent is 3, author is 1
handler := ContentHandler{}
content, validation, err := handler.Create("article", data, 1, 3)
```

#### Callbacks

#### Manipulate non-content entities(tables)

### Permissions

### Content model
Digimaker defines content model in file and generates entities based on the definition. Developers use those entities to manipulate content similar to ORM.

[contenttype.json](blob/master/configs/contenttype.json) defines content model. If there is changes on contenttype.json, run below so it can generate entities under entity folder

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
