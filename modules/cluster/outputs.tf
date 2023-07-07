# Outputs for k8s cluster
output "cluster_name" {
  description = "Nome del cluster"
  value       = oci_containerengine_cluster.oke_cluster.name
}

output "cluster_OCID" {
  description = "OCID del cluster"
  value       = oci_containerengine_cluster.oke_cluster.id
}

output "cluster_kubernetes_version" {
  description = "Versione di Kubernetes del cluster"
  value       = oci_containerengine_cluster.oke_cluster.kubernetes_version
}

output "cluster_state" {
  description = "Stato del cluster"
  value       = oci_containerengine_cluster.oke_cluster.state
}

# Outputs for k8s node pool
output "node_pool_name" {
  description = "Nome del node pool"
  value       = oci_containerengine_node_pool.oke_node_pool.name
}

output "node_pool_OCID" {
  description = "OCID del node pool"
  value       = oci_containerengine_node_pool.oke_node_pool.id
}

output "node_pool_kubernetes_version" {
  description = "Versione di Kubernetes del node pool"
  value       = oci_containerengine_node_pool.oke_node_pool.kubernetes_version
}

output "node_size" {
  description = "Dimensione del node pool"
  value       = oci_containerengine_node_pool.oke_node_pool.node_config_details[0].size
}

output "node_shape" {
  description = "Shape dei nodi del node pool"
  value       = oci_containerengine_node_pool.oke_node_pool.node_shape
}
