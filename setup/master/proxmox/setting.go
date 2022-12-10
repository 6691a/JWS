package proxmox

import "os"

func NewConfig() *Config {
	return &Config{
		apiUrl:          os.Getenv("PROXMOX_API_URL"),
		apiTokenId:      os.Getenv("PROXMOX_API_TOKEN_ID"),
		apiTokenSecret:  os.Getenv("PROXMOX_API_TOKEN_SECRET"),
		defaultPassword: os.Getenv("default_password"),
	}
}

type Config struct {
	apiUrl          string
	apiTokenId      string
	apiTokenSecret  string
	defaultPassword string
}

func (c *Config) MakeCredentials() {

}
