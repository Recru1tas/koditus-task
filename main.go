package main

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func main() {

	router := gin.Default()
	router.GET("/:index", getNumberByIndex)
	router.GET("/alive", isAlive)
	router.Run(":8080")

}

func fibonacciDP(n int) int {
	f := make([]int, n+2)
	f[0], f[1] = 0, 1
	for i := 2; i <= n; i++ {
		f[i] = f[i-1] + f[i-2]
	}
	return f[n]
}

func getNumberByIndex(c *gin.Context) {
	index := c.Param("index")
	indexInt, err := strconv.Atoi(index)
	if err != nil {
		c.IndentedJSON(http.StatusOK, "Invalid index provided, try again")
		panic(err)
	}
	var valueByIndex = fibonacciDP(indexInt)
	c.IndentedJSON(http.StatusOK, valueByIndex)
}

func isAlive(c *gin.Context) {
	aliveCheck := "I'm alive"
	c.IndentedJSON(http.StatusOK, aliveCheck)
}
