resource "azurerm_databricks_workspace" "example" {
  name                = "${var.environment}-${random_string.naming.result}-ws"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "premium"
  tags                = local.tags
  managed_resource_group_name = "${local.prefix}-managed-rg"
  
  custom_parameters {
    virtual_network_id                                   = azurerm_virtual_network.this.id
    private_subnet_name                                  = azurerm_subnet.private.name
    public_subnet_name                                   = azurerm_subnet.public.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private.id
    storage_account_name                                 = local.adls_name
  }
  # We need this, otherwise destroy doesn't cleanup things correctly
  depends_on = [
    azurerm_subnet_network_security_group_association.public,
    azurerm_subnet_network_security_group_association.private
  ]
}