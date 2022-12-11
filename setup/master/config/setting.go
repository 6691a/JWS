package config

import (
	"flag"
	"os"
	"path/filepath"
	"strconv"
)

var SETTINGS = map[string]string{}

func getRootDir() string {
	wd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	dir := filepath.Dir(wd)
	return filepath.Dir(dir)
}

func Setting() {
	isDebug := flag.Bool("d", false, "debug mode")

	flag.Parse()

	SETTINGS = map[string]string{
		"ROOT_DIR": getRootDir(),
		"DEBUG":    strconv.FormatBool(*isDebug),
	}
}
