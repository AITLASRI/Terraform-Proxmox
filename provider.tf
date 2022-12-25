

terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}


# Variables

variable "pve_api_url" {
  type = string
}

variable "pve_tf_user" {
  type = string
  sensitive = true
}

variable "pve_tf_passwd" {
  type = string
  sensitive = true
}

provider "proxmox" {
  pm_api_url          = var.pve_api_url
  pm_tls_insecure     = true
  pm_user             = var.pve_tf_user
  pm_password         = var.pve_tf_passwd
}


