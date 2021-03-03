package main

import (
	"net/http"

	_ "github.com/digimakergo/dmdemo/entity"

	_ "github.com/digimakergo/digimaker/core/handler/handlers"
	"github.com/digimakergo/digimaker/core/log"
	"github.com/digimakergo/digimaker/core/util"
	"github.com/digimakergo/digimaker/rest"
	_ "github.com/digimakergo/digimaker/rest/tokenmanager"
	"github.com/digimakergo/digimaker/sitekit"
	"github.com/gorilla/mux"

	_ "github.com/go-sql-driver/mysql"

	_ "github.com/digimakergo/digimaker/sitekit/filters"
	_ "github.com/digimakergo/digimaker/sitekit/functions"
)

func main() {

	//host var - can be in another server
	http.Handle("/var/", http.StripPrefix("/var/", http.FileServer(http.Dir(util.HomePath()+"/var"))))
	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir(util.HomePath()+"/web/assets"))))

	router := mux.NewRouter()

	router.Use(rest.InitRequest)

	//Route rest api
	restRouter := router.PathPrefix("/api").Subrouter() //todo: make /api configuable
	rest.HandleRoute(restRouter)

	//Handle content
	siteRouters, defaultRouters := sitekit.GetSiteRouters(router)

	sitekit.RouteContent(siteRouters, defaultRouters)
	log.Info("Sites content routered")

	http.Handle("/", router)

	// go http.ListenAndServe(":9200", router)
	go http.ListenAndServe(":9201", router)

	host := util.GetConfig("general", "host", "dm")
	log.Info("Listen on " + host)

	// select {}

	err := http.ListenAndServe(host, nil)
	if err != nil {
		log.Fatal(err.Error())
	}
}
