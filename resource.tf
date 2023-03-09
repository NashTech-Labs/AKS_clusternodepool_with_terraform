data "azurerm_kubernetes_cluster" "akscluster" {

  name                = var.aks_cluster_name

  resource_group_name = var.resource_group_name

}




data "azurerm_subnet" "akssubnet" {

  name                 = var.aks_subnet_name

  virtual_network_name = var.aks_vnet_name

  resource_group_name  = var.resource_group_name

}




data "azurerm_proximity_placement_group" "aksppg" {

  name                = var.ppg_name

  resource_group_name = var.resource_group_name

}




resource "azurerm_kubernetes_cluster_node_pool" "appnodepool" {

  for_each = var.node_pools

  name                             = each.key

  kubernetes_cluster_id            = data.azurerm_kubernetes_cluster.akscluster.id

  node_count                    = each.value.node_count

  vm_size                       = each.value.vm_size

  os_type                          = each.value.os_type

  os_disk_size_gb               = each.value.os_disk_size_gb

  os_disk_type                     = each.value.os_disk_type

  vnet_subnet_id                = data.azurerm_subnet.akssubnet.id

  enable_auto_scaling           = each.value.enable_auto_scaling

  max_count                     = each.value.max_count

  min_count                     = each.value.min_count

  max_pods                         = each.value.max_pods

  node_taints                   = each.value.node_taints

  node_labels                   = each.value.node_labels

  mode                          = each.value.mode

  proximity_placement_group_id  = each.value.proximity_placement_group_id




  depends_on = [

    data.azurerm_kubernetes_cluster.akscluster,

    data.azurerm_subnet.akssubnet,

    data.azurerm_proximity_placement_group.aksppg,

  ]

}
