
resource "proxmox_lxc" "wire_guard" {

  hostname = local.hw.name
  cores = local.hw.cpu
  memory = local.hw.memory
  swap = try(local.hw.swap, 512)

  target_node = "proxmox"
  ostemplate = "local:vztmpl/${local.template.name}-${local.template.version}-standard_${local.template.version}-1_amd64.tar.gz"
  ssh_public_keys = <<EOF
    %{ for s in local.ssh}
      ${ s }
    %{ endfor }
  EOF

  unprivileged = local.hw.unprivileged ? true : false

  onboot = try(local.system.onboot, false)
  start = try(local.system.start, false)

  rootfs {
    storage = local.disk.storage
    size    = local.disk.size
  }

  network {
    name   = try(local.hw.network.name, "eth0")
    bridge = try(local.hw.network.bridge, "vmbr0")
    ip     = try(local.hw.network.ip, "dhcp")
  }
}

# resource "local_file" "ansible_inventory" {
#   content = templatefile("./templates/inventory.temp")
# }