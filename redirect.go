package main // import "redirector"

import (
	"log"
	"net/http"
	"os"
)

func redirect(w http.ResponseWriter, r *http.Request) {
	log.Printf("Redirecting to %s: %s %s %s", os.Getenv("REDIRECT"), r.RemoteAddr, r.Method, r.URL)
	http.Redirect(w, r, os.Getenv("REDIRECT"), 301)
}

func main() {
	http.HandleFunc("/", redirect)

	log.Printf("Bringing up redirector service on PORT: %s", os.Getenv("PORT"))

	err := http.ListenAndServe(":"+os.Getenv("PORT"), nil)
	if err != nil {
		log.Fatal("Exception on ListenAndServe: ", err)
	}
}
