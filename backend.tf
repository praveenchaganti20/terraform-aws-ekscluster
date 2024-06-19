terraform {
  backend "s3" {
    bucket         = "eks-cluster-state-2002"
    key            = "eks-cluster-chagan/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-cluster1-statefile"
  }
}
