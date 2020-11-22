# DM Demo
A demo project of digimaker CMF. which has minimal setup and works straight forward.

You can just clone this project and do some configuration and it can be your initialized project.

How to run it?
-------
- Clone it: `git clone https://github.com/digimakergo/dmdemo.git`
- Import database: import datbase from `data/dmdemo.sql`, then change `configs/dm.yaml`'s database connection
- Run: `cd cmd` and run `go run main.go`
- View frontend: visit http://localhost:9200 (the default port)
- View backend:
  ```
   git clone https://github.com/digimakergo/eui.git
   cd eui
   npm install
   npm start
   ```

Default admin login info: `admin/Digimaker`


Project structure
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
