#!/bin/bash
VM_ID="9000"
OS_REPO="http://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64.img"
OS_VERSION="kinetic-server-cloudimg-amd64.img"
VM_TEMPLATE_NAME="cloud-init-kinetic"



wget ${OS_REPO}

qm create 9000 --memory 4096 --net0 virtio,bridge=vmbr0 --sockets 1 --cores 2 --vcpu 2  -hotplug network,disk,cpu,memory --agent 1 --name ${VM_TEMPLATE_NAME} --ostype l26
qm importdisk $VM_ID ${OS_VERSION} local-lvm
qm set $VM_ID --scsihw virtio-scsi-pci --virtio0 local-lvm:vm-$VM_ID-disk-0
qm set $VM_ID --ide2 local-lvm:cloudinit
qm set $VM_ID --boot c --bootdisk virtio0
qm set $VM_ID --serial0 socket
qm template $VM_ID