output "cluster_id" {

  value = data.azurerm_kubernetes_cluster.akscluster.id

}




output "subnet_id" {

  value = data.azurerm_subnet.akssubnet.id

}




output "proximity_placement_group_id" {

  value = data.azurerm_proximity_placement_group.aksppg.id

}
