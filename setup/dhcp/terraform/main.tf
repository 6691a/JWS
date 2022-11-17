resource "proxmox_lxc" "lxcs" {
  count = local.hw.count

  hostname = local.hw.name[count.index]
  cores = local.hw.cpu[count.index]
  memory = local.hw.memory[count.index]
  swap = try(local.hw.swap[count.index], 512)

  target_node = "proxmox"
  ostemplate = "local:vztmpl/${local.template.name}-${local.template.version}-standard_${local.template.version}-1_amd64.tar.gz"
  ssh_public_keys = <<EOF
    %{ for s in local.ssh}
      ${ s }
    %{ endfor }
  EOF

  unprivileged = local.hw.unprivileged[count.index] ? true : false

  onboot = try(local.config.onboot[count.index], false)
  start = try(local.config.start[count.index], false)

  rootfs {
    storage = local.hw.disk[count.index].storage
    size    = local.hw.disk[count.index].size
  }

  network {
    name   = try(local.hw.network.name[count.index], "eth0")
    bridge = try(local.hw.network.bridge[count.index], "vmbr0")
    ip     = try(local.hw.network.ip[count.index], "dhcp")
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("./templates/inventory.temp")
}