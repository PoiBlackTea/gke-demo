terraform {
  source = "${path_relative_from_include("root")}//modules//private-cluster"
}

locals {
  ## if read_terragrunt_config can't find the file in file system will return second parameter 
  common_inputs = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"), { inputs = {} })
  ## Node pool setting
  node_pool_settings = read_terragrunt_config("node_pools.hcl", { inputs = {} })
  ## Dynamic node pool setting
  #   node_pool_settings_dynamics = read_terragrunt_config("node_pools_dynamic.hcl", { inputs = {} })
  ## Controler the master netowrk 
  master_authorized_network = read_terragrunt_config("master_authorized_networks.hcl", { inputs = {} })
  ## project related variable
  env_vars      = yamldecode(file("${find_in_parent_folders("env_vars.yaml")}"))

  ## get parent folder name as project id
  parent_folder = "${get_terragrunt_dir()}/../"
  project_id = basename(dirname(local.parent_folder))
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}


inputs = merge(
  ## load external terraform inputs
  local.node_pool_settings.inputs,
  local.master_authorized_network.inputs,
  local.node_pool_settings_dynamics.inputs,
  {

  ## Common project setting
  project_id = local.project_id
  region     = "us-central1"

  ## GKE cluster setting
  release_channel                      = ""
  kubernetes_version                   = ""
  cluster_name_suffix                  = ""
  zones                                = ["us-central1-c"]
  network                              = ""
  ## If use cross project shared vpc need specify network project id
  network_project_id                   = "<PROJECT_ID>"
  subnetwork                           = ""
  subnetwork_region                    = ""
  ip_range_pods                        = ""
  ip_range_services                    = ""
  master_ipv4_cidr_block               = "172.16.0.144/28"
  enable_private_endpoint              = true
  enable_private_nodes                 = true
  deletion_protection                  = false
  service_external_ips                 = false
  cluster_resource_labels              = { team = "demo"}

  ## grant service registry access
  grant_registry_access                = true
  ## When grant_registry_access is true, registry_project_ids must be set, the storage viewer and artifectregisitry.reader role will be associated to service account in specific project
  registry_project_ids                 = ["<PROJECT_ID>", local.project_id]

  ## Optional Setting 
  gateway_api_channel                  = "CHANNEL_STANDARD"
  http_load_balancing                  = true
  horizontal_pod_autoscaling           = true
  enable_vertical_pod_autoscaling      = true
  filestore_csi_driver                 = true
  gcs_fuse_csi_driver                  = true
  gke_backup_agent_config              = true
  datapath_provider                    = "ADVANCED_DATAPATH"
    
  }
)