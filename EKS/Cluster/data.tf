data "aws_vpc" "eks_vpc" {
  filter {
    name   = "tag:TFProject"
    values = ["github.com/tampubolon/data-pipeline/eks/vpc"]
  }
}

# Fetch all subnets matching the TFProject tag
data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:TFProject"
    values = ["github.com/tampubolon/data-pipeline/eks/vpc"]
  }

  # Optional: Additional filtering if needed
  filter {
    name   = "tag:Name"
    values = ["Public-Subnet-1", "Public-Subnet-2", "Public-Subnet-3"]
  }
}
