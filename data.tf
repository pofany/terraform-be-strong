//SQL Server
resource "azurerm_mssql_server" "sql" {
  name                         = "bestrongsqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}


//SQL DB
resource "azurerm_mssql_database" "db" {
  name        = "${var.prefix}sqldb"
  server_id   = azurerm_mssql_server.sql.id
  sku_name    = "S0"
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 10
}


//Storage Account for user's files
resource "azurerm_storage_account" "storage" {
  name                     = "bestrongstorageacct"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileshare" {
  name               = "userfiles"
  storage_account_id = azurerm_storage_account.storage.id
  quota              = 100
}