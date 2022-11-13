resource "proxmox_lxc" "lxc" {
  hostname = local.hw.name
  cores = local.hw.cpu
  memory = local.hw.memory
  swap = local.hw.swap

  target_node = "proxmox"
  ostemplate = "local:vztmpl/${local.template.name}-${local.template.version}-standard_${local.template.version}-1_amd64.tar.gz"
  ssh_public_keys = <<EOF
    %{ for s in local.ssh}
      ${ s }
    %{ endfor }
  EOF

  unprivileged = local.hw.unprivileged ? true : false

  onboot = local.config.onboot
  start = local.config.start

  rootfs {
    storage = local.hw.disk.storage
    size    = local.hw.disk.size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}