terraform {
  backend "azurerm" {
    resource_group_name  = "chatbot-170-tfstate-rg"
    storage_account_name = "chatbot170tfstatestor"
    container_name       = "tfstate"
    key                  = "tf0.11.3.tfstate"
  }
}

resource "azurerm_resource_group" "dev" {
  name     = "amido-uks-cb170-rg-bot-dev"
  location = "UK South"
}

resource "azurerm_storage_account" "dev" {
  name                     = "amidoukscb170"
  resource_group_name      = "${azurerm_resource_group.dev.name}"
  location                 = "${azurerm_resource_group.dev.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_blob_encryption   = "true"

  tags {
    environment = "Development"
  }
}

resource "azurerm_storage_table" "dev" {
  name                 = "development"
  resource_group_name  = "${azurerm_resource_group.dev.name}"
  storage_account_name = "${azurerm_storage_account.dev.name}"
}
