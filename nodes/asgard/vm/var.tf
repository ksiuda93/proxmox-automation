variable "proxmox_host" {
    type = map
    default = {
        pm_api_url = "https://192.168.1.10:8006/api2/json"
        pm_user = ""
        pm_password = ""
     }
}