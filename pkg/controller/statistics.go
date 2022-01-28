package controller

import (
	"errors"
	"net/http"

	"github.com/digimakergo/digimaker/core/db"
	"github.com/digimakergo/digimaker/rest"
)

//Count articles
func CountArticle(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	userID := rest.CheckUserID(ctx, w)
	if userID == 0 {
		return
	}

	count, err := db.CountContent(ctx, "article", db.TrueCond())
	if err != nil {
		rest.HandleError(errors.New("Internal error"), w)
		return
	}

	rest.WriteResponse(count, w)
}

func init() {
	rest.RegisterRoute("/dmdemo/article/count", CountArticle, "GET")
}
