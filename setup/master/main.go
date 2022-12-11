package main

import (
	"master/config"
	"master/proxmox"
)

func main() {

	config.Setting()
	pm := proxmox.NewConfig()
	pm.MakeCredentials()
}
