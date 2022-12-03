package proxmox

func NewConfig(apiUrl string, apiTokenId string, apiTokenSecret string, defaultPassword string) *Config {
	return &Config{ApiUrl: apiUrl, ApiTokenId: apiTokenId, ApiTokenSecret: apiTokenSecret, DefaultPassword: defaultPassword}
}

type Config struct {
	ApiUrl          string
	ApiTokenId      string
	ApiTokenSecret  string
	DefaultPassword string
}
