terraform {
  backend "s3" {
    bucket         = "my-s3-busketstate-eks2111"
    key            = "eks-cluster-prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table2"
  }
}
