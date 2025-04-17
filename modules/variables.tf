
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.0.11.0/24"
}

variable "private_subnet_2_cidr" {
  type    = string
  default = "10.0.12.0/24"
}

variable "ami_id" {
  type    = string
  default = "ami-084568db4383264d4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "db_username" {
  type        = string
  default     = "usecase"
  description = "Username for the database"
}

variable "db_password" {
  type        = string
  sensitive   = true
  default     = "admin@123"
  description = "Password for the database"
}

variable "db_instance_type" {
  type        = string
  default     = "db.t2.micro"
  description = "Instance type for the RDS instance"
}
