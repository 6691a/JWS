package main

import (
	"fmt"
	"net/http"
)

type testHandler struct{}

func (h *testHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world!")
}

func main() {
	setUp(proxmox)
	//mux := http.NewServeMux()
	//
	//mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
	//	fmt.Fprintf(w, "<h1>Hello World</h1>")
	//})
	//
	//mux.Handle("/test", &testHandler{})

	//http.Handle("/", http.FileServer(http.Dir("static")))
	http.ListenAndServe(":8080", nil)
}
