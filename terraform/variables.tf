variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "cluster_name" {
  type    = string
  default = "capstone"
}

# Check what is current and in STANDARD support (extended support costs 6x more):
#   aws eks describe-cluster-versions --region eu-west-1 --query 'clusterVersions[].[clusterVersion,status]' --output table
variable "kubernetes_version" {
  type    = string
  default = "1.34"
}

variable "node_instance_type" {
  type    = string
  default = "t3.large" # 2 vCPU / 8 GiB. Voting app + Robot Shop + monitoring needs ~3 of these.
}

variable "node_desired_size" {
  type    = number
  default = 3
}

variable "node_min_size" {
  type    = number
  default = 3
}

variable "node_max_size" {
  type    = number
  default = 5
}

# "owner/repo" of YOUR fork, e.g. "toluwalase/example-voting-app". Leave "" to skip the GitHub Actions role.
variable "github_repo" {
  type    = string
  default = ""
}

# An AWS account can only have ONE GitHub OIDC provider. Set false if one already exists.
variable "create_github_oidc_provider" {
  type    = bool
  default = true
}

# Optional cost alarm. Leave "" to skip.
variable "budget_email" {
  type    = string
  default = ""
}

variable "budget_usd" {
  type    = number
  default = 60
}
