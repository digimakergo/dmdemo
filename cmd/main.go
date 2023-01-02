package main

import (
	"net/http"
	"os"

	_ "dmdemo/entity"

	"github.com/digimakergo/digimaker/core/definition"

	_ "dmdemo/pkg/controller"

	_ "github.com/digimakergo/digimaker/core/auth/tokenmanager"
	"github.com/digimakergo/digimaker/core/config"
	_ "github.com/digimakergo/digimaker/core/fieldtype/fieldtypes"
	_ "github.com/digimakergo/digimaker/core/handler/handlers"

	"github.com/digimakergo/digimaker/core/log"
	"github.com/spf13/viper"

	_ "github.com/digimakergo/digimaker/core/util/localmail"

	"github.com/digimakergo/digimaker/rest"
	"github.com/digimakergo/digimaker/sitekit"

	//_ "github.com/digimakergo/digimaker/sitekit/rest"
	"github.com/gorilla/mux"

	_ "github.com/digimakergo/dmext/dmeditor"
	_ "github.com/go-sql-driver/mysql"

	_ "github.com/digimakergo/digimaker/graphql"
	_ "github.com/digimakergo/digimaker/sitekit/filters"
	_ "github.com/digimakergo/digimaker/sitekit/functions"
)

func main() {
	definition.Load()

	sitekit.Load()

	//host var - remember to override in proxy server
	http.Handle("/var/", http.StripPrefix("/var/", http.FileServer(http.Dir(config.HomePath()+"/var"))))

	//remember: remove this in real project
	if envValue := os.Getenv("env"); envValue == "dev" {
		http.Handle("/debug/", http.StripPrefix("/debug/", http.FileServer(http.Dir(config.HomePath()+"/debug"))))
	}

	http.Handle("/mypage/", http.StripPrefix("/mypage/", http.FileServer(http.Dir(config.HomePath()+"/web/app/build"))))

	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir(config.HomePath()+"/web/assets"))))

	//Rest api
	router := mux.NewRouter()
	router.Use(rest.InitRequest)
	apiPrefix := "/api/"
	restRouter := router.PathPrefix(apiPrefix).Subrouter() //todo: make /api configuable
	rest.HandleRoute(restRouter)
	http.Handle(apiPrefix, router)

	//Website
	siteRouter := mux.NewRouter()
	siteRouter.Use(sitekit.InitRequest)
	siteRouters, defaultRouters := sitekit.GetSiteRouters(siteRouter)

	sitekit.RouteContent(siteRouters, defaultRouters)
	log.Info("Sites content routered")

	http.Handle("/", siteRouter)

	// go http.ListenAndServe(":9200", router)
	go http.ListenAndServe(":9201", router)

	host := viper.GetString("general.host")
	log.Info("Listen on " + host)

	// select {}

	err := http.ListenAndServe(host, nil)
	if err != nil {
		log.Fatal(err.Error())
	}
}
