output "rg_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_app_id" {
  description = "ID of the App Subnet"
  value       = azurerm_subnet.app.id
}

output "subnet_db_id" {
  description = "ID of the DB Subnet"
  value       = azurerm_subnet.db.id
}

output "subnet_storage_id" {
  description = "ID of the Storage Subnet"
  value       = azurerm_subnet.storage.id
}


output "sql_database_name" {
  description = "Name of the SQL Database"
  value       = azurerm_mssql_database.db.name
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = azurerm_storage_account.storage.name
}
