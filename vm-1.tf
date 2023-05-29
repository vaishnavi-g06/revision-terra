resource "azurerm_linux_virtual_machine" "demo-vm1" {
  name                = "demo-vm1"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.ntw-int.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/demo_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}

resource "null_resource" "ssh_into_vm" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.pub-ip.ip_address
      user        = "adminuser"
      password    = "Password1234!"
      agent       = false
      private_key = file("~/.ssh/demo_key")
    }

    inline = [
      "echo 'Hello from the remote-exec provisioner!'"
    ]
  }
}
output "public_ip_address" {
  value = azurerm_public_ip.pub-ip.ip_address
}
