data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "kv" {
  name                          = "${var.prefix}-kv"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = "standard"
  soft_delete_retention_days    = 90
  public_network_access_enabled = false
}



resource "azurerm_key_vault_access_policy" "kpolicy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_container_app.container-app.identity[0].principal_id
  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "azurerm_role_assignment" "acr_pull" {
  role_definition_name = "AcrPull"
  principal_id         = azurerm_container_app.container-app.identity[0].principal_id
  scope                = azurerm_container_registry.acr.id
}


resource "azurerm_private_endpoint" "sql_connection" {
  name                = "${var.prefix}-sql-pe"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.db.id

  private_service_connection {
    name                           = "${var.prefix}-sql-psc"
    private_connection_resource_id = azurerm_mssql_server.sql.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
