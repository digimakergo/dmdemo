
***(Note. This demo project is still ongoing so documentation/code might not work.)***

A demo project of digimaker CMF. which has minimal setup and works straight forward.

You can just clone this project and do some configuration and it can be your initialized project.

Run the demo
-------
- Clone it: `git clone https://github.com/digimakergo/dmdemo.git`
- Import database: import datbase from `data/dmdemo.sql`, then change `configs/dm.yaml`'s database connection
- Run: `cd cmd` and run `dmapp=.. go run main.go`
- View frontend: visit http://localhost:9200 (the default port)
- Backend: (Suggest to clone into web/eui, see project structure in the bottom)
  ```
   git clone https://github.com/digimakergo/eui.git
   cd eui
   npm install
   npm start
   ```
Visit backend: http://localhost:3000 and Login with `admin/Digimaker`


Website Templating
-------

#### Override rule

First you need to define a template override rule under [configs/template_override.yaml](https://github.com/digimakergo/dmdemo/blob/master/configs/template_override.yaml) (and template_override-dmdemo.yaml), then you can do the templating in that template file.  

Example:
- [Display a folder](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/full.html)
- [Display frontpage](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/frontpage.html)
- [Layout](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/base.html)


#### Template functions/filters/macro
Built in template functions, filters can be found here: https://github.com/digimakergo/digimaker/tree/master/sitekit

EUI
--------

Rest api
-------

Go api
--------
#### Query content

#### Operate content

#### Callbacks

#### Manipulate non-content entities(tables)

Permissions
---------

Log & Debug
---------

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
