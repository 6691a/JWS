resource "proxmox_lxc" "lxcs" {
  count = local.hw.count

  hostname = local.hw.name[count.index]
  cores = local.hw.cpu[count.index]
  memory = local.hw.memory[count.index]
  swap = local.hw.swap[count.index] ? local.hw.swap[count.index] : 512

  target_node = "proxmox"
  ostemplate = "local:vztmpl/${local.template.name}-${local.template.version}-standard_${local.template.version}-1_amd64.tar.gz"
  ssh_public_keys = <<EOF
    %{ for s in local.ssh}
      ${ s }
    %{ endfor }
  EOF

  unprivileged = local.hw.unprivileged[count.index] ? true : false

  onboot = local.config.onboot[count.index] ? true : false
  start = local.config.start[count.index] ? true : false

  rootfs {
    storage = local.hw.disk[count.index].storage
    size    = local.hw.disk[count.index].size
  }

  network {
    name   = local.hw.network.name[count.index]
    bridge = local.hw.network.bridge[count.index]
    ip     = local.hw.network.ip[count.index]
  }
}