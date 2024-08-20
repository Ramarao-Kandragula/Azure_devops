resource "azurerm_api_management" "apim" {
  name                = "example-apim"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "ExamplePublisher"
  publisher_email     = "publisher@example.com"
  sku_name            = "Developer_1"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_api_management_api" "api" {
  name                = "example-api"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Example API"
  path                = "example-api"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = "https://example.com/swagger.json"
  }
}
