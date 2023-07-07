variable "compartment_id" {
  description = "ID del compartment"
  type        = string
}

variable "kubernetes_version" {
  description = "Versione di Kubernetes"
  type        = string
}

variable "cluster_name" {
  description = "Nome del cluster"
  type        = string
}

variable "vcn_id" {
  description = "ID della VCN"
  type        = string
}

variable "pods_cidr" {
  description = "CIDR delle pods"
  type        = string
}

variable "services_cidr" {
  description = "CIDR dei servizi"
  type        = string
}

variable "service_lb_subnet_ids" {
  description = "IDs delle subnet per il bilanciamento del carico del servizio"
  type        = list(string)
}

variable "node_pool_name" {
  description = "Nome del node pool"
  type        = string
}

variable "availability_domain_1" {
  description = "Domain di disponibilità 1"
  type        = string
}

variable "availability_domain_2" {
  description = "Domain di disponibilità 2"
  type        = string
}

variable "availability_domain_3" {
  description = "Domain di disponibilità 3"
  type        = string
}

variable "private_subnet_id" {
  description = "ID della subnet privata"
  type        = string
}

variable "public_subnet_id" {
  description = "ID della subnet pubblica"
  type        = string
}

variable "node_pool_size" {
  description = "Dimensione del node pool"
  type        = number
}

variable "node_shape" {
  description = "Shape del nodo"
  type        = string
}

variable "node_ocpus" {
  description = "Numero di OCPUs del nodo"
  type        = number
}

variable "node_memory_in_gbs" {
  description = "Numero di GBs per la RAM del nodo"
  type        = number
}

variable "image_id" {
  description = "ID dell'immagine del nodo"
  type        = string
}

variable "ssh_public_key" {
  description = "Path alla chiave pubblica da caricare sui nodi"
  type        = string
}