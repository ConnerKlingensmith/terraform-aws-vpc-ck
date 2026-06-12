variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "public_subnet_cidrs" {
  description = "Public subnet cidr blocks"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24"
  ]
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "private_subnet_cidrs" {
  description = "Private subnet cidr blocks"
  type        = list(string)
  deafult = [
    "10.0.10.0/24",
    "10.0.20.0/24",
    "10.0.30.0/24",
    "10.0.40.0/24",
    "10.0.50.0/24",
    "10.0.60.0/24",
    "10.0.70.0/24",
    "10.0.80.0/24"
  ]
}

variable "private_subnet_count" {
  description = "NUmber of private subnets to create"
  type        = number
  default     = 2
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  definition = "One NAT for all private subnets"
  type       = bool
  default    = true
}
variable "enable_dns_hostnames" {
  description = "Enable dns hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "tags" {
  description = "map of common tagsto apply to all resource"
  type        = string
  default     = []
}
