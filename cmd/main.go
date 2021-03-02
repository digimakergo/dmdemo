package main

import (
	"net/http"

	_ "github.com/digimakergo/dmdemo/entity"

	"github.com/digimakergo/digimaker"
	_ "github.com/digimakergo/digimaker/core/handler/handlers"
	"github.com/digimakergo/digimaker/core/log"
	"github.com/digimakergo/digimaker/core/util"
	_ "github.com/digimakergo/digimaker/rest/tokenmanager"
	"github.com/gorilla/mux"

	_ "github.com/go-sql-driver/mysql"

	_ "github.com/digimakergo/digimaker/core/handler/handlers"
	_ "github.com/digimakergo/digimaker/sitekit/filters"
	_ "github.com/digimakergo/digimaker/sitekit/functions"
)

func main() {

	//host var - can be in another server
	http.Handle("/var/", http.StripPrefix("/var/", http.FileServer(http.Dir(util.HomePath()+"/var"))))
	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir(util.HomePath()+"/web/assets"))))

	r := mux.NewRouter()
	digimaker.Bootstrap(r)

	http.Handle("/", r)

	host := util.GetConfig("general", "host", "dm")
	log.Info("Listen on " + host)
	err := http.ListenAndServe(host, nil)
	if err != nil {
		log.Fatal(err.Error())
	}
}
