module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.CLUSTER_NAME
  cluster_version = "1.29"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true


  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  # eks_managed_node_group_defaults = {
  #   disk_size = 20
  #   instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  # }

  eks_managed_node_groups = {
    fiap_tech = {
      min_size     = 1
      max_size     = 4
      desired_size = 1
      vpc_security_group_ids = [aws_security_group.ssh_cluster.id]
      instance_types = ["t2.large"]
      capacity_type  = "SPOT"
    }
  }

  enable_cluster_creator_admin_permissions = true

  tags = {
      Environment = "dev"
      Terraform   = "true"
  }
}

# resource "aws_iam_role" "fiap_tech_eks_node_group" {
#   name = "fiap_tech-eks-node-group"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect    = "Allow"
#         Action    = "kms:GenerateDataKey"
#         Resource  = aws_kms_key.fiap_sqs_key.arn
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "attach_additional_policy" {
#   role       = aws_iam_role.fiap_tech_eks_node_group.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"  # Substitua pela ARN da política desejada
# }