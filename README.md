# dmdemo
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
   git clone https://github.com/digimakergo/eui.git`
   cd eui
   npm install
   npm start
   ```

Default admin login info: `admin/Digimaker`
