remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    project  = "devops-center-447814"
    location = "us-central1"
    bucket   = "devops-center-447814-terragrunt-bucket-tfstate"
    ## Change the prefix to match the folder structure of your project.
    prefix   = "gke/${path_relative_to_include()}"
  }
}
