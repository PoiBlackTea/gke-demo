remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    project  = "<PROJECT_ID>"
    location = "us-central1"
    bucket   = "<PROJECT_ID>-terragrunt-bucket-tfstate"
    ## Change the prefix to match the folder structure of your project.
    prefix   = "gke/${path_relative_to_include()}"
  }
}
