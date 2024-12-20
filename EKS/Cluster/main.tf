locals {
  vpc_id         = data.aws_vpc.eks_vpc.id
  public_subnets = data.aws_subnets.public_subnets.ids

  default_tags = {
    Environment = "development"
    Owner       = "infrastructure-team"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/eks/cluster"
  }
}

# Create an EKS cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = "martinus-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = local.public_subnets
  }

  tags = merge({
    Name = "martinus-eks-cluster"
    }, local.default_tags
  )
}

# Create the IAM role for the EKS cluster
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Attach policies to the EKS cluster role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Create a worker node IAM role
resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}


# Create a security group for the EKS cluster
resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  description = "Security group for the EKS cluster"
  vpc_id      = local.vpc_id
}

# Allow inbound and outbound traffic for the EKS cluster security group
resource "aws_security_group_rule" "eks_cluster_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["27.131.250.11/32"]
  security_group_id = aws_security_group.eks_cluster_sg.id
}

resource "aws_security_group_rule" "eks_cluster_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["27.131.250.11/32"]
  security_group_id = aws_security_group.eks_cluster_sg.id
}