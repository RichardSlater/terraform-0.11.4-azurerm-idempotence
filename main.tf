terraform {
  backend "azurerm" {
    resource_group_name  = "chatbot-170-tfstate-rg"
    storage_account_name = "chatbot170tfstatestor"
    container_name       = "tfstate"
    key                  = "tf0.11.3.tfstate"
  }
}

resource "azurerm_resource_group" "dev" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_key_vault" "dev" {
  name                = "${var.key_vault_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
    name = "standard"
  }

  tenant_id = "${var.aad_tenant_id}"

  access_policy {
    tenant_id = "${var.aad_tenant_id}"
    object_id = "${var.user_object_id}"

    key_permissions = []

    secret_permissions = [
      "get",
    ]
  }

  tags {
    environment = "Development"
  }
}

resource "azurerm_storage_account" "dev" {
  name                     = "${var.storage_acct_name}"
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
