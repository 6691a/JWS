package proxmox

import (
	"fmt"
	"master/config"
	"os"
	"text/template"
)

func NewConfig() *Config {
	return &Config{
		ApiUrl:          "urls",
		ApiTokenId:      "token",
		ApiTokenSecret:  "secret",
		DefaultPassword: "password",
	}
	//return &Config{
	//	apiUrl:          os.Getenv("PROXMOX_API_URL"),
	//	apiTokenId:      os.Getenv("PROXMOX_API_TOKEN_ID"),
	//	apiTokenSecret:  os.Getenv("PROXMOX_API_TOKEN_SECRET"),
	//	defaultPassword: os.Getenv("default_password"),

	//}
}

type Config struct {
	ApiUrl          string
	ApiTokenId      string
	ApiTokenSecret  string
	DefaultPassword string
}

func (c *Config) MakeCredentials() {
	targetName := fmt.Sprintf("%s/%s/%s/credentials.tfvars", config.SETTINGS["ROOT_DIR"], "setup", "secret")
	_, err := os.Stat(targetName)

	if os.IsNotExist(err) {
		file, err := os.Create(targetName)
		if err != nil {
			panic(err)
		}
		tmp, _ := template.ParseFiles("proxmox/templates/credentials.temp")
		tmp.Execute(file, c)
	}

}
