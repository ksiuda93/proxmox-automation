provider "proxmox" {
    pm_api_url = var.proxmox_host["pm_api_url"]
    pm_user = var.proxmox_host["pm_user"]
    pm_password = var.proxmox_host["pm_password"]
    pm_debug = true
    pm_tls_insecure = true
}


resource "proxmox_vm_qemu" "resource-name" {
  name        = "tf-test"
  target_node = "asgard"
  full_clone = true
  clone = "cloud-init-kinetic"
}