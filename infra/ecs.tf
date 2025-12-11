module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "5.7.0"

  cluster_name = "simpletimecluster"
}
