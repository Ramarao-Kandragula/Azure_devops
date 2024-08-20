resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                = "traffic-manager"
  resource_group_name = azurerm_resource_group.rg.name
   traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "my-traffic-manager"
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }
}


