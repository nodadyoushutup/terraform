# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  # version = "0.2.10"

  ###
  acpi = true
  agent = {
    enabled = false
    timeout = "15m"
    trim = false
    type = "virtio"
  }
  audio_device = {
    device = "intel-hda"
    driver = "spice"
    enabled = false
  }
  bios = "seabios"
  boot_order = ["scsi0"]
  cdrom = {
    enabled = false
    file_id = "local:iso/TrueNAS-SCALE-24.04.0.iso"
    interface = "ide3"
  }
  # clone = {
  #   datastore_id = "local-lvm"
  #   node_name = "pve"
  #   retries = 5
  #   vm_id = 900
  #   full = true
  # }
  cpu = {
    architecture = "x86_64"
    cores = 2
    flags = [
      # "-aes",
      # "-amd-no-ssb",
      # "-amd-ssbd",
      # "-hv-evmcs",
      # "-hv-tlbflush",
      # "-ibpb",
      # "-md-clear",
      # "-pcid",
      # "-pdpe1gb",
      # "-spec-ctrl",
      # "-ssbd",
      # "-virt-ssbd"
    ]
    hotplugged = 0
    limit = 0
    numa = false
    sockets = 1
    type = "host"
    units = 1024
    affinity = null
  }
  
  ###
  vm = {
    id = "101"
    name = "vault"
    tags = ["terraform", "vault"]
    node_name = "pve"
    on_boot = false
    started = false
    stop_on_destroy = true
  }
  
  # initialization = {
  #   ip_config = {
  #     ipv4 = {
  #       address = "192.168.1.101/24"
  #       gateway = "192.168.1.1"
  #     }
  #   }
  #   user_account = {
  #     username = local.virtual_machine.username
  #     password = local.virtual_machine.password
  #     keys = []
  #   }
  # }

  disk = {
    datastore_id = "local-lvm"
    file_id = "local:iso/jammy-server-cloudimg-amd64.img"
    interface = "scsi0"
    discard = "on"
    size = 50
    ssd = true
  }

  memory = {
    dedicated = 8192
  }
}

