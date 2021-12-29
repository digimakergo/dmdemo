
***(Note. This demo project is still ongoing so documentation/code might not work.)***

A demo project of digimaker CMF, including a minimal website, web app and editorial backend setup.

You can just clone this project and do some configuration and it can be your initialized project.

For full documentation and references, please visit [https://digimaker.org/doc](https://digimaker.org/doc)

## Run the demo


#### Requirements:
- Go version >= 1.15(recommand >= 1.16 to use website templating)
- Mysql database(only support mysql for now)
- npm(dev only)

#### Run server
```sh
 //clone it.
 git clone https://github.com/digimakergo/dmdemo.git

 //import database
 //remember to change configs/dm.yaml's database connection.
 mysql -u {username} -p {database} < data/dmdemo.sql

 //run this under mysql root 
 SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

 //install dmcli, optional
 go install github.com/digimakergo/digimaker/dmcli@latest

 //change database connection information on config/dm.yaml/database 

 //start server
 cd dmdemo
 go run cmd/main.go
```
  View frontend: http://localhost:9200


 #### Admin webapp
  The admin client is under web/admin
  ```sh   
   cd web/admin
   npm install
   npm start
   ```
View admin: http://localhost:3000
Login as admin `admin/Digimaker`
Login as editor: `editor/Digimaker`

#### [optional]Run frontend webapp

```sh
   cd web/app
   npm install
   npm run build
   (or just "npm start" and visit http://localhost:3000)
```
  View frontend webapp: http://localhost:9200/mypage

  (login with member/digimaker)



## Create new project from dmdemo

create a new project folder eg. project-a
```sh   
cd ..
mkdir project-a
cp -a dmdemo/configs project-a/
cp -a dmdemo/cmd project-a
cp -a entity project-a  
```
#### Update entities
If you have changes on config/contenttype.json, you can run below to update entity
```sh   
cd project-a
dmcli entity
```

#### Run project-a
```sh
cd project-a
dmapp=. go run cmd/main.go
```



#### Build & Deploy

```
#build for linux
env GOOS=linux GOARCH=amd64 go build ./cmd/main.go

#run on production, see dmdemo.service to deploy as a linux service
#need to deploy all(except .go files) into production.
./main
```

## Code overview

#### Website, Templating

First you need to define a template override rule under [configs/template_override.yaml](https://github.com/digimakergo/dmdemo/blob/master/configs/template_override.yaml) (and template_override-dmdemo.yaml), then you can do the templating in that template file.  

Example:
- [Display a folder](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/full.html)
- [Display frontpage](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/folder/frontpage.html)
- [Layout](https://github.com/digimakergo/dmdemo/tree/master/web/templates/demo/base.html)


#### Web App
See [web/app](web/app) for examples.

- [Photos.tsx](web/app/src/Photos.tsx) Shows how to query images, add content(image) using rest api
- [Profile.tsx](web/app/src/Profile.tsx) Shows how to show/edit content(user) using components in digimaker-ui
- [Login.tsx](web/app/src/Login.tsx) Shows how to get authorization token using rest api


## Additional - Project structure


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
