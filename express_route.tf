resource "azurerm_express_route_circuit" "express_route" {
  name                  = "express-route-circuit"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_provider_name = "YourServiceProvider"
  peering_location      = "YourPeeringLocation"
  bandwidth_in_mbps     = 200

  sku {
    tier   = "Standard"
    family = "MeteredData"
  }
}

