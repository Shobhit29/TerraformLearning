terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.res_group["name"]
  location = var.res_group["location"]
}

resource "azurerm_cosmosdb_account" "db" {
  name = var.dbname
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  offer_type = "Standard"
  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Eventual"
  }
  geo_location {
    location = azurerm_resource_group.rg.location
    failover_priority = 0
  }
  capabilities {
    name = "EnableCassandra"
  }
}


