
# This is an example of building an LXC -Linux Container- in Proxmox Using a template OS.

resource "proxmox_lxc" "tf-test" {
  features {
    nesting = true
  }
  target_node  = "pve"
  hostname     = "tf-var-test"
  cores = 1
  memory = "1024"
  swap = "512"
  ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  password     = "123456"
  unprivileged = true
  onboot = true
  start = true
  vmid = 905

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr1"
    ip     = "172.16.0.210/24"
  }
}

