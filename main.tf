module "my_oke_cluster" {
  source = "./modules/cluster"

  # Creazione cluster
  compartment_id        = "<compartment_id>"
  kubernetes_version    = "<kubernetes_version>"
  cluster_name          = "<cluster_name>"
  vcn_id                = "<vcn_id>"
  pods_cidr             = "<pods_cidr>"
  services_cidr         = "<services_cidr>"
  service_lb_subnet_ids = ["<service_lb_subnet_id>"]

  # Creazione node pool
  availability_domain_1 = "<availability_domain_1>"
  availability_domain_2 = "<availability_domain_2>"
  availability_domain_3 = "<availability_domain_3>"
  private_subnet_id     = "<private_subnet_id>"
  public_subnet_id      = "<public_subnet_id>"
  node_pool_name        = "<node_pool_name>"
  node_pool_size        = "<node_pool_size>"
  node_ocpus            = "<node_ocpus>"
  node_shape            = "<node_shape>"
  node_memory_in_gbs    = "<node_memory_in_gbs>"
  image_id              = "<image_id>"
  ssh_public_key        = "<ssh_public_key>"
}
