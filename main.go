package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Println("request found")
		fmt.Fprintf(w, "Hello World")
	})
	fmt.Println("Starting server")
	if err := http.ListenAndServe(":9090", nil); err != nil {
		panic(err)
	}
}
