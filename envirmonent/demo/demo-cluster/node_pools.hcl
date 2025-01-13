inputs = {
    node_pools = [
        {
            name = "demo-node-pool"
            machine_type = "e2-micro"
            min_count = 1
            max_count = 1
        }
    ]
    # gke resource labels
    node_pools_resource_labels = {
        all = {
            "env" = "demo"
        }
        default-node-pool = {
            "env" = "demo"
        }
    }
    # kubernetes node labels for node selector
    node_pools_labels = {
        all = {
            "env" = "demo"
        }
        default-node-pool = {
            "env" = "demo"
        }
    }

    node_pools_taints = {
        all = {
            
        }
        default-node-pool = {
            "env" = "demo"
        }
    }
}
