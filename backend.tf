terraform {
  backend "s3" {
    bucket         = "my-s3-busketstate-eks2000"
    key            = "eks-cluster-praveen/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table1"
  }
}
