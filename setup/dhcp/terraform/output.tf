# output "public" {
#     value = proxmox_lxc.private ? {
#         bridge = try(local.hw.network.bridge[count.index], "vmbr0")
#         ip     = try(local.hw.network.ip[count.index], "dhcp")
#     }: null
      
  
# }

# output "private" {
#      value = proxmox_lxc.private ? {

#      }: null
    
# }
