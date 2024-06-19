 execute those commands in PowerShell:

Download IAM Policy:

## Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json" -OutFile "iam_policy.json"
Create IAM Policy:

## aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam_policy.json
Create IAM Role (Assuming you have eksctl installed and configured):

## eksctl create iamserviceaccount `
   --cluster=<your-cluster-name> `
   --namespace=kube-system `
   --name=aws-load-balancer-controller `
   --role-name AmazonEKSLoadBalancerControllerRole `
   --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy `
   --approve

Add Helm Repo:
### helm repo add eks https://aws.github.io/eks-charts
Update the Helm Repo:

## helm repo update

install:
##helm install aws-load-balancer-controller eks/aws-load-balancer-controller `
   -n kube-system `
   --set clusterName=<your-cluster-name> `
   --set serviceAccount.create=false `
   --set serviceAccount.name=aws-load-balancer-controller `
   --set region=<region> `
   --set vpcId=<your-vpc-id>
Verify Deployments:
## kubectl get deployment -n kube-system aws-load-balancer-controller

