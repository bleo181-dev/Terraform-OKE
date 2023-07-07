# Codice Terraform per la creazione di un cluster Oracle Kubernetes Engine (OKE)

Questo codice Terraform è stato progettato per creare un cluster OKE (Oracle Kubernetes Engine) sulla piattaforma Oracle Cloud Infrastructure (OCI). Si presume che l'infrastruttura di rete necessaria sia già presente su OCI.

## Stato finale dell'infrastruttura

Il modulo Terraform si occupa di configurare le seguenti risorse:

### `oci_containerengine_cluster`
- Un cluster OKE con le seguenti caratteristiche:
  - Compartimento di destinazione: `<compartment_id>`
  - Versione di Kubernetes: `<kubernetes_version>`
  - Nome del cluster: `<cluster_name>`
  - VCN di appartenenza: `<vcn_id>`
  - Configurazione dell'endpoint:
    - IP pubblico abilitato: `true`
    - Subnet per l'endpoint: `<public_subnet_id>`
  - Opzioni addizionali:
    - Dashboard di Kubernetes abilitata: `false`
    - Tiller abilitato: `false`
    - Configurazione di rete di Kubernetes:
      - CIDR per i pods: `<pods_cidr>`
      - CIDR per i servizi: `<services_cidr>`
    - Subnet per il bilanciatore di servizio: `<service_lb_subnet_ids>`

### `oci_containerengine_node_pool`
- Un pool di nodi all'interno del cluster OKE con le seguenti caratteristiche:
  - ID del cluster di appartenenza: `<cluster_id>`
  - Compartimento di destinazione: `<compartment_id>`
  - Versione di Kubernetes: `<kubernetes_version>`
  - Nome del pool di nodi: `<node_pool_name>`
  - Chiave pubblica SSH per l'accesso ai nodi: `<ssh_public_key>`
  - Configurazione dei nodi:
    - Configurazione di posizionamento (per tre availability domain):
      - Availability domain 1: `<availability_domain_1>`
      - Availability domain 2: `<availability_domain_2>`
      - Availability domain 3: `<availability_domain_3>`
      - Subnet di destinazione: `<private_subnet_id>`
    - Dimensione del pool di nodi: `<node_pool_size>`
  - Configurazione della forma dei nodi:
    - OCPUs per nodo: `<node_ocpus>`
    - Memoria in GB per nodo: `<node_memory_in_gbs>`
  - Dettagli della sorgente del nodo:
    - ID dell'immagine: `<image_id>`
    - Tipo di sorgente: `image`
  - Etichetta iniziale per il nodo: `name = "<cluster_name>"`

Ricorda che i valori tra `<...>` devono essere sostituiti con i dati di configurazione specifici del tuo ambiente OCI.

# Variabili

Il modulo richiede le seguenti variabili per configurare correttamente il cluster OKE:

## Cluster

### `compartment_id`

- Descrizione: ID del compartment (compartment di destinazione).
- Tipo: string.

### `kubernetes_version`

- Descrizione: Versione di Kubernetes per il cluster.
- Tipo: string.

### `cluster_name`

- Descrizione: Nome del cluster.
- Tipo: string.

### `vcn_id`

- Descrizione: ID della VCN (Virtual Cloud Network) in cui creare il cluster.
- Tipo: string.

### `pods_cidr`

- Descrizione: CIDR (Classless Inter-Domain Routing) per le pods del cluster.
- Tipo: string.

### `services_cidr`

- Descrizione: CIDR per i servizi del cluster.
- Tipo: string.

### `service_lb_subnet_ids`

- Descrizione: Lista degli IDs delle subnet per il bilanciamento del carico del servizio.
- Tipo: list(string).

## Node Pool

### `node_pool_name`

- Descrizione: Nome del node pool.
- Tipo: string.

### `availability_domain_1`

- Descrizione: Domain di disponibilità 1 per il posizionamento dei nodi del pool.
- Tipo: string.

### `availability_domain_2`

- Descrizione: Domain di disponibilità 2 per il posizionamento dei nodi del pool.
- Tipo: string.

### `availability_domain_3`

- Descrizione: Domain di disponibilità 3 per il posizionamento dei nodi del pool.
- Tipo: string.

### `private_subnet_id`

- Descrizione: ID della subnet privata in cui posizionare i nodi del pool.
- Tipo: string.

### `public_subnet_id`

- Descrizione: ID della subnet pubblica per l'endpoint del cluster.
- Tipo: string.

### `node_pool_size`

- Descrizione: Dimensione del node pool (numero di nodi).
- Tipo: number.

### `node_shape`

- Descrizione: Shape del nodo nel node pool.
- Tipo: string.

### `node_ocpus`

- Descrizione: Numero di OCPUs (Oracle Compute Units) per nodo.
- Tipo: number.

### `node_memory_in_gbs`

- Descrizione: Quantità di memoria in GBs per nodo.
- Tipo: number.

### `image_id`

- Descrizione: ID dell'immagine del nodo.
- Tipo: string.

### `ssh_public_key`

- Descrizione: Percorso alla chiave pubblica SSH da caricare sui nodi del cluster.
- Tipo: string.

Assicurati di impostare i valori delle variabili correttamente prima di eseguire il codice Terraform.
