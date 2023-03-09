variable "environmentKey" {

  type        = string

  default     = "ENG"

  description = "Optional Input - Value to describe the environment. Used for tagging. (Default: ENG)"

}




variable "aks_cluster_name" {

  description = "Name of the AKS Cluster where node pool will be deployed."

  type        = string

}




variable "resource_group_name" {

  description = "Name of the resource group to create the AKS Cluster node pool in."

  type        = string

}




variable "aks_subnet_name" {

  description = "Name of the Subnet to which node pool will be attached."

  type        = string

}




variable "aks_vnet_name" {

  description = "Name of the VNet where the subnet is present."

  type        = string

}




variable "ppg_name" {

  description = "Name of the PPG to create the AKS Cluster node pool in."

  type        = string

}




variable "node_pools" {

  type = map(object({

    node_count                    = number

    vm_size                       = string

    os_type                       = string

    os_disk_size_gb               = number

    os_disk_type                  = string

    enable_auto_scaling           = bool

    max_count                     = number

    min_count                     = number

    max_pods                      = number

    node_taints                   = list(string)

    node_labels                   = map(string)

    mode                          = string

    proximity_placement_group_id  = string

  }))

}
