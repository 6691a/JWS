package main

import (
	"github.com/joho/godotenv"
	"log"
	pm "master/proxmox"
)

type OS uint8

const (
	proxmox OS = iota
)

func setUp(os OS) {
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	switch os {
	case proxmox:
		pm.NewConfig()

		//proxmoxSetUp()
	}
}
