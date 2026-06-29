locals {
  common_tags = {
    project_name = var.project_name
    env = var.environment
    owner = var.owner
    managed_by = "terraform"
    architecture = "serverless-order-processing"
  }
}