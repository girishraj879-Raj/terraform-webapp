resource "azurerm_resource_group" "example" {
  name     = "rg-terraform-demo"
  location = "East US"
}

resource "azurerm_service_plan" "example" {
  name                = "terraform-appservice-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  os_type  = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "terraform-demo-webapp-001"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}