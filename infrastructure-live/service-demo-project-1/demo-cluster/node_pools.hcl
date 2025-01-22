inputs = {
    node_pools = [
        {
            name                        = "default-node-pool"
            machine_type                = "e2-standard-4"
            node_locations              = "us-central1-c"
            min_count                   = 1
            max_count                   = 1
            local_ssd_count             = 0
            spot                        = true
            disk_size_gb                = 100
            disk_type                   = "pd-standard"
            image_type                  = "COS_CONTAINERD"
            enable_gcfs                 = true
            # enable_gvnic                = false
            # logging_variant             = "DEFAULT"
            auto_repair                 = true
            auto_upgrade                = true
            service_account             = "gke-node-pool@service-demo-project-1.iam.gserviceaccount.com"
            # preemptible                 = false
            initial_node_count          = 1
            # accelerator_count           = 1
            # accelerator_type            = "nvidia-l4"
            # gpu_driver_version          = "LATEST"
            # gpu_sharing_strategy        = "TIME_SHARING"
            # max_shared_clients_per_gpu = 2
        },
        # {
        #     name                        = "default-node-pool1"
        #     machine_type                = "e2-medium"
        #     node_locations              = "us-central1-c"
        #     min_count                   = 1
        #     max_count                   = 1
        #     local_ssd_count             = 0
        #     spot                        = true
        #     disk_size_gb                = 100
        #     disk_type                   = "pd-standard"
        #     image_type                  = "COS_CONTAINERD"
        #     enable_gcfs                 = true
        #     # enable_gvnic                = false
        #     # logging_variant             = "DEFAULT"
        #     auto_repair                 = true
        #     auto_upgrade                = true
        #     service_account             = "gke-node-pool@service-demo-project-1.iam.gserviceaccount.com"
        #     # preemptible                 = false
        #     initial_node_count          = 1
        #     # accelerator_count           = 1
        #     # accelerator_type            = "nvidia-l4"
        #     # gpu_driver_version          = "LATEST"
        #     # gpu_sharing_strategy        = "TIME_SHARING"
        #     # max_shared_clients_per_gpu = 2
        # }
    ]
    # gke resource labels
    node_pools_resource_labels = {
        all = {
            
        }
        default-node-pool = {
            "env" = "demo"
        }
        # default-node-pool1 = {
        #     "env" = "demo1"
        # }
    }
    # kubernetes node labels for node selector
    node_pools_labels = {
        all = {
            
        }
        default-node-pool = {
            "env" = "demo"
        }
        # default-node-pool1 = {
        #     "env" = "demo1"
        # }
    }

    node_pools_taints = {
      all = []

      default-node-pool = [
        {
          key    = "default-node-pool"
          value  = true
          effect = "PREFER_NO_SCHEDULE"
        },
      ]
      # default-node-pool1 = [
      #   {
      #     key    = "default-node-pool1"
      #     value  = true
      #     effect = "PREFER_NO_SCHEDULE"
      #   },
      # ]
    }
}
