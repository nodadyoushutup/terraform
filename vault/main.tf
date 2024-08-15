# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  # version = "0.4.5"

  ###
  # acpi = true
  # agent = {
  #   enabled = false
  #   timeout = "15m"
  #   trim = false
  #   type = "virtio"
  # }
  # audio_device = {
  #   device = "intel-hda"
  #   driver = "spice"
  #   enabled = false
  # }
  # bios = "seabios"
  # boot_order = ["scsi0"]
  # cdrom = {
  #   enabled = false
  #   file_id = "local:iso/TrueNAS-SCALE-24.04.0.iso"
  #   interface = "ide3"
  # }
  # clone = {
  #   datastore_id = "local-lvm"
  #   node_name = "pve"
  #   retries = 5
  #   vm_id = 900
  #   full = true
  # }
  # cpu = {
  #   architecture = "x86_64"
  #   cores = 2
  #   flags = [
  #     # "-aes",
  #     # "-amd-no-ssb",
  #     # "-amd-ssbd",
  #     # "-hv-evmcs",
  #     # "-hv-tlbflush",
  #     # "-ibpb",
  #     # "-md-clear",
  #     # "-pcid",
  #     # "-pdpe1gb",
  #     # "-spec-ctrl",
  #     # "-ssbd",
  #     # "-virt-ssbd"
  #   ]
  #   hotplugged = 0
  #   limit = 0
  #   numa = false
  #   sockets = 1
  #   type = "host"
  #   units = 1024
  #   affinity = null
  # }
  # description = "Test virtual machine"
  disk = [
    {
      aio = "io_uring"
      backup = true
      cache = "none"
      datastore_id = "local-lvm"
      path_in_datastore = null
      discard = "ignore"
      file_format = "qcow2"
      file_id = "local:iso/jammy-server-cloudimg-amd64.img"
      interface = "scsi0"
      iothread = false
      replicate = true
      serial = null
      size = 8
      speed = {
        iops_read = null
        iops_read_burstable = null
        iops_write = null
        iops_write_burstable = null
        read = null
        read_burstable = null
        write = null
        write_burstable = null
      }
      ssd = false
    },
    {
      aio = "io_uring"
      backup = true
      cache = "none"
      datastore_id = "local-lvm"
      path_in_datastore = null
      discard = "ignore"
      file_format = "qcow2"
      file_id = "local:iso/jammy-server-cloudimg-amd64.img"
      interface = "scsi1"
      iothread = false
      replicate = true
      serial = null
      size = 8
      speed = {
        iops_read = null
        iops_read_burstable = null
        iops_write = null
        iops_write_burstable = null
        read = null
        read_burstable = null
        write = null
        write_burstable = null
      }
      ssd = false
    },
    {
      aio = "io_uring"
      backup = true
      cache = "none"
      datastore_id = "local-lvm"
      path_in_datastore = null
      discard = "ignore"
      file_format = "qcow2"
      file_id = "local:iso/jammy-server-cloudimg-amd64.img"
      interface = "scsi3"
      iothread = false
      replicate = true
      serial = null
      size = 8
      speed = {
        iops_read = null
        iops_read_burstable = null
        iops_write = null
        iops_write_burstable = null
        read = null
        read_burstable = null
        write = null
        write_burstable = null
      }
      ssd = false
    }
  ]
  
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
  
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.101/24"
        gateway = "192.168.1.1"
      }
    }
    user_account = {
      username = local.virtual_machine.username
      password = local.virtual_machine.password
      keys = []
    }
  }

  memory = {
    dedicated = 8192
  }
}

