variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0360c520857e3138f" # Ubuntu 24.04 in us-east-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_path" {
  description = "Path to your SSH public key"
  type        = string
  default     = "/home/ubuntu/id_ed25519.pub"
}

variable "instance_name" {
  description = "Tag: Name for the instance"
  type        = string
  default     = "terraform_machine"
}
