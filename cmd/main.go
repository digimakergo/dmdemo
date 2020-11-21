package main

import (
	"fmt"
	"net/http"
	"os"

	_ "dmdemo/entity"

	"github.com/digimakergo/digimaker/core"
	_ "github.com/digimakergo/digimaker/core/handler/handlers"
	"github.com/digimakergo/digimaker/core/log"
	"github.com/digimakergo/digimaker/core/util"
	"github.com/digimakergo/digimaker/rest"
	_ "github.com/digimakergo/digimaker/rest/tokenmanager"
	"github.com/gorilla/mux"

	_ "github.com/go-sql-driver/mysql"
)

//go:generate go run gen_contenttypes/gen.go
func BootStrap() {
	if len(os.Args) >= 2 && os.Args[1] != "" {
		path := os.Args[1]
		success := core.Bootstrap(path)
		if !success {
			fmt.Println("Failed to start. Exiting.")
			os.Exit(1)
		}
	} else {
		fmt.Println("Need a path parameter. Exiting.")
		os.Exit(1)
	}
}

func main() {
	BootStrap()

	//host var - can be in another server
	http.Handle("/var/", http.StripPrefix("/var/", http.FileServer(http.Dir("../var"))))

	r := mux.NewRouter()

	//rest api
	r.Use(rest.InitRequest)
	restRouter := r.PathPrefix("/api").Subrouter()
	rest.HandleRoute(restRouter)

	http.Handle("/", r)

	host := util.GetConfig("general", "host", "dm")
	log.Info("Listen on " + host)
	err := http.ListenAndServe(host, nil)
	if err != nil {
		log.Fatal(err.Error())
	}
}
