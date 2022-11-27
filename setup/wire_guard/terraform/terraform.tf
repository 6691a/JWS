###################################################
# Variables
###################################################
locals {
  hw =  yamldecode(file(var.config_file)).hw
  disk = yamldecode(file(var.config_file)).disk
  network =  yamldecode(file(var.config_file)).network
  system = yamldecode(file(var.config_file)).system
  template = yamldecode(file(var.config_file)).template
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
# module "proxmox_setting" {
#   source = "$TF_VAR_FILE"
#   version = "1.0.0"
# }

provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
}

