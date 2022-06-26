package server

import (
	"github.com/Francis-Gurr/go-api/controllers"

	"github.com/gin-gonic/gin"
)

func NewRouter() *gin.Engine {
	router := gin.Default()
	router.GET("/albums", controllers.GetAlbums)
	router.GET("/albums/:id", controllers.GetAlbumByID)
	router.POST("/albums", controllers.PostAlbums)

	return router
}
