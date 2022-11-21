###################################################
# Variables
###################################################
locals {
  public =  yamldecode(file(var.config_file)).hw.public
  private = yamldecode(file(var.config_file)).hw.private
  template = yamldecode(file(var.config_file)).template
  config = yamldecode(file(var.config_file)).config
  ssh = yamldecode(file(var.config_file)).ssh
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type = string
  sensitive = true
}
###################################################
# Terrafrom
###################################################

terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

###################################################
# Providers
###################################################
provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
}

