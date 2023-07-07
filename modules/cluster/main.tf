terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.3.0"
    }
  }
  required_version = ">= 1.0.0"
}

resource "oci_containerengine_cluster" "oke_cluster" {
  # Required
  compartment_id     = var.compartment_id
  kubernetes_version = var.kubernetes_version
  name               = var.cluster_name
  vcn_id             = var.vcn_id

  # vcn-native cluster
  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = var.public_subnet_id
  }

  # Optional
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }
    kubernetes_network_config {
      pods_cidr     = var.pods_cidr
      services_cidr = var.services_cidr
    }
    service_lb_subnet_ids = var.service_lb_subnet_ids
  }
}

resource "oci_containerengine_node_pool" "oke_node_pool" {
  # Required
  cluster_id         = oci_containerengine_cluster.oke_cluster.id
  compartment_id     = var.compartment_id
  kubernetes_version = var.kubernetes_version
  name               = var.node_pool_name

  ssh_public_key = var.ssh_public_key

  node_config_details {
    placement_configs {
      availability_domain = var.availability_domain_1
      subnet_id           = var.private_subnet_id
    }
    placement_configs {
      availability_domain = var.availability_domain_2
      subnet_id           = var.private_subnet_id
    }
    placement_configs {
      availability_domain = var.availability_domain_3
      subnet_id           = var.private_subnet_id
    }
    size = var.node_pool_size
  }

  node_shape = var.node_shape
  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory_in_gbs
  }

  node_source_details {
    image_id    = var.image_id
    source_type = "image"
  }

  # Optional
  initial_node_labels {
    key   = "name"
    value = var.cluster_name
  }
}
