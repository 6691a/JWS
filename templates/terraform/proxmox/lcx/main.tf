resource "proxmox_lxc" "lxc" {
  hostname = "lxc"
  cores = 1
  memory = "1024"
  swap = "512"
  target_node = "proxmox"
  pool = "terraform_test"

  ostemplate = "local:vztmpl/${local.template.name}-${local.template.version}-standard_${local.template.version}-1_amd64.tar.gz"
  ssh_public_keys = <<EOF
    ${var.ssh_public_keys}
  EOF
  unprivileged = true

  onboot       = true
  start        = true

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}