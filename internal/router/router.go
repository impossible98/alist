package router

import (
	"strconv"

	"github.com/gin-gonic/gin"

	"github.com/impossible98/alist/global"
	"github.com/impossible98/alist/internal/api"
)

func Router() {
	router := gin.Default()

	router.GET("/ping", api.Ping)

	port := ":" + strconv.Itoa(global.PORT)

	router.Run(port)
}
